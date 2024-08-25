--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tracker; Type: SCHEMA; Schema: -; Owner: projects
--

CREATE SCHEMA tracker;


ALTER SCHEMA tracker OWNER TO projects;

--
-- Name: SCHEMA tracker; Type: COMMENT; Schema: -; Owner: projects
--

COMMENT ON SCHEMA tracker IS 'episode tracker';


--
-- Name: show_source; Type: TYPE; Schema: tracker; Owner: projects
--

CREATE TYPE tracker.show_source AS ENUM (
    'other',
    'epguides.com',
    'en.wikipedia.org',
    'thetvdb.com',
    'themoviedb.org'
);


ALTER TYPE tracker.show_source OWNER TO projects;

--
-- Name: TYPE show_source; Type: COMMENT; Schema: tracker; Owner: projects
--

COMMENT ON TYPE tracker.show_source IS '
https://epguides.com/Ridiculousness/
https://www.thetvdb.com/series/ridiculousness/seasons/official/<31..n>
https://en.wikipedia.org/wiki/List_of_Ridiculousness_episodes_(season_21%E2%80%93present)
https://www.themoviedb.org/tv/38657-ridiculousness/season/37?language=en-CA';


--
-- Name: from_roman(text); Type: FUNCTION; Schema: tracker; Owner: projects
--

CREATE FUNCTION tracker.from_roman(roman text) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE SECURITY DEFINER
    AS $$
  DECLARE num int4;
BEGIN

  SELECT SUM(r) INTO num FROM (
    WITH roman AS (
      SELECT l,v 
      FROM (VALUES ('M',1000),('D',500),('C',100),('L',50),('X',10),('V',5),('I',1)) AS t(l,v)
    )
    SELECT 
    CASE WHEN v<LAG(v,1) OVER () THEN -v ELSE v END AS r
    FROM REGEXP_SPLIT_TO_TABLE(REVERSE(roman), '') AS l
    JOIN roman USING (l)
  );
  
    
  RETURN num;
END

$$;


ALTER FUNCTION tracker.from_roman(roman text) OWNER TO projects;

--
-- Name: from_roman_for(text); Type: FUNCTION; Schema: tracker; Owner: projects
--

CREATE FUNCTION tracker.from_roman_for(roman text) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE SECURITY DEFINER
    AS $_$
  DECLARE 
    cv int4 = 0; pv int4 = 0; len int4; acc int4 = 0;
    ch char;
    mul tracker.hstore = 'M=>1000, D=>500, C=>100, L=>50, X=>10, V=>5, I=>1';
BEGIN
  len = LENGTH(roman);
  
  IF len = 0 THEN RETURN NULL;
  ELSEIF len = 1 THEN RETURN mul[roman]; 
  ELSEIF roman ~* '^M{0,3}(CM|CD|D?C{0,3})?(XC|XL|L?X{0,3})?(IX|IV|V?I{0,3})?$' THEN
    FOREACH ch IN ARRAY STRING_TO_ARRAY(REVERSE(roman), NULL)                             
    LOOP
      cv = mul[ch];
      IF cv < pv THEN acc = acc-cv; ELSE acc = acc + cv; END IF;
      pv = cv;
    END LOOP;
    
    RETURN acc;
  END IF;
    

  RETURN NULL;
END

$_$;


ALTER FUNCTION tracker.from_roman_for(roman text) OWNER TO projects;

--
-- Name: roman_to_int(text); Type: FUNCTION; Schema: tracker; Owner: projects
--

CREATE FUNCTION tracker.roman_to_int(roman text) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE SECURITY DEFINER
    AS $$
  DECLARE num INT;
BEGIN

  WITH RECURSIVE acc(l,n,r,tot) AS (
    SELECT l,n,r,n::int4 FROM num WHERE r=1
    UNION ALL
    SELECT num.l,
    num.n,
    num.r,
    CASE WHEN num.n<acc.n THEN -num.n ELSE num.n END+acc.tot
    FROM acc
    JOIN num ON num.r=acc.r+1

  ),
  num AS (
    WITH roman AS (
      SELECT l,v FROM (VALUES ('M',1000),('D',500),('C',100),('L',50),('X',10),('V',5),('I',1)) AS t(l,v)
    )
    SELECT l,v AS n,ROW_NUMBER() OVER ()::int2 AS r
    FROM REGEXP_SPLIT_TO_TABLE(REVERSE(roman), '') AS l
    JOIN roman USING (l)
  )
  --SELECT * FROM acc;
  SELECT tot INTO num FROM acc ORDER BY r DESC LIMIT 1;
  
--   RETURN acc.t;
  RETURN num;
END
$$;


ALTER FUNCTION tracker.roman_to_int(roman text) OWNER TO projects;

--
-- Name: validate_roman(text); Type: FUNCTION; Schema: tracker; Owner: projects
--

CREATE FUNCTION tracker.validate_roman(roman text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
BEGIN
  RETURN roman ~* '^M{0,3}(CM|CD|D?C{0,3})?(XC|XL|L?X{0,3})?(IX|IV|V?I{0,3})?$';
END
$_$;


ALTER FUNCTION tracker.validate_roman(roman text) OWNER TO projects;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: episode; Type: TABLE; Schema: tracker; Owner: projects
--

CREATE TABLE tracker.episode (
    series_id text NOT NULL,
    name text NOT NULL,
    air_date date,
    program_id text DEFAULT ''::text NOT NULL,
    source tracker.show_source DEFAULT 'other'::tracker.show_source,
    CONSTRAINT name_len CHECK ((length(name) > 0)),
    CONSTRAINT program_id_len CHECK (((length(program_id) = 0) OR (length(program_id) = 19))),
    CONSTRAINT series_id_len CHECK (((length(series_id) = 0) OR (length(series_id) = 19)))
);


ALTER TABLE tracker.episode OWNER TO projects;

--
-- Name: COLUMN episode.series_id; Type: COMMENT; Schema: tracker; Owner: projects
--

COMMENT ON COLUMN tracker.episode.series_id IS 'set on import';


--
-- Name: COLUMN episode.name; Type: COMMENT; Schema: tracker; Owner: projects
--

COMMENT ON COLUMN tracker.episode.name IS 'set on import';


--
-- Name: COLUMN episode.air_date; Type: COMMENT; Schema: tracker; Owner: projects
--

COMMENT ON COLUMN tracker.episode.air_date IS 'set on import';


--
-- Name: watched; Type: TABLE; Schema: tracker; Owner: projects
--

CREATE TABLE tracker.watched (
    program_id text NOT NULL,
    watched_on date,
    type text NOT NULL,
    name text NOT NULL,
    aired_on date,
    season smallint DEFAULT 0 NOT NULL,
    series_id text DEFAULT ''::text NOT NULL,
    CONSTRAINT program_id_len CHECK (((length(program_id) = 0) OR (length(program_id) = 19))),
    CONSTRAINT series_id_len CHECK (((length(series_id) = 0) OR (length(series_id) = 19)))
);


ALTER TABLE tracker.watched OWNER TO projects;

--
-- Name: ridic; Type: MATERIALIZED VIEW; Schema: tracker; Owner: projects
--

CREATE MATERIALIZED VIEW tracker.ridic AS
 SELECT named.base,
    named.roman,
    named.num,
    e.name,
    e.air_date,
    w.watched_on,
    w.program_id
   FROM (((tracker.episode e
     LEFT JOIN tracker.watched w USING (series_id, name))
     JOIN LATERAL ( SELECT regexp_split_to_array(e.name, '\s(?=[MDCLXVI]+$)'::text) AS arr) nps ON (true))
     JOIN LATERAL ( SELECT nps.arr[1] AS base,
            COALESCE(nps.arr[2], 'I'::text) AS roman,
            tracker.from_roman_for(COALESCE(nps.arr[2], 'I'::text)) AS num) named ON (true))
  WHERE (e.series_id = '6774048176174390112'::text)
  WITH NO DATA;


ALTER MATERIALIZED VIEW tracker.ridic OWNER TO projects;

--
-- Name: series; Type: TABLE; Schema: tracker; Owner: projects
--

CREATE TABLE tracker.series (
    series_id text NOT NULL,
    name text NOT NULL,
    release_year text DEFAULT ''::text NOT NULL,
    season_min smallint DEFAULT 1 NOT NULL,
    season_max smallint DEFAULT 999 NOT NULL,
    CONSTRAINT name_len CHECK ((length(name) > 0)),
    CONSTRAINT series_id_len CHECK (((length(series_id) = 0) OR (length(series_id) = 19)))
);


ALTER TABLE tracker.series OWNER TO projects;

--
-- Name: COLUMN series.release_year; Type: COMMENT; Schema: tracker; Owner: projects
--

COMMENT ON COLUMN tracker.series.release_year IS '<year>-<year?>';


--
-- Name: COLUMN series.season_min; Type: COMMENT; Schema: tracker; Owner: projects
--

COMMENT ON COLUMN tracker.series.season_min IS 'ignore episodes outside this range';


--
-- Name: episode episode_pkey; Type: CONSTRAINT; Schema: tracker; Owner: projects
--

ALTER TABLE ONLY tracker.episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (series_id, name);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: tracker; Owner: projects
--

ALTER TABLE ONLY tracker.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: watched watched_pkey; Type: CONSTRAINT; Schema: tracker; Owner: projects
--

ALTER TABLE ONLY tracker.watched
    ADD CONSTRAINT watched_pkey PRIMARY KEY (program_id);


--
-- Name: idx_episode_name; Type: INDEX; Schema: tracker; Owner: projects
--

CREATE INDEX idx_episode_name ON tracker.episode USING btree (name);


--
-- Name: idx_episode_series_id; Type: INDEX; Schema: tracker; Owner: projects
--

CREATE INDEX idx_episode_series_id ON tracker.episode USING btree (series_id);


--
-- Name: idx_watched_name; Type: INDEX; Schema: tracker; Owner: projects
--

CREATE INDEX idx_watched_name ON tracker.watched USING btree (name);


--
-- Name: idx_watched_name_series_id; Type: INDEX; Schema: tracker; Owner: projects
--

CREATE INDEX idx_watched_name_series_id ON tracker.watched USING btree (series_id, name);


--
-- Name: idx_watched_series_id; Type: INDEX; Schema: tracker; Owner: projects
--

CREATE INDEX idx_watched_series_id ON tracker.watched USING btree (series_id);


--
-- Name: idx_watched_watched_on; Type: INDEX; Schema: tracker; Owner: projects
--

CREATE INDEX idx_watched_watched_on ON tracker.watched USING btree (watched_on);


--
-- Name: episode episode_series_fk; Type: FK CONSTRAINT; Schema: tracker; Owner: projects
--

ALTER TABLE ONLY tracker.episode
    ADD CONSTRAINT episode_series_fk FOREIGN KEY (series_id) REFERENCES tracker.series(series_id) ON DELETE CASCADE;


--
-- Name: SCHEMA tracker; Type: ACL; Schema: -; Owner: projects
--

REVOKE ALL ON SCHEMA tracker FROM pg_database_owner;
REVOKE USAGE ON SCHEMA tracker FROM PUBLIC;
GRANT USAGE ON SCHEMA tracker TO projects_user;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO projects;
GRANT ALL ON LANGUAGE plpgsql TO projects_user;


--
-- Name: FUNCTION from_roman(roman text); Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON FUNCTION tracker.from_roman(roman text) FROM projects;
GRANT ALL ON FUNCTION tracker.from_roman(roman text) TO projects_user;


--
-- Name: FUNCTION from_roman_for(roman text); Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON FUNCTION tracker.from_roman_for(roman text) FROM projects;
GRANT ALL ON FUNCTION tracker.from_roman_for(roman text) TO projects_user;


--
-- Name: FUNCTION validate_roman(roman text); Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON FUNCTION tracker.validate_roman(roman text) FROM projects;
GRANT ALL ON FUNCTION tracker.validate_roman(roman text) TO projects_user;


--
-- Name: TABLE episode; Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON TABLE tracker.episode FROM projects;
GRANT SELECT,INSERT,UPDATE ON TABLE tracker.episode TO projects_user;


--
-- Name: TABLE watched; Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON TABLE tracker.watched FROM projects;
GRANT SELECT,INSERT,UPDATE ON TABLE tracker.watched TO projects_user;


--
-- Name: TABLE ridic; Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON TABLE tracker.ridic FROM projects;


--
-- Name: TABLE series; Type: ACL; Schema: tracker; Owner: projects
--

REVOKE ALL ON TABLE tracker.series FROM projects;
GRANT SELECT,INSERT,UPDATE ON TABLE tracker.series TO projects_user;


--
-- PostgreSQL database dump complete
--

