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
-- Data for Name: series; Type: TABLE DATA; Schema: tracker; Owner: projects
--

COPY tracker.series (series_id, name, release_year, season_min, season_max) FROM stdin;
6774048176174390112	Ridiculousness	2011-	31	999
\.


--
-- Data for Name: episode; Type: TABLE DATA; Schema: tracker; Owner: projects
--

COPY tracker.episode (series_id, name, air_date, program_id, source) FROM stdin;
6774048176174390112	Sterling and Karrueche Tran	2023-04-03		epguides.com
6774048176174390112	Sterling and Karrueche Tran II	2023-04-03		epguides.com
6774048176174390112	Sterling and Nina Agdal	2023-04-05		epguides.com
6774048176174390112	Sterling and Nina Agdal II	2023-04-05		epguides.com
6774048176174390112	Sterling and Carly Aquilino	2023-04-10		epguides.com
6774048176174390112	Sterling and Carly Aquilino II	2023-04-10		epguides.com
6774048176174390112	Sterling and Lolo Wood	2023-04-12		epguides.com
6774048176174390112	Sterling and Lolo Wood II	2023-04-12		epguides.com
6774048176174390112	Sterling and Camille Kostek	2023-04-17		epguides.com
6774048176174390112	Sterling and Camille Kostek II	2023-04-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran III	2023-04-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran V	2023-04-17		epguides.com
6774048176174390112	Sterling and B. Simone	2023-04-24		epguides.com
6774048176174390112	Sterling and B. Simone II	2023-04-24		epguides.com
6774048176174390112	Sterling and B. Simone III	2023-04-24		epguides.com
6774048176174390112	Sterling and B. Simone IV	2023-04-24		epguides.com
6774048176174390112	Sterling and Madison Beer II	2023-04-26		epguides.com
6774048176174390112	Sterling and Madison Beer III	2023-04-26		epguides.com
6774048176174390112	Sterling and Madison Beer IV	2023-04-26		epguides.com
6774048176174390112	Sterling and Madison Beer V	2023-04-26		epguides.com
6774048176174390112	Sterling and Rachel Wolfson	2023-05-01		epguides.com
6774048176174390112	Sterling and Rachel Wolfson II	2023-05-01		epguides.com
6774048176174390112	Sterling and Rachel Wolfson III	2023-05-01		epguides.com
6774048176174390112	Sterling and Rachel Wolfson IV	2023-05-01		epguides.com
6774048176174390112	Sterling and Nikki Blades	2023-05-03		epguides.com
6774048176174390112	Sterling and Nikki Blades II	2023-05-03		epguides.com
6774048176174390112	Sterling and Nikki Blades III	2023-05-03		epguides.com
6774048176174390112	Sterling and Nikki Blades IV	2023-05-03		epguides.com
6774048176174390112	Sterling and Brie Bella	2023-05-08		epguides.com
6774048176174390112	Sterling and Brie Bella II	2023-05-08		epguides.com
6774048176174390112	Sterling and Brie Bella III	2023-05-08		epguides.com
6774048176174390112	Sterling and Brie Bella IV	2023-05-08		epguides.com
6774048176174390112	Sterling and Maddy Smith	2023-05-10		epguides.com
6774048176174390112	Sterling and Maddy Smith II	2023-05-10		epguides.com
6774048176174390112	Sterling and Maddy Smith III	2023-05-10		epguides.com
6774048176174390112	Sterling and Maddy Smith IV	2023-05-10		epguides.com
6774048176174390112	Sterling and The Stallone Sisters	2023-05-15		epguides.com
6774048176174390112	Sterling and The Stallone Sisters II	2023-05-15		epguides.com
6774048176174390112	Sterling and Camille Kostek III	2023-05-15		epguides.com
6774048176174390112	Sterling and Camille Kostek IV	2023-05-15		epguides.com
6774048176174390112	Sterling and Karrueche Tran VI	2023-05-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran VIII	2023-05-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran IV	2023-05-17		epguides.com
6774048176174390112	Sterling and Nina Agdal IV	2023-05-22		epguides.com
6774048176174390112	Sterling and Nina Agdal III	2023-05-22		epguides.com
6774048176174390112	Sterling and Nina Agdal V	2023-05-22		epguides.com
6774048176174390112	Sterling and Nina Agdal IX	2023-05-22		epguides.com
6774048176174390112	Sterling and Lolo Wood III	2023-05-24		epguides.com
6774048176174390112	Sterling and Lolo Wood VI	2023-05-24		epguides.com
6774048176174390112	Sterling and Lolo Wood IX	2023-05-24		epguides.com
6774048176174390112	Sterling and Carly Aquilino III	2023-05-29		epguides.com
6774048176174390112	Sterling and Carly Aquilino VI	2023-05-29		epguides.com
6774048176174390112	Sterling and Carly Aquilino IX	2023-05-29		epguides.com
6774048176174390112	Sterling and Carly Aquilino V	2023-05-29		epguides.com
6774048176174390112	Sterling and Madison Beer VI	2023-05-31		epguides.com
6774048176174390112	Sterling and Madison Beer VIII	2023-05-31		epguides.com
6774048176174390112	Sterling and Madison Beer IX	2023-05-31		epguides.com
6774048176174390112	Sterling and Madison Beer X	2023-05-31		epguides.com
6774048176174390112	Sterling and Draya Michele	2023-06-05		epguides.com
6774048176174390112	Sterling and Draya Michele II	2023-06-05		epguides.com
6774048176174390112	Sterling and Draya Michele III	2023-06-05		epguides.com
6774048176174390112	Sterling and Draya Michele IV	2023-06-05		epguides.com
6774048176174390112	Sterling and Karrueche Tran IX	2023-06-07		epguides.com
6774048176174390112	Sterling and Karrueche Tran X	2023-06-07		epguides.com
6774048176174390112	Sterling and Karrueche Tran XI	2023-06-09		epguides.com
6774048176174390112	Sterling and Karrueche Tran XII	2023-06-09		epguides.com
6774048176174390112	Sterling and Nina Agdal VI	2023-06-12		epguides.com
6774048176174390112	Sterling and Nina Agdal VII	2023-06-12		epguides.com
6774048176174390112	Sterling and Nina Agdal X	2023-06-12		epguides.com
6774048176174390112	Sterling and Nina Agdal XI	2023-06-12		epguides.com
6774048176174390112	Sterling and Lolo Wood IV	2023-06-14		epguides.com
6774048176174390112	Sterling and Lolo Wood XII	2023-06-14		epguides.com
6774048176174390112	Sterling and Lolo Wood VII	2023-06-14		epguides.com
6774048176174390112	Sterling and Lolo Wood XVI	2023-06-14		epguides.com
6774048176174390112	Sterling and Carly Aquilino IV	2023-06-16		epguides.com
6774048176174390112	Sterling and Carly Aquilino XIII	2023-06-16		epguides.com
6774048176174390112	Sterling and Carly Aquilino VII	2023-06-16		epguides.com
6774048176174390112	Sterling and Carly Aquilino XI	2023-06-16		epguides.com
6774048176174390112	Sterling and Camille Kostek V	2023-06-19		epguides.com
6774048176174390112	Sterling and Camille Kostek VI	2023-06-19		epguides.com
6774048176174390112	Sterling and Camille Kostek VII	2023-06-19		epguides.com
6774048176174390112	Sterling and Camille Kostek VIII	2023-06-19		epguides.com
6774048176174390112	Sterling and Karrueche Tran XIV	2023-06-21		epguides.com
6774048176174390112	Sterling and Karrueche Tran XV	2023-06-21		epguides.com
6774048176174390112	Sterling and Karrueche Tran XVI	2023-06-21		epguides.com
6774048176174390112	Sterling and Karrueche Tran XVII	2023-06-21		epguides.com
6774048176174390112	Sterling and Brittney Elena	2023-06-23		epguides.com
6774048176174390112	Sterling and Brittney Elena II	2023-06-23		epguides.com
6774048176174390112	Sterling and Brittney Elena III	2023-06-23		epguides.com
6774048176174390112	Sterling and Brittney Elena IV	2023-06-23		epguides.com
6774048176174390112	Sterling and Nina Agdal VIII	2023-06-26		epguides.com
6774048176174390112	Sterling and Nina Agdal XIV	2023-06-26		epguides.com
6774048176174390112	Sterling and Nina Agdal XII	2023-06-26		epguides.com
6774048176174390112	Sterling and Nina Agdal XIII	2023-06-26		epguides.com
6774048176174390112	Sterling and Lolo Wood XI	2023-06-28		epguides.com
6774048176174390112	Sterling and Lolo Wood XVII	2023-06-28		epguides.com
6774048176174390112	Sterling and Lolo Wood XIII	2023-06-28		epguides.com
6774048176174390112	Sterling and Lolo Wood VIII	2023-06-28		epguides.com
6774048176174390112	Sterling and Teala Dunn	2023-06-30		epguides.com
6774048176174390112	Sterling and Teala Dunn II	2023-06-30		epguides.com
6774048176174390112	Sterling and Teala Dunn III	2023-06-30		epguides.com
6774048176174390112	Sterling and Teala Dunn IV	2023-06-30		epguides.com
6774048176174390112	Sterling and Carly Aquilino VIII	2023-07-03		epguides.com
6774048176174390112	Sterling and Carly Aquilino XII	2023-07-03		epguides.com
6774048176174390112	Sterling and Carly Aquilino X	2023-07-03		epguides.com
6774048176174390112	Sterling and Carly Aquilino XIV	2023-07-03		epguides.com
6774048176174390112	Sterling and Camille Kostek IX	2023-07-05		epguides.com
6774048176174390112	Sterling and Camille Kostek X	2023-07-05		epguides.com
6774048176174390112	Sterling and Camille Kostek XI	2023-07-05		epguides.com
6774048176174390112	Sterling and Camille Kostek XII	2023-07-05		epguides.com
6774048176174390112	Sterling and Karrueche Tran XIII	2023-07-07		epguides.com
6774048176174390112	Sterling and Karrueche Tran XVIII	2023-07-07		epguides.com
6774048176174390112	Sterling and Karrueche Tran XIX	2023-07-07		epguides.com
6774048176174390112	Sterling and Karrueche Tran XX	2023-07-07		epguides.com
6774048176174390112	Sterling and Lolo Wood X	2023-07-10		epguides.com
6774048176174390112	Sterling and Lolo Wood XIV	2023-07-10		epguides.com
6774048176174390112	Sterling and Lolo Wood XV	2023-07-10		epguides.com
6774048176174390112	Sterling and Lolo Wood XVIII	2023-07-10		epguides.com
6774048176174390112	Sterling and Nina Agdal XV	2023-07-12		epguides.com
6774048176174390112	Sterling and Nina Agdal XVI	2023-07-12		epguides.com
6774048176174390112	Sterling and Nina Agdal XVII	2023-07-12		epguides.com
6774048176174390112	Sterling and Nina Agdal XVIII	2023-07-12		epguides.com
6774048176174390112	Sterling and Carly Aquilino XV	2023-07-14		epguides.com
6774048176174390112	Sterling and Carly Aquilino XVI	2023-07-14		epguides.com
6774048176174390112	Sterling and Carly Aquilino XVII	2023-07-16		epguides.com
6774048176174390112	Sterling and Carly Aquilino XVIII	2023-07-16		epguides.com
6774048176174390112	Sterling and Camille Kostek XIII	2023-07-17		epguides.com
6774048176174390112	Sterling and Camille Kostek XIV	2023-07-17		epguides.com
6774048176174390112	Sterling and Camille Kostek XV	2023-07-17		epguides.com
6774048176174390112	Sterling and Lolo Wood XIX	2023-07-21		epguides.com
6774048176174390112	Sterling and Lolo Wood XX	2023-07-21		epguides.com
6774048176174390112	Sterling and Lolo Wood XXI	2023-07-21		epguides.com
6774048176174390112	Sterling and Lolo Wood XXII	2023-07-23		epguides.com
6774048176174390112	Sterling and Camille Kostek XVI	2023-07-23		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXI	2023-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXII	2023-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXIII	2023-07-24		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXVI	2023-07-28		epguides.com
6774048176174390112	Sterling and Carly Aquilino XIX	2023-07-28		epguides.com
6774048176174390112	Sterling and Carly Aquilino XX	2023-07-28		epguides.com
6774048176174390112	Sterling and Nina Agdal XX	2023-07-30		epguides.com
6774048176174390112	Sterling and Nina Agdal XXI	2023-07-30		epguides.com
6774048176174390112	Sterling and Lolo Wood XXIII	2023-07-31		epguides.com
6774048176174390112	Sterling and Nina Agdal XXII	2023-08-04		epguides.com
6774048176174390112	Sterling and Nina Agdal XXIII	2023-08-04		epguides.com
6774048176174390112	Sterling and Nina Agdal XXIV	2023-08-04		epguides.com
6774048176174390112	Sterling and Camille Kostek XVII	2023-08-06		epguides.com
6774048176174390112	Sterling and Camille Kostek XVIII	2023-08-06		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXI	2023-08-07		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXII	2023-08-07		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXIII	2023-08-07		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXI	2023-08-13		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXII	2023-08-13		epguides.com
6774048176174390112	Sterling and Lolo Wood XXVI	2023-08-14		epguides.com
6774048176174390112	Sterling and Lolo Wood XXVII	2023-08-14		epguides.com
6774048176174390112	Sterling and Lolo Wood XXVIII	2023-08-14		epguides.com
6774048176174390112	Sterling and Nina Agdal XLI	2023-08-18		epguides.com
6774048176174390112	Sterling and Nina Agdal XXVII	2023-08-18		epguides.com
6774048176174390112	Sterling and Nina Agdal XXIX	2023-08-18		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXX	2023-08-20		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXI	2023-08-20		epguides.com
6774048176174390112	Sterling and Nina Agdal XXV	2023-08-21		epguides.com
6774048176174390112	Sterling and Nina Agdal XXVI	2023-08-21		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXIV	2023-08-25		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXVII	2023-08-25		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXVIII	2023-08-25		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXVIII	2023-08-27		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXIX	2023-08-27		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXV	2023-08-28		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXVI	2023-08-28		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXIX	2023-08-28		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXIV	2023-09-01		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXV	2023-09-01		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXVII	2023-09-01		epguides.com
6774048176174390112	Sterling and Arielle Vandenberg	2023-09-03		epguides.com
6774048176174390112	Sterling and Arielle Vandenberg II	2023-09-03		epguides.com
6774048176174390112	Sterling and Nina Agdal XXVIII	2023-09-04		epguides.com
6774048176174390112	Sterling and Nina Agdal XXX	2023-09-04		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXIII	2023-09-04		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXII	2023-09-08		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXIII	2023-09-08		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXIV	2023-09-08		epguides.com
6774048176174390112	Sterling and Rocsi Diaz	2023-09-10		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXX	2023-09-11		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXI	2023-09-11		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXII	2023-09-11		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXIX	2023-09-15		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXV	2023-09-15		epguides.com
6774048176174390112	Sterling and Karrueche Tran XL	2023-09-15		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXIV	2023-09-17		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXV	2023-09-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXVI	2023-09-18		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXVII	2023-09-18		epguides.com
6774048176174390112	Sterling and Karrueche Tran XXXVIII	2023-09-18		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXIII	2023-09-22		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXIV	2023-09-22		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXVI	2023-09-22		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXVII	2023-10-23		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXVIII	2023-10-23		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXV	2023-09-25		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXVII	2023-09-25		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXVIII	2023-09-25		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXIX	2023-09-29		epguides.com
6774048176174390112	Sterling and Nina Agdal XL	2023-09-29		epguides.com
6774048176174390112	Sterling and Nina Agdal XXXVI	2023-09-29		epguides.com
6774048176174390112	Sterling and Nina Agdal XLII	2023-10-02		epguides.com
6774048176174390112	Sterling and Nina Agdal XLIII	2023-10-02		epguides.com
6774048176174390112	Sterling and Nina Agdal XLIV	2023-10-02		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLI	2023-10-06		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLII	2023-10-06		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLIII	2023-10-06		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLVI	2023-10-09		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLV	2023-10-09		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLVII	2023-10-09		epguides.com
6774048176174390112	Sterling and Nina Agdal XLVII	2023-10-13		epguides.com
6774048176174390112	Sterling and Nina Agdal XLVIII	2023-10-13		epguides.com
6774048176174390112	Sterling and Nina Agdal XLIX	2023-10-13		epguides.com
6774048176174390112	Sterling and Rocsi Diaz III	2023-10-16		epguides.com
6774048176174390112	Sterling and Rocsi Diaz IV	2023-10-16		epguides.com
6774048176174390112	Sterling and Rocsi Diaz V	2023-10-16		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLVIII	2023-10-20		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLIX	2023-10-20		epguides.com
6774048176174390112	Sterling and Carly Aquilino L	2023-10-20		epguides.com
6774048176174390112	Sterling and Carly Aquilino XXXIX	2023-10-25		epguides.com
6774048176174390112	Sterling and Rocsi Diaz VI	2023-10-27		epguides.com
6774048176174390112	Sterling and Carly Aquilino XLIV	2023-10-30		epguides.com
6774048176174390112	Sterling and Carly Aquilino LI	2023-10-30		epguides.com
6774048176174390112	Sterling and Nina Agdal XLV	2023-11-10		epguides.com
6774048176174390112	Sterling and Nina Agdal XLVI	2023-11-10		epguides.com
6774048176174390112	Sterling and Carly Aquilino LII	2023-11-17		epguides.com
6774048176174390112	Sterling and Carly Aquilino LIII	2023-11-17		epguides.com
6774048176174390112	Sterling and Nina Agdal L	2023-12-01		epguides.com
6774048176174390112	Sterling and Nina Agdal LI	2023-12-01		epguides.com
6774048176174390112	Sterling and Carly Aquilino LIV	2023-12-08		epguides.com
6774048176174390112	Sterling and Nina Agdal LII	2023-12-08		epguides.com
6774048176174390112	Sterling and Nina Agdal LIII	2023-12-08		epguides.com
6774048176174390112	Sterling and Nina Agdal LIV	2023-12-15		epguides.com
6774048176174390112	Sterling and Nina Agdal LV	2023-12-15		epguides.com
6774048176174390112	Sterling and Carly Aquilino LV	2023-12-15		epguides.com
6774048176174390112	Sterling and Carly Aquilino LVI	2023-12-15		epguides.com
6774048176174390112	Sterling and Nina Agdal LVI	2023-12-22		epguides.com
6774048176174390112	Sterling and Carly Aquilino LVII	2023-12-22		epguides.com
6774048176174390112	Sterling and Carly Aquilino LVIII	2023-12-22		epguides.com
6774048176174390112	Sterling and Carly Aquilino LIX	2023-12-29		epguides.com
6774048176174390112	Sterling and Carly Aquilino LX	2023-12-29		epguides.com
6774048176174390112	Sterling and Rocsi Diaz VII	2023-10-27		epguides.com
6774048176174390112	Sterling and Camille Kostek XIX	2023-11-03		epguides.com
6774048176174390112	Sterling and Camille Kostek XX	2023-11-03		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLI	2023-11-03		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLII	2023-11-03		epguides.com
6774048176174390112	Sterling and Camille Kostek XXI	2023-11-06		epguides.com
6774048176174390112	Sterling and Camille Kostek XXII	2023-11-06		epguides.com
6774048176174390112	Sterling and Rocsi Diaz VIII	2023-11-10		epguides.com
6774048176174390112	Sterling and Rocsi Diaz IX	2023-11-10		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLIII	2023-11-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLIV	2023-11-17		epguides.com
6774048176174390112	Sterling and Camille Kostek XXIII	2023-11-17		epguides.com
6774048176174390112	Sterling and Camille Kostek XXIV	2023-11-17		epguides.com
6774048176174390112	Sterling and Camille Kostek XXV	2023-12-01		epguides.com
6774048176174390112	Sterling and Camille Kostek XXVI	2023-12-01		epguides.com
6774048176174390112	Sterling and Rocsi Diaz X	2023-12-01		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XI	2023-12-01		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXIV	2023-12-08		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLVI	2023-12-08		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLV	2023-12-08		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XII	2023-12-15		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XIII	2023-12-15		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLVII	2023-12-22		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLVIII	2023-12-22		epguides.com
6774048176174390112	Sterling and Karrueche Tran XLIX	2023-12-29		epguides.com
6774048176174390112	Sterling and Karrueche Tran L	2023-12-29		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XIV	2023-12-29		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XV	2023-12-29		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXI	2024-03-03		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXII	2024-03-03		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXIII	2024-03-03		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXV	2024-03-03		epguides.com
6774048176174390112	Sterling and Karrueche Tran LI	2024-03-10		epguides.com
6774048176174390112	Sterling and Karrueche Tran LII	2024-03-10		epguides.com
6774048176174390112	Sterling and Karrueche Tran LIII	2024-03-10		epguides.com
6774048176174390112	Sterling and Karrueche Tran LIV	2024-03-10		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXVI	2024-03-31		epguides.com
6774048176174390112	Sterling and Nina Agdal LVII	2023-12-22		epguides.com
6774048176174390112	Sterling and Carly Aquilino XL	2023-10-25		epguides.com
6774048176174390112	Sterling and Mike "The Situation" Sorrentino	2024-01-04		epguides.com
6774048176174390112	Sterling and Mike "The Situation" Sorrentino II	2024-01-04		epguides.com
6774048176174390112	Sterling and Angelina Pivarnick	2024-01-11		epguides.com
6774048176174390112	Sterling and Angelina Pivarnick II	2024-01-11		epguides.com
6774048176174390112	Sterling and Jenni "JWOWW" Farley	2024-01-18		epguides.com
6774048176174390112	Sterling and Jenni "JWOWW" Farley II	2024-01-18		epguides.com
6774048176174390112	Sterling and Angelina Pivarnick III	2024-01-25		epguides.com
6774048176174390112	Sterling and Angelina Pivarnick IV	2024-01-25		epguides.com
6774048176174390112	Sterling and Mike "The Situation" Sorrentino III	2024-02-01		epguides.com
6774048176174390112	Sterling and Jenni "JWOWW" Farley III	2024-02-01		epguides.com
6774048176174390112	Sterling and Gigi Goode	2024-03-01		epguides.com
6774048176174390112	Sterling and Mo Heart	2024-03-01		epguides.com
6774048176174390112	Sterling and Jessica Wild	2024-03-08		epguides.com
6774048176174390112	Sterling and Symone	2024-03-08		epguides.com
6774048176174390112	Sterling and Nina Agdal LVIII	2024-03-17		epguides.com
6774048176174390112	Sterling and Nina Agdal LIX	2024-03-17		epguides.com
6774048176174390112	Sterling and Nina Agdal LX	2024-03-17		epguides.com
6774048176174390112	Sterling and Nina Agdal LXI	2024-03-17		epguides.com
6774048176174390112	Sterling and Lolo Wood XXIX	2024-03-24		epguides.com
6774048176174390112	Sterling and Lolo Wood XXX	2024-03-24		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXI	2024-03-24		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXII	2024-03-24		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXVII	2024-03-31		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXVIII	2024-03-31		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXIX	2024-03-31		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XVI	2024-04-07		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XVII	2024-04-07		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XVIII	2024-04-07		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XIX	2024-04-07		epguides.com
6774048176174390112	Sterling and Nina Agdal LXII	2024-04-28		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXX	2024-05-12		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXI	2024-05-12		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXII	2024-05-12		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXIII	2024-05-12		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXIV	2024-06-19		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXV	2024-06-19		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXVI	2024-06-19		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXVII	2024-06-19		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXVIII	2024-06-19		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXIX	2024-06-19		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXX	2024-07-17		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXXI	2024-07-17		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXXII	2024-07-17		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXXIII	2024-07-17		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXXIV	2024-07-17		epguides.com
6774048176174390112	Sterling and Karrueche Tran LV	2024-04-14		epguides.com
6774048176174390112	Sterling and Karrueche Tran LVI	2024-04-14		epguides.com
6774048176174390112	Sterling and Karrueche Tran LVII	2024-04-14		epguides.com
6774048176174390112	Sterling and Karrueche Tran LVIII	2024-04-14		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXIII	2024-04-21		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXIV	2024-04-21		epguides.com
6774048176174390112	Sterling and Nina Agdal LXIII	2024-04-28		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XX	2024-05-26		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXII	2024-05-26		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXIII	2024-05-26		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXIV	2024-05-26		epguides.com
6774048176174390112	Nina Drama	2024-06-09		epguides.com
6774048176174390112	Nina Drama II	2024-06-09		epguides.com
6774048176174390112	Sterling and Karrueche Tran LIX	2024-06-26		epguides.com
6774048176174390112	Sterling and Karrueche Tran LX	2024-06-26		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXI	2024-06-26		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXII	2024-06-26		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXIII	2024-06-26		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXIV	2024-06-26		epguides.com
6774048176174390112	Sterling and Nina Agdal LXIV	2024-07-03		epguides.com
6774048176174390112	Sterling and Nina Agdal LXV	2024-07-03		epguides.com
6774048176174390112	Sterling and Nina Agdal LXVI	2024-07-03		epguides.com
6774048176174390112	Sterling and Nina Agdal LXVII	2024-07-03		epguides.com
6774048176174390112	Sterling and Nina Agdal LXVIII	2024-07-03		epguides.com
6774048176174390112	Sterling and Nina Agdal LXIX	2024-07-03		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXI	2024-07-10		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXV	2024-07-10		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXVI	2024-07-10		epguides.com
6774048176174390112	Sterling and Carly Aquilino LXXXV	2024-07-17		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXV	2024-04-21		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXVI	2024-04-21		epguides.com
6774048176174390112	Daymond John II	2024-05-05		epguides.com
6774048176174390112	Daymond John III	2024-05-05		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXVII	2024-05-05		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXVIII	2024-05-05		epguides.com
6774048176174390112	Teddy Swims	2024-05-19		epguides.com
6774048176174390112	Sterling and Lolo Wood XXXIX	2024-05-19		epguides.com
6774048176174390112	Sterling and Lolo Wood XL	2024-05-19		epguides.com
6774048176174390112	Sterling and Lolo Wood XLI	2024-05-19		epguides.com
6774048176174390112	Dee Snider	2024-06-02		epguides.com
6774048176174390112	Sterling and Lolo Wood XLII	2024-06-02		epguides.com
6774048176174390112	Sterling and Lolo Wood XLIII	2024-06-02		epguides.com
6774048176174390112	Sterling and Lolo Wood XLIV	2024-06-02		epguides.com
6774048176174390112	Lexi Rivera	2024-06-09		epguides.com
6774048176174390112	Lexi Rivera II	2024-06-09		epguides.com
6774048176174390112	Madison Pettis	2024-06-16		epguides.com
6774048176174390112	Madison Pettis II	2024-06-16		epguides.com
6774048176174390112	Sterling and Lolo Wood XLV	2024-07-07		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXVII	2024-07-10		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXVIII	2024-07-10		epguides.com
6774048176174390112	Sterling and Rocsi Diaz XXIX	2024-07-10		epguides.com
6774048176174390112	Sterling and Kristy Sarah	2024-06-16		epguides.com
6774048176174390112	Sterling and Kristy Sarah II	2024-06-16		epguides.com
6774048176174390112	Sterling and Lolo Wood XLVI	2024-07-07		epguides.com
6774048176174390112	Sterling and Lolo Wood XLVII	2024-07-07		epguides.com
6774048176174390112	Sterling and Lolo Wood XLVIII	2024-07-07		epguides.com
6774048176174390112	Sterling and Lolo Wood L	2024-07-14		epguides.com
6774048176174390112	Sterling and Lolo Wood LI	2024-07-14		epguides.com
6774048176174390112	Sterling and Lolo Wood LII	2024-07-14		epguides.com
6774048176174390112	Brooke Schofield	2024-06-23		epguides.com
6774048176174390112	Brooke Schofield II	2024-06-23		epguides.com
6774048176174390112	Skye Townsend	2024-06-23		epguides.com
6774048176174390112	Skye Townsend II	2024-06-23		epguides.com
6774048176174390112	Rahne Jones and Travis Mills	2024-07-14		epguides.com
6774048176174390112	Sterling and Lolo Wood LIII	2024-07-21		epguides.com
6774048176174390112	Sterling and Lolo Wood LIV	2024-07-21		epguides.com
6774048176174390112	Sterling and Lolo Wood LV	2024-07-21		epguides.com
6774048176174390112	Sterling and Lolo Wood LVI	2024-07-21		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXV	2024-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXVI	2024-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXVII	2024-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXVIII	2024-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXIX	2024-07-24		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXX	2024-07-24		epguides.com
6774048176174390112	Sterling and Lolo Wood LVII	2024-07-28		epguides.com
6774048176174390112	Sterling and Lolo Wood LVIII	2024-07-28		epguides.com
6774048176174390112	Sterling and Lolo Wood LIX	2024-07-28		epguides.com
6774048176174390112	Sterling and Lolo Wood LX	2024-07-28		epguides.com
6774048176174390112	Sterling and Nina Agdal LXX	2024-07-31		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXI	2024-07-31		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXII	2024-07-31		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXIII	2024-07-31		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXIV	2024-07-31		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXV	2024-07-31		epguides.com
6774048176174390112	Sterling and Lolo Wood LXII	2024-08-04		epguides.com
6774048176174390112	Sterling and Lolo Wood LXIII	2024-08-04		epguides.com
6774048176174390112	Sterling and Lolo Wood LXIV	2024-08-04		epguides.com
6774048176174390112	Matt Rife	2024-08-11		epguides.com
6774048176174390112	Sterling and Lolo Wood LXVI	2024-08-11		epguides.com
6774048176174390112	Sterling and Lolo Wood LXVII	2024-08-11		epguides.com
6774048176174390112	Sterling and Lolo Wood LXVIII	2024-08-11		epguides.com
6774048176174390112	Sterling and Rocsi Diaz II	2023-09-10		en.wikipedia.org
6774048176174390112	Sterling and Lolo Wood XLIX	9999-01-01		other
6774048176174390112	Sterling and Lolo Wood LXV	9999-01-01		other
6774048176174390112	Sterling and Paige Desorbo	2024-04-28		en.wikipedia.org
6774048176174390112	Sterling and Paige Desorbo II	2024-04-28		en.wikipedia.org
6774048176174390112	Rahne Jones & Travis Mills	2024-07-14		en.wikipedia.org
6774048176174390112	Sterling and Rocsi Diaz XXX	2024-08-07		en.wikipedia.org
6774048176174390112	Sterling and Rocsi Diaz XXXI	2024-08-07		en.wikipedia.org
6774048176174390112	Sterling and Carly Aquilino LXXXVI	2024-08-14		en.wikipedia.org
6774048176174390112	Sterling and Carly Aquilino LXXXVII	2024-08-14		en.wikipedia.org
6774048176174390112	Sterling and Lolo Wood LXI	2024-08-04		epguides.com
6774048176174390112	Sterling and Lolo Wood LXIX	2024-08-18		epguides.com
6774048176174390112	Sterling and Lolo Wood LXX	2024-08-18		epguides.com
6774048176174390112	Sterling and Lolo Wood LXXI	2024-08-18		epguides.com
6774048176174390112	Sterling and Lolo Wood LXXII	2024-08-18		epguides.com
6774048176174390112	Sterling and Madison Beer	2023-04-26		themoviedb.org
6774048176174390112	Sterling and Madison Beer VII	2023-04-26		themoviedb.org
6774048176174390112	Sterling and Karrueche Tran VII	2023-05-17		themoviedb.org
6774048176174390112	Sterling and Lolo Wood XXIV	2023-07-31		themoviedb.org
6774048176174390112	Sterling and Lolo Wood XXV	2023-07-31		themoviedb.org
6774048176174390112	Sterling and Nina Agdal XIX	2023-08-04		themoviedb.org
6774048176174390112	Sterling and Lolo Wood V	2023-04-12		themoviedb.org
6774048176174390112	Sterling and Karrueche Tran LXXI	2024-08-21		epguides.com
6774048176174390112	Sterling and Karrueche Tran LXXII	2024-08-21		epguides.com
6774048176174390112	Sterling and Lolo Wood LXXIII	2024-08-25		epguides.com
6774048176174390112	Sterling and Lolo Wood LXXIV	2024-08-25		epguides.com
6774048176174390112	Sterling and Lolo Wood LXXV	2024-08-25		epguides.com
6774048176174390112	Sterling and Lolo Wood LXXVI	2024-08-25		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXVI	2024-08-28		epguides.com
6774048176174390112	Sterling and Nina Agdal LXXVII	2024-08-28		epguides.com
\.


--
-- Data for Name: watched; Type: TABLE DATA; Schema: tracker; Owner: projects
--

COPY tracker.watched (program_id, watched_on, type, name, aired_on, season, series_id) FROM stdin;
4895328037883775112	2023-07-30	TVEpisode	Belgium Grand Prix	2023-07-30	0	5584345400977409112
5438530306080909112	2023-07-31	TVEpisode	Boxing Academy	\N	3	8680700375035513112
8815309841493424112	2023-07-31	TVEpisode	Fact or Fiction	2015-06-20	4	6229452957505901112
6286210792678910112	2023-07-31	TVEpisode	Frozen	2002-06-28	6	7188923726922774112
7471148651986485112	2023-07-31	TVEpisode	The Menace	2002-04-26	5	7188923726922774112
7716681286615076112	2023-08-02	TVEpisode	Ride the Wild Goose	\N	3	8680700375035513112
5287734763635654112	2023-08-02	TVEpisode	Ghosts	2019-10-20	10	7190072851208537112
5263347358066262112	2023-08-02	TVEpisode	Prometheus	2002-08-23	6	7188923726922774112
7217533508715980112	2023-08-03	TVEpisode	Unnatural Selection	2003-01-10	6	7188923726922774112
9203561671462304112	2023-08-04	TVEpisode	The Spiral Staircase Deck	2013-07-20	2	7168221997676981112
5535731612092854112	2023-08-04	TVEpisode	Paradise Lost	2003-01-31	6	7188923726922774112
8062369138210874112	2023-08-05	TVEpisode	Forsaken	2003-02-21	6	7188923726922774112
4973953253896425112	2023-08-05	Movie	The Hobbit: The Desolation of Smaug	2013-12-12	0	
6823279132864398112	2023-08-05	TVEpisode	Disclosure	2003-02-14	6	7188923726922774112
9028181645610886112	2023-08-07	TVEpisode	Memento	2003-03-07	6	7188923726922774112
6003306932772661112	2023-08-08	TVEpisode	Enemy Mine	2003-07-25	7	7188923726922774112
8417622093543371112	2023-08-08	TVEpisode	Space Race	2003-08-01	7	7188923726922774112
9067931653654640112	2024-02-22	TVEpisode	Sterling and Angelina Pivarnick	2024-01-11	38	6774048176174390112
6421135643425708112	2023-08-10	Movie	What We Did on Our Holiday	2014-09-26	0	
6985046891978867112	2024-02-22	TVEpisode	Sterling and Jenni "JWOWW" Farley	2024-01-18	38	6774048176174390112
5477875567116147112	2023-09-27	TVEpisode	Sterling and Nina Agdal XXX	2023-09-04	35	6774048176174390112
6156171345010580112	2024-02-21	TVEpisode	Sterling and Angelina Pivarnick II	2024-01-11	38	6774048176174390112
6699043584182248112	2024-07-09	TVEpisode	Sterling and Carly Aquilino LXXVII	2024-06-19	38	6774048176174390112
7709533141943762112	2023-08-21	TVEpisode	Dumpling-icious	2023-08-18	46	4791200799030182112
8292674919760019112	2023-08-20	Movie	Algiers	1938-07-13	0	
5921280684776295112	2023-09-26	TVEpisode	Sterling and Carly Aquilino XXVII	2023-09-01	35	6774048176174390112
7589881347302854112	2023-09-27	TVEpisode	Sterling and Nina Agdal XXVIII	2023-09-04	35	6774048176174390112
7798418720170114112	2023-10-27	TVEpisode	Sterling and Rocsi Diaz IV	2023-10-16	36	6774048176174390112
7248527803676749112	2024-07-04	TVEpisode	Sterling and Kristy Sarah II	2024-06-16	41	6774048176174390112
6109882100036981112	2024-07-09	TVEpisode	Sterling and Carly Aquilino LXXVIII	2024-06-19	38	6774048176174390112
4718377049016975112	2024-07-18	TVEpisode	Skye Townsend II	2024-06-23	42	6774048176174390112
8903803172391422112	2024-02-22	TVEpisode	Sterling and Mike "The Situation" Sorrentino	2024-01-04	38	6774048176174390112
8086433380403270112	2023-08-15	TVEpisode	Man vs. Nature	2016-01-23	5	6229452957505901112
6001320858510603112	2023-10-25	TVEpisode	Sterling and Nina Agdal XLVIII	2023-10-13	36	6774048176174390112
8762666478197546112	2023-10-25	TVEpisode	Sterling and Nina Agdal XLIX	2023-10-13	36	6774048176174390112
8369589592674549112	2023-08-13	TVEpisode	Heroes	2004-02-20	7	7188923726922774112
5957596223732888112	2023-10-27	TVEpisode	Sterling and Carly Aquilino XLVIII	2023-10-20	36	6774048176174390112
4621184520093415112	2024-02-22	TVEpisode	Sterling and Mike "The Situation" Sorrentino II	2024-01-04	38	6774048176174390112
6135253492255868112	2023-09-26	TVEpisode	Sterling and Arielle Vandenberg	2023-09-03	35	6774048176174390112
8191892092989176112	2023-08-13	TVEpisode	Resurrection	2004-02-27	7	7188923726922774112
5759504914174607112	2023-08-13	TVEpisode	Heroes	2004-02-13	7	7188923726922774112
5256121884248870112	2023-08-13	TVEpisode	Lost City	2004-03-19	7	7188923726922774112
6838911976070600112	2023-08-13	TVEpisode	Lost City	2004-03-12	7	7188923726922774112
5813268654607466112	2023-08-11	TVEpisode	NASA's Journey to Mars	2020-01-09	8	6647357901114270112
6412720630530600112	2023-08-12	TVEpisode	The Highway	2021-10-08	1	8581796482599538112
8902413425729281112	2023-08-15	TVEpisode	New Order	2004-07-09	8	7188923726922774112
6336451110621837112	2023-08-17	TVEpisode	End Game	2004-09-17	8	7188923726922774112
7422091555445420112	2023-08-16	TVEpisode	Covenant	2004-08-27	8	7188923726922774112
5964844615125150112	2023-08-19	TVEpisode	Moebius	2005-03-18	8	7188923726922774112
8696471885986312112	2023-08-22	TVEpisode	The Ties That Bind	2005-08-05	9	7188923726922774112
6869847158807573112	2023-08-21	TVEpisode	Avalon	2005-07-22	9	7188923726922774112
5328574519064034112	2024-02-14	TVEpisode	Sterling and Rocsi Diaz XIV	2023-12-29	37	6774048176174390112
9161519978671218112	2023-08-15	TVEpisode	New Order	2004-07-09	8	7188923726922774112
7377018210498577112	2024-02-14	TVEpisode	Sterling and Rocsi Diaz XV	2023-12-29	37	6774048176174390112
8201155777033697112	2024-07-04	TVEpisode	Sterling and Carly Aquilino LXXVI	2024-06-19	38	6774048176174390112
6899404022541512112	2024-07-10	TVEpisode	Brooke Schofield	2024-06-23	42	6774048176174390112
8283666282546654112	2023-08-16	TVEpisode	Icon	2004-08-06	8	7188923726922774112
8077296120043449112	2023-08-17	TVEpisode	Gemini	2005-01-21	8	7188923726922774112
5087310579146758112	2023-08-18	TVEpisode	Threads	2005-03-11	8	7188923726922774112
5929269571238503112	2023-08-10	TVEpisode	Evolution	2003-08-22	7	7188923726922774112
6807945484655741112	2023-08-19	TVEpisode	Moebius	2005-03-25	8	7188923726922774112
5227313263366969112	2024-02-14	TVEpisode	Sterling and Karrueche Tran L	2023-12-29	37	6774048176174390112
8267326033221332112	2024-07-09	TVEpisode	Sterling and Carly Aquilino LXXIX	2024-06-19	38	6774048176174390112
6913634914419264112	2024-07-18	TVEpisode	Brooke Schofield II	2024-06-23	42	6774048176174390112
9190132371376378112	2023-11-02	TVEpisode	Sterling and Carly Aquilino XL	2023-10-25	36	6774048176174390112
5573519306247320112	2023-08-23	TVEpisode	Motorcycle Goggles, Handbuilt Jukeboxes, Vacuum Excavators & Shaving Sets	2019-03-24	32	6823365255190647112
6681529170682150112	2023-09-19	TVEpisode	Tok'ra	1998-10-02	2	7188923726922774112
9128250778424637112	2024-02-29	TVEpisode	Sterling and Angelina Pivarnick III	2024-01-25	38	6774048176174390112
7079615735205412112	2023-09-06	TVEpisode	Thank Heaven for Little Girls, and Big Ones Too	1980-12-25	1	5828688862497145112
6149984147820041112	2024-03-12	TVEpisode	Sterling and Carly Aquilino LXV	2024-03-03	37	6774048176174390112
6690304756657055112	2024-02-29	TVEpisode	Sterling and Angelina Pivarnick IV	2024-01-25	38	6774048176174390112
4710066672106725112	2024-07-18	TVEpisode	Skye Townsend	2024-06-23	42	6774048176174390112
9192645272173116112	2023-10-28	TVEpisode	Sterling and Carly Aquilino L	2023-10-20	36	6774048176174390112
6964237173358194112	2023-08-31	TVEpisode	The Quest	2006-09-22	10	7188923726922774112
6455774558127177112	2023-09-11	TVEpisode	Crash and Burning Up	2023-09-10	1	8930118108881286112
5680707384279215112	2023-09-11	TVEpisode	Tasty Time Travel	2023-08-25	46	4791200799030182112
8658458051096153112	2023-09-12	TVEpisode	Shark Tank	2023-01-20	14	6002411599924498112
6767560614241689112	2023-09-29	TVEpisode	Sterling and Nina Agdal XXXIII	2023-09-04	35	6774048176174390112
4867312083133931112	2023-09-13	TVEpisode	The Big Dig	2023-05-24	21	7196250346352115112
4777915427681891112	2023-10-28	TVEpisode	Sterling and Carly Aquilino XXXIX	2023-10-25	36	6774048176174390112
8048556452672444112	2023-09-18	Movie	Killing Them Softly	2012-09-21	0	
6497645301356537112	2023-10-27	TVEpisode	Sterling and Rocsi Diaz V	2023-10-16	36	6774048176174390112
6756478971782282112	2023-10-27	TVEpisode	Sterling and Carly Aquilino XLIX	2023-10-20	36	6774048176174390112
6611825675509579112	2023-09-08	TVEpisode	London Super Tunnel	2023-02-01	50	8954551503237514112
8797242375665200112	2023-09-19	TVEpisode	Treacherous Traps	2023-07-24	1	7729739501004532112
7806371720895591112	2024-07-23	TVEpisode	Sterling and Karrueche Tran LX	2024-06-26	39	6774048176174390112
5745656257417071112	2024-07-23	TVEpisode	Sterling and Karrueche Tran LXI	2024-06-26	39	6774048176174390112
6193984499563699112	2024-07-30	TVEpisode	Sterling and Karrueche Tran LXIII	2024-06-26	39	6774048176174390112
7312478856762271112	2024-02-29	TVEpisode	Sterling and Mike "The Situation" Sorrentino III	2024-02-01	38	6774048176174390112
5241326717106299112	2024-02-29	TVEpisode	Sterling and Jenni "JWOWW" Farley II	2024-01-18	38	6774048176174390112
5671516714989157112	2023-08-23	TVEpisode	The Fourth Horseman	2005-12-16	9	7188923726922774112
8726839974034001112	2024-03-06	TVEpisode	Sterling and Jenni "JWOWW" Farley III	2024-02-01	38	6774048176174390112
6151290458628977112	2023-08-23	TVEpisode	Prototype	2005-12-09	9	7188923726922774112
7897016676118017112	2023-08-25	TVEpisode	Ripple Effect	2006-01-20	9	7188923726922774112
6129414740418781112	2023-08-25	TVEpisode	Ethon	2006-02-03	9	7188923726922774112
6835186227965088112	2023-08-27	TVEpisode	Netherlands Grand Prix, Qualifying	2023-08-26	0	5584345400977409112
5388176746986532112	2023-09-19	TVEpisode	Secrets	1998-08-21	2	7188923726922774112
5892610084252558112	2024-03-06	TVEpisode	Sterling and Carly Aquilino LXI	2024-03-03	37	6774048176174390112
6041282110799067112	2024-03-05	TVEpisode	Sterling and Gigi Goode	2024-03-01	38	6774048176174390112
5639859606677316112	2024-03-05	TVEpisode	Sterling and Mo Heart	2024-03-01	38	6774048176174390112
9094653187419635112	2023-10-01	TVEpisode	Sterling and Rocsi Diaz	2023-09-10	35	6774048176174390112
6710948848766826112	2023-09-30	TVEpisode	Sterling and Karrueche Tran XXXIV	2023-09-08	35	6774048176174390112
8466284301618149112	2023-09-29	TVEpisode	Sterling and Karrueche Tran XXXII	2023-09-08	35	6774048176174390112
7846040691073106112	2024-07-19	TVEpisode	Sterling and Karrueche Tran LIX	2024-06-26	39	6774048176174390112
6010694172932868112	2023-08-27	TVEpisode	Klumageddon	1999-05-25	3	5422142342997076112
8516714975664745112	2023-08-25	TVEpisode	Off the Grid	2006-02-10	9	7188923726922774112
8660242668307054112	2023-08-30	TVEpisode	200	2006-08-18	10	7188923726922774112
5382647985624853112	2023-08-30	TVEpisode	I Should Have Made Snowmen	2023-09-02	9	8116263681867635112
5254173186837486112	2023-09-03	Movie	Legends of the Fall	1994-12-16	0	
6206216295530422112	2023-09-06	TVEpisode	The Quest	2007-04-13	10	7188923726922774112
7803867419122168112	2023-08-30	TVEpisode	Memento Mori	2006-09-08	10	7188923726922774112
5487978385845239112	2023-08-30	TVEpisode	Counterstrike	2006-08-25	10	7188923726922774112
5850658275927806112	2023-09-06	TVEpisode	Frantastic Voyage	2023-09-04	18	7225479914576293112
9222027207589197112	2023-08-30	TVEpisode	Company of Thieves	2006-09-15	10	7188923726922774112
7207050799594843112	2023-09-12	TVEpisode	Shark Tank	2023-01-13	14	6002411599924498112
6501003989490815112	2023-09-01	TVEpisode	Shark Tank	2023-01-06	14	6002411599924498112
4911008415133537112	2023-09-04	TVEpisode	Italy Grand Prix	2023-09-03	0	5584345400977409112
9015911243884963112	2023-09-06	TVEpisode	America: Cross Country Adventure	2021-03-28	5	7844635958942523112
7772412204923260112	2023-09-11	TVEpisode	I'm Done, I'm Done, I'm Done	2023-08-27	1	8930118108881286112
4979971724538565112	2023-09-11	TVEpisode	Trading One Hell for Another	2023-08-20	1	8930118108881286112
6547604797065576112	2023-09-14	TVEpisode	Tennesse Whiskey; Nightvision; Saunas	2012-08-02	9	7112240447450524112
8648201047854372112	2024-07-30	TVEpisode	Sterling and Karrueche Tran LXII	2024-06-26	39	6774048176174390112
4698089067999478112	2023-10-10	CreativeWork	On the Line: The Race of Champions	\N	0	
5043372788829684112	2023-12-10	Movie	Joe Versus the Volcano	\N	0	
7369365212529535112	2024-03-12	TVEpisode	Sterling and Carly Aquilino LXII	2024-03-03	37	6774048176174390112
4664402834261118112	2023-10-10	TVEpisode	Chain Reaction	2001-01-05	4	7188923726922774112
6321454150258247112	2023-09-26	TVEpisode	Variety of Flavor	2023-09-08	46	4791200799030182112
7692194224617068112	2023-10-05	TVEpisode	Tropical Madness	1981-11-12	2	5828688862497145112
6229133029524653112	2023-10-03	TVEpisode	New Ground	2000-02-18	3	7188923726922774112
4965444362432158112	2024-03-21	TVEpisode	Sterling and Camille Kostek XIX	2023-11-03	37	6774048176174390112
7984852525804066112	2023-10-05	TVEpisode	Crystal Skull	2000-03-03	3	7188923726922774112
5692802772064851112	2023-10-05	TVEpisode	Nemesis	2000-03-10	3	7188923726922774112
8761431396981794112	2023-10-05	TVEpisode	The Other Side	2000-07-07	4	7188923726922774112
6569521162354520112	2024-03-22	TVEpisode	Sterling and Karrueche Tran XLII	2023-11-03	37	6774048176174390112
5610610821624130112	2023-09-24	TVEpisode	Japan Grand Prix	2023-09-24	0	5584345400977409112
8023504206036031112	2023-10-10	TVEpisode	Serpent's Venom	2000-09-29	4	7188923726922774112
8400994766230503112	2024-03-21	TVEpisode	Sterling and Camille Kostek XX	2023-11-03	37	6774048176174390112
8843985969846211112	2024-03-26	TVEpisode	Sterling and Nina Agdal LIX	2024-03-17	38	6774048176174390112
6247923631850968112	2024-08-02	TVEpisode	Sterling and Karrueche Tran LXIV	2024-06-26	39	6774048176174390112
8695578670061546112	2024-08-02	TVEpisode	Sterling and Nina Agdal LXVI	2024-07-03	39	6774048176174390112
4719357757209583112	2023-09-20	TVEpisode	Touchstone	1998-10-30	2	7188923726922774112
6692038891038376112	2023-09-21	TVEpisode	The Fifth Race	1999-01-22	2	7188923726922774112
5014294670509689112	2023-09-21	TVEpisode	One False Step	1999-02-19	2	7188923726922774112
6677909212284206112	2023-11-02	TVEpisode	Sterling and Rocsi Diaz VII	2023-10-27	37	6774048176174390112
6911029791635163112	2023-11-02	TVEpisode	Sterling and Rocsi Diaz VI	2023-10-27	36	6774048176174390112
7908163326157106112	2023-11-11	TVEpisode	Sterling and Carly Aquilino LV	2023-12-15	36	6774048176174390112
5465691774507012112	2023-10-01	TVEpisode	Sterling and Rocsi Diaz II	2023-09-10	35	6774048176174390112
5131104415002884112	2024-03-12	TVEpisode	Sterling and Carly Aquilino LXIII	2024-03-03	37	6774048176174390112
8924399200767686112	2024-03-19	TVEpisode	Sterling and Karrueche Tran LI	2024-03-10	37	6774048176174390112
5886800254064031112	2024-03-25	TVEpisode	Sterling and Symone	2024-03-08	38	6774048176174390112
7316704668422250112	2023-09-25	TVEpisode	Brawl Out	2023-09-17	1	8930118108881286112
4909773060861797112	2023-09-27	TVEpisode	Don't You Be My Neighbor	2023-09-18	18	7225479914576293112
9202534157242311112	2023-09-22	TVEpisode	Kolcheck, A.	2015-05-11	6	4642913327036075112
6716411536380264112	2023-09-22	TVEpisode	Chernoff, K.	2015-05-18	6	4642913327036075112
6849402135998008112	2023-09-25	TVEpisode	Perspectives on Christmas	1997-12-16	5	8135854751464083112
9013482730128139112	2023-09-25	TVEpisode	A Little Mystery	2023-09-11	18	7225479914576293112
4994375513692896112	2023-10-03	TVEpisode	Sterling and Carly Aquilino XXX	2023-09-11	35	6774048176174390112
7199523989987169112	2023-10-06	TVEpisode	Upgrades	2000-07-14	4	7188923726922774112
5497450741728515112	2023-10-07	TVEpisode	Wave Goodbye	1981-11-19	2	5828688862497145112
6437889704512964112	2023-10-07	TVEpisode	Window of Opportunity	2000-08-04	4	7188923726922774112
5911024071990545112	2023-10-07	TVEpisode	The Sixth Position	1981-12-17	2	5828688862497145112
8369752946788107112	2023-10-07	TVEpisode	Watergate	2000-08-11	4	7188923726922774112
5420492422060861112	2023-10-08	TVEpisode	FCP Euro Northeast Grand Prix	\N	0	5058915465242102112
8995020068025822112	2023-10-10	TVEpisode	The Curse	2000-09-22	4	7188923726922774112
4958903557604183112	2023-09-22	TVEpisode	Dragons' Den	\N	18	8720544592473937112
6923565883126624112	2024-03-22	TVEpisode	Sterling and Karrueche Tran LII	2024-03-10	37	6774048176174390112
7172729946510035112	2023-09-25	TVEpisode	Seth	1999-07-02	3	7188923726922774112
7187857668487047112	2024-03-25	TVEpisode	Sterling and Karrueche Tran LIII	2024-03-10	37	6774048176174390112
8934521146273832112	2023-09-25	Movie	Push	2019-06-06	0	
6514433111765879112	2023-09-22	TVEpisode	Big Rig	2022-08-07	1	8682464520245237112
5191091097290290112	2023-09-25	TVEpisode	True Survivors	\N	62	4758191019189134112
8613677064020607112	2023-09-27	TVEpisode	Rules of Engagement	1999-08-20	3	7188923726922774112
5735563187129523112	2023-09-27	TVEpisode	Demons	1999-08-13	3	7188923726922774112
7533531919090233112	2023-09-28	TVEpisode	Forever in a Day	1999-10-08	3	7188923726922774112
7193785230700234112	2023-09-28	TVEpisode	Jolinar's Memories	1999-10-22	3	7188923726922774112
7314341700959738112	2023-10-04	TVEpisode	Sterling and Karrueche Tran XXXIX	2023-09-15	35	6774048176174390112
5305488893264404112	2023-09-24	TVEpisode	Billy Joe Bob	1981-10-08	2	5828688862497145112
8686119211549405112	2023-10-04	TVEpisode	Memories Are Forever	1981-11-05	2	5828688862497145112
7902181501440860112	2023-09-23	TVEpisode	Japan Grand Prix, Qualifying	2023-09-23	0	5584345400977409112
8557272215653694112	2023-09-28	TVEpisode	Shark Tank	2023-01-27	14	6002411599924498112
9155288484340405112	2023-09-28	TVEpisode	The Devil You Know	1999-10-29	3	7188923726922774112
8374648741742424112	2023-10-04	TVEpisode	Memories Are Forever	1981-11-05	2	5828688862497145112
8483544570301759112	2023-10-04	TVEpisode	Champion Chefs	2023-09-15	46	4791200799030182112
7718307045997635112	2024-08-02	TVEpisode	The Spire	2023-01-26	1	6124985572721027112
8043418253161219112	2023-10-26	TVEpisode	Descent	2002-06-21	6	7188923726922774112
6665076703353501112	2023-10-27	TVEpisode	Parth Ferengi's Heart Place	2023-10-05	4	9037311307409885112
5764977157057226112	2023-11-11	TVEpisode	Sterling and Carly Aquilino XLIV	2023-10-30	36	6774048176174390112
8872204095550169112	2023-10-23	TVEpisode	Ancient Builders of the Amazon	2023-02-15	50	8954551503237514112
8320261417357625112	2023-10-24	TVEpisode	Shark Tank	2023-03-03	14	6002411599924498112
4782747549052439112	2023-10-25	TVEpisode	Twovix	2023-09-07	4	9037311307409885112
5916309879815554112	2023-10-23	TVEpisode	Desperate Measures	2001-09-07	5	7188923726922774112
5511057606736205112	2023-10-23	TVEpisode	Proving Ground	2002-03-08	5	7188923726922774112
5114871018227364112	2023-10-27	TVEpisode	Empathalogical Fallacies	2023-09-28	4	9037311307409885112
7539796894362084112	2023-11-11	TVEpisode	Sterling and Carly Aquilino LI	2023-10-30	36	6774048176174390112
5678157836879260112	2023-12-04	TVEpisode	Sterling and Nina Agdal XLVI	2023-11-10	36	6774048176174390112
7359690844166936112	2023-11-11	TVEpisode	Sterling and Nina Agdal LIII	2023-12-08	36	6774048176174390112
7795626711919964112	2024-03-27	TVEpisode	Sterling and Nina Agdal LX	2024-03-17	38	6774048176174390112
8484013806128655112	2023-10-15	Movie	The 'Burbs	1989-02-17	0	
6629901561421111112	2023-10-17	TVEpisode	Triple D Nation: Chicken, Cheese and Chili Paste	2023-09-29	47	4791200799030182112
8316638653566200112	2024-04-09	TVEpisode	Sterling and Lolo Wood XXXII	2024-03-24	38	6774048176174390112
4797307242947168112	2023-10-18	TVEpisode	Red Sky	2001-07-27	5	7188923726922774112
8062891202630980112	2024-04-12	TVEpisode	Sterling and Carly Aquilino LXVII	2024-03-31	38	6774048176174390112
4895272725859616112	2024-04-12	TVEpisode	Sterling and Carly Aquilino LXVIII	2024-03-31	38	6774048176174390112
7362915085103408112	2024-04-04	TVEpisode	Sterling and Lolo Wood XXXI	2024-03-24	38	6774048176174390112
8961201457377079112	2024-08-03	Movie	The Fall Guy	2024-04-24	0	
8247145932797476112	2024-08-02	TVEpisode	Sterling and Nina Agdal LXV	2024-07-03	39	6774048176174390112
6291204558014088112	2024-03-26	TVEpisode	Sterling and Nina Agdal LVIII	2024-03-17	38	6774048176174390112
6686433244884668112	2023-10-11	TVEpisode	Food Trucks and Family Feasts	2023-09-22	2	8290899894231225112
7754736827496214112	2023-10-09	TVEpisode	Sterling and Nina Agdal XXXIV	2023-09-17	35	6774048176174390112
6375332789320385112	2023-10-11	TVEpisode	Absolute Power	2001-01-19	4	7188923726922774112
5708028800912637112	2023-10-12	TVEpisode	Prodigy	2001-02-02	4	7188923726922774112
4715087710434796112	2023-10-16	TVEpisode	Exodus	2001-02-16	4	7188923726922774112
4798897386090891112	2023-10-18	Movie	Autumn in New York	2000-08-11	0	
8918506374119668112	2023-10-17	TVEpisode	The Fifth Man	2001-07-20	5	7188923726922774112
9090420171288733112	2023-10-21	TVEpisode	Three Minus Two	1982-04-01	2	5828688862497145112
7689899226642511112	2023-10-23	TVEpisode	Shark Tank	2023-02-17	14	6002411599924498112
5446021322449393112	2023-10-24	TVEpisode	Crisis Point 2: Paradoxus	2022-10-13	3	9037311307409885112
6431180507433100112	2023-10-24	TVEpisode	Trusted Sources	2023-09-02	3	9037311307409885112
8361150542871835112	2023-10-25	TVEpisode	I Have No Bones Yet I Must Flee	2023-09-07	4	9037311307409885112
7719031706600395112	2023-10-25	TVEpisode	Triple D Nation: Wraps and Rolls	2023-10-06	47	4791200799030182112
6912229467732897112	2023-10-26	TVEpisode	Ruby Re-Burn	2023-08-12	4	4854739062553106112
9158126761133349112	2023-10-26	TVEpisode	In the Cradle of Vexilon	2023-09-14	4	9037311307409885112
5330408251129433112	2023-10-26	TVEpisode	Redemption	2002-06-14	6	7188923726922774112
9121104716754036112	2024-03-26	TVEpisode	Sterling and Karrueche Tran LIV	2024-03-10	37	6774048176174390112
5396349169909226112	2024-04-03	TVEpisode	Sterling and Lolo Wood XXIX	2024-03-24	38	6774048176174390112
5315468398773182112	2024-04-03	TVEpisode	Sterling and Lolo Wood XXX	2024-03-24	38	6774048176174390112
7103071397945650112	2024-04-09	TVEpisode	Sterling and Carly Aquilino LXVI	2024-03-31	37	6774048176174390112
7742245596506478112	2024-08-02	TVEpisode	Sterling and Nina Agdal LXIV	2024-07-03	39	6774048176174390112
7262327173858874112	2023-10-13	TVEpisode	Ghost Writer	1981-12-24	2	5828688862497145112
7204156896037899112	2023-10-13	TVEpisode	Child's Play	\N	4	7188923726922774112
7088460472244590112	2023-10-17	TVEpisode	Computer Date	1982-01-14	2	5828688862497145112
5344758745298710112	2023-10-21	TVEpisode	The Last Page	1982-03-04	2	5828688862497145112
6319074084211740112	2023-10-18	TVEpisode	Try to Remember	1982-01-28	2	5828688862497145112
4976565242009173112	2023-10-19	TVEpisode	Texas Lightning	1982-02-18	2	5828688862497145112
4725593583048439112	2023-10-22	CreativeWork	Stingray Arena Anthems	2023-10-01	0	
7299714526531665112	2023-10-19	TVEpisode	Star Chasers of Senegal	2023-02-08	50	8954551503237514112
5874265694355909112	2023-10-24	TVEpisode	Redemption	2002-06-07	6	7188923726922774112
7120082971684458112	2023-10-19	TVEpisode	Italian Ice	1982-02-04	2	5828688862497145112
6756183078170613112	2023-10-20	TVEpisode	Double Jeopardy	1982-02-25	2	5828688862497145112
8913575175934539112	2023-10-22	TVEpisode	United States Grand Prix	2023-10-22	0	5584345400977409112
5421503828513383112	2023-10-24	TVEpisode	The Stars at Night	2022-10-27	3	9037311307409885112
7002299157114877112	2023-10-24	TVEpisode	Revelations	2002-05-17	5	7188923726922774112
7098994322113961112	2023-10-24	TVEpisode	Meridian	2002-05-10	5	7188923726922774112
7015134183939983112	2023-10-30	TVEpisode	Testing Tech Repair: Who's Spying On You?	2024-03-25	51	7097268181266001112
5189870205527294112	2023-11-14	TVEpisode	Girl Power	2023-08-28	1	6196794598537403112
5907577128553693112	2023-11-12	TVEpisode	Far From Home	2023-09-25	2	5704216532975937112
8580213052145960112	2023-11-13	TVEpisode	Future Shock	2023-08-07	1	6196794598537403112
6821847119465186112	2024-08-03	TVEpisode	Sterling and Carly Aquilino II	2023-04-10	31	6774048176174390112
5455323715720932112	2023-11-13	TVEpisode	Sandwich-Fest	2023-10-27	47	4791200799030182112
5318861618187392112	2024-04-19	TVEpisode	Sterling and Rocsi Diaz XVII	2024-04-07	38	6774048176174390112
4786693258487213112	2023-12-04	TVEpisode	Sterling and Nina Agdal XLV	2023-11-10	36	6774048176174390112
7296188600036802112	2024-08-03	TVEpisode	Sterling and Karrueche Tran VIII	2023-04-03	31	6774048176174390112
5337439995475393112	2024-04-19	TVEpisode	Sterling and Carly Aquilino LXIX	2024-03-31	38	6774048176174390112
8576315521282020112	2024-04-19	TVEpisode	Sterling and Rocsi Diaz XVI	2024-04-07	38	6774048176174390112
5645515628431160112	2023-10-05	TVEpisode	Sterling and Karrueche Tran XL	2023-09-15	35	6774048176174390112
5380198182643369112	2023-10-10	TVEpisode	Sterling and Nina Agdal XXXV	2023-09-17	35	6774048176174390112
7523744086384252112	2023-10-27	TVEpisode	Nightwalkers	2002-07-12	6	7188923726922774112
9034601226408178112	2023-10-27	TVEpisode	Dragons' Den	\N	18	8720544592473937112
5102270880000588112	2023-10-27	TVEpisode	Shadow Play	2002-07-26	6	7188923726922774112
7641057243008868112	2023-11-08	TVEpisode	John Hastings	2020-06-14	0	6333339068355189112
5345964787834227112	2023-10-29	TVEpisode	The Cure	2002-08-16	6	7188923726922774112
9131564630595354112	2023-10-30	TVEpisode	A Few Badgeys More	2023-10-12	4	9037311307409885112
7023752073943483112	2023-10-30	TVEpisode	Mexico Grand Prix	2023-10-29	0	5584345400977409112
6472671815614941112	2023-11-02	TVEpisode	Ki'i's Don't Lie	1982-10-07	3	5828688862497145112
5989125617939772112	2023-11-01	TVEpisode	Did You See the Sunrise?	1982-09-30	3	5828688862497145112
8359614630027967112	2023-11-02	TVEpisode	The Ultimate Pergola Deck	2022-07-16	2	8488862777365168112
5852265098316011112	2023-11-13	TVEpisode	Mass Appeal	2023-08-14	1	6196794598537403112
8919992317464505112	2023-11-02	TVEpisode	Past Tense	1982-10-21	3	5828688862497145112
7436955666998846112	2023-11-03	TVEpisode	The Spectrum of Survival	2022-03-13	14	6366183814312296112
7282408599900578112	2023-11-03	TVEpisode	The Changeling	2003-02-28	6	7188923726922774112
5801823722752733112	2023-11-05	TVEpisode	East, South, West	2023-10-20	47	4791200799030182112
7290052557585308112	2023-11-06	TVEpisode	Productive Panic	2023-09-25	18	7225479914576293112
7514971489291570112	2023-11-04	TVEpisode	Dragons' Den	\N	18	8720544592473937112
7509437860344275112	2023-11-04	TVEpisode	Fallen	2003-06-13	7	7188923726922774112
8382745018555553112	2023-11-04	TVEpisode	Full Circle	2003-03-21	6	7188923726922774112
7903897761345427112	2023-11-05	TVEpisode	Black on White	1982-10-28	3	5828688862497145112
8063635828129149112	2023-11-13	TVEpisode	What Is Love?	2023-08-14	1	6196794598537403112
4917931779476156112	2023-11-06	TVEpisode	Shark Tank	2023-03-10	14	6002411599924498112
8633619948352181112	2023-11-06	Movie	Babylon 5: The Road Home	\N	0	
5894556704954848112	2023-11-07	TVEpisode	Old Friends, New Planets	2023-11-02	4	9037311307409885112
5537228973611749112	2023-11-09	TVEpisode	New Eye on the Universe	2023-02-22	50	8954551503237514112
6051326409719077112	2023-11-10	TVEpisode	Weathering the Future	2023-04-12	50	8954551503237514112
5996137904874448112	2023-11-09	TVEpisode	Avenger 2.0	2003-08-08	7	7188923726922774112
8214644701934554112	2023-11-12	TVEpisode	Exposure	2023-10-02	2	5704216532975937112
7626209279180313112	2023-11-13	Movie	12 Strong	2018-01-18	0	
7025353413341461112	2023-11-14	TVEpisode	Multiverse of American Dadness	2023-10-02	18	7225479914576293112
7929801796369935112	2023-10-31	TVEpisode	Did You See the Sunrise?	1982-09-30	3	5828688862497145112
6621918698284031112	2023-11-12	TVEpisode	Panic	2023-10-09	2	5704216532975937112
7306662220347616112	2023-11-14	TVEpisode	The Decade's Greatest Rivalries	2023-07-31	1	6196794598537403112
7634088984401259112	2023-11-14	TVEpisode	Decade of Disruption	2023-08-28	1	6196794598537403112
7727990790921366112	2023-11-13	TVEpisode	The Rise of the Internet	2023-08-21	1	6196794598537403112
6640047631853868112	2023-11-07	TVEpisode	Revisions	2003-07-11	7	7188923726922774112
5097488044058546112	2023-11-14	TVEpisode	Z.O.I.N.C.S.	2023-10-30	19	7225479914576293112
8879490289012354112	2023-11-15	TVEpisode	Pressure	2023-11-06	2	5704216532975937112
7391505387319170112	2023-11-02	TVEpisode	Candy Revolution	2023-03-12	4	6509213195746878112
8731455521587442112	2023-11-04	TVEpisode	Prophecy	2003-03-14	6	7188923726922774112
7091723930387351112	2023-11-05	TVEpisode	Homecoming	2003-06-13	7	7188923726922774112
7904278218306418112	2023-11-07	CreativeWork	Drive	\N	0	
7325575068316317112	2023-11-07	TVEpisode	The Inner Fight	2023-10-26	4	9037311307409885112
7594296011626872112	2023-11-12	TVEpisode	Character	2023-10-16	2	5704216532975937112
6984944762121821112	2023-11-13	TVEpisode	Comedy Rebellion	2023-07-31	1	6196794598537403112
8714435013844171112	2023-11-12	TVEpisode	Dragons' Den	\N	18	8720544592473937112
5466576498558543112	2023-11-13	TVEpisode	Teenage Dreams	2023-08-07	1	6196794598537403112
8957403034264040112	2023-11-16	TVEpisode	Springtime for Napoleon	2023-11-15	10	6491536393673824112
6737291094115152112	2023-11-15	TVEpisode	Survival	2023-11-13	2	5704216532975937112
8421838016793674112	2023-12-25	TVEpisode	Holmes Is Where the Heart Is	1984-03-08	4	5828688862497145112
5273319001482967112	2023-12-28	TVEpisode	Dream a Little Dream	1984-03-29	4	5828688862497145112
7193599707418163112	2023-12-29	TVEpisode	I Witness	1984-05-03	4	5828688862497145112
8342165332790768112	2023-12-28	TVEpisode	On Face Value	1984-03-15	4	5828688862497145112
6822032076524659112	2023-12-30	TVEpisode	Echoes of the Mind	1984-09-27	5	5828688862497145112
5154448828978691112	2024-01-02	TVEpisode	The Legacy of Garwood Huddle	1984-10-18	5	5828688862497145112
7559209962320619112	2024-01-04	TVEpisode	Fragments	1984-11-01	5	5828688862497145112
6586760522900299112	2024-01-02	TVEpisode	Echoes of the Mind	1984-09-27	5	5828688862497145112
8451060690402000112	2023-12-16	Movie	Peggy Sue Got Married	1986-10-10	0	
8824477190248512112	2024-01-04	Movie	Lords of Dogtown	2005-06-03	0	
5414827914134707112	2023-12-10	TVEpisode	China	\N	1	6418490468116199112
8400639640940932112	2023-12-25	Movie	After Hours	1985-10-11	0	
7916199474154481112	2023-12-19	TVEpisode	Shark Tank	2023-03-31	14	6002411599924498112
5013842652861248112	2024-04-19	TVEpisode	Sterling and Rocsi Diaz XVIII	2024-04-07	38	6774048176174390112
6826264276873112112	2024-04-23	TVEpisode	Sterling and Rocsi Diaz XIX	2024-04-07	38	6774048176174390112
4850097684803581112	2024-04-26	TVEpisode	Sterling and Karrueche Tran LVI	2024-04-14	37	6774048176174390112
5648488907422807112	2024-04-30	TVEpisode	Sterling and Karrueche Tran LVIII	2024-04-14	39	6774048176174390112
5892747494810381112	2024-05-03	TVEpisode	Sterling and Karrueche Tran LVII	2024-04-14	39	6774048176174390112
6537080437245606112	2024-05-03	TVEpisode	Sterling and Karrueche Tran	2023-04-03	31	6774048176174390112
8346058694709325112	2024-08-03	TVEpisode	Sterling and Nina Agdal II	2023-04-05	31	6774048176174390112
7700489634272542112	2024-01-06	TVEpisode	Under World	1984-10-25	5	5828688862497145112
6367590532071876112	2023-10-10	TVEpisode	Sterling and Karrueche Tran XXXVIII	2023-09-18	35	6774048176174390112
7595442991845434112	2023-12-11	Movie	Murder by Decree	1979-10-08	0	
8643367327706371112	2023-12-03	TVEpisode	Las Vegas Grand Prix	2023-11-18	0	5584345400977409112
6178886551663664112	2023-12-03	TVEpisode	Wrapped, Pied and Fried	2023-11-17	47	4791200799030182112
4719098774367047112	2023-12-04	Movie	Cool Hand Luke	1967-11-01	0	
8786954202518877112	2023-12-05	TVEpisode	The Lateness of the Hour	1960-12-02	2	8866251514307483112
6228876259703807112	2023-12-05	Movie	Race the Sun	1996-03-22	0	
8465077079055687112	2023-12-06	Movie	Fletch	1985-05-31	0	
8764387344718470112	2023-12-07	Movie	Cowboys & Aliens	2011-07-29	0	
5116903982556188112	2023-12-08	TVEpisode	A Kind of Magic	2023-12-06	2	4621882584170411112
7172500162183685112	2023-12-09	TVEpisode	Dragons' Den	\N	18	8720544592473937112
5812078271177821112	2023-12-09	TVEpisode	Operation: Silent Night	1983-12-15	4	5828688862497145112
6349029045756244112	2023-12-10	Movie	Upside Down	2012-11-08	0	
5831773130018318112	2023-12-10	TVEpisode	The Haunted Hampton House	2023-11-18	58	6120300239185760112
8552685331213312112	2023-12-10	Movie	Adam at 6 A.M.	1970-09-22	0	
7261818394676345112	2023-12-11	Movie	Alpha Dog	2007-01-12	0	
6811812736917610112	2023-12-13	Movie	The Lake House	2006-06-16	0	
8511069348075598112	2023-12-14	Movie	The Shape of Things to Come	1979-05-04	0	
7977086556187235112	2023-12-15	TVEpisode	Christmas Party	2023-12-13	1	6586752362154215112
6107767086800764112	2023-12-16	Movie	Heathers	1989-03-31	0	
7549586247468136112	2023-12-15	TVEpisode	Part 1	2020-11-18	1	7533267650405196112
7404705771791657112	2023-12-17	TVEpisode	Meat and Sweet	2023-03-17	45	4791200799030182112
7634867614027858112	2023-12-17	TVEpisode	Flavor Explosion	2023-12-08	47	4791200799030182112
4869373586029654112	2023-12-21	Movie	Abominable	2019-09-26	0	
6015219911309774112	2023-12-16	Movie	Dangerous Liaisons	1988-12-11	0	
8966246196430273112	2023-12-29	TVEpisode	Southern, Western and North of the Border	2023-12-15	47	4791200799030182112
6234646581886328112	2023-12-28	Movie	Crypt of the Vampire	\N	0	
5123235232884905112	2023-12-31	Movie	Night of the Creeps	1986-08-22	0	
5882990307061344112	2023-12-09	Movie	Texas Chainsaw Massacre: The Next Generation	\N	0	
7794440919837191112	2023-12-29	Movie	The River Wild	1994-09-30	0	
8990129300934456112	2023-12-23	Movie	Charade	1963-12-05	0	
6808790776014030112	2024-01-01	Movie	Better Luck Tomorrow	2003-04-11	0	
7879235048718960112	2024-01-01	Movie	20 Million Miles to Earth	1957-06-01	0	
8990870939734241112	2023-12-09	TVEpisode	Dragons' Den	\N	18	8720544592473937112
6189245246274246112	2023-12-09	Movie	Wild Things	1998-03-20	0	
5989065757059093112	2023-12-10	TVEpisode	The Royal Ontario Museum	2011-12-23	1	7825153502402489112
8949889143426298112	2023-12-11	Movie	Krull	1983-07-29	0	
8815897106476366112	2023-12-15	TVEpisode	Just Add Water	2014-01-30	3	5367466045703576112
5685408132894557112	2023-12-16	Movie	Old Stock	\N	0	
8326384175635577112	2023-12-16	TVEpisode	Part 2	2020-11-18	1	7533267650405196112
6146572815670527112	2023-12-17	Movie	Hellboy	2004-03-30	0	
8895038329858764112	2023-12-28	Movie	Into the Night	1985-05-10	0	
6969418280412037112	2024-01-02	TVEpisode	Flavortown and Country Cookin'	2023-12-22	2	8290899894231225112
7981485441354327112	2024-01-06	TVEpisode	Blind Justice	1984-11-08	5	5828688862497145112
9184120793484196112	2023-12-09	Movie	Night Moves	1975-06-11	0	
7169594307737959112	2023-12-09	TVEpisode	Dragons' Den	\N	18	8720544592473937112
4770025188337128112	2024-01-01	Movie	The Swarm	1978-07-14	0	
6598959138337983112	2024-01-11	TVEpisode	Ozark Outlaws to the Rescue	2023-12-26	13	5217253762355250112
7577394688847492112	2024-01-13	TVEpisode	Compulsion	1985-01-24	5	5828688862497145112
7940173713019020112	2024-01-27	TVEpisode	A Pretty Good Dancing Chicken	1985-04-04	5	5828688862497145112
7871421923687070112	2024-05-18	TVEpisode	Sterling and Paige Desorbo	2024-04-28	40	6774048176174390112
8764772730664037112	2024-02-04	TVEpisode	Timothée Chalamet; Zendaya; Austin Butler; Florence Pugh; Benson Boone	2024-02-01	22	6832528209303675112
6364060594029095112	2023-12-04	TVEpisode	Sterling and Carly Aquilino LII	2023-11-17	36	6774048176174390112
6366617607422796112	2023-12-05	TVEpisode	Sterling and Karrueche Tran XLIII	2023-11-17	37	6774048176174390112
6547321616150015112	2023-12-05	TVEpisode	Sterling and Camille Kostek XXIV	2023-11-17	37	6774048176174390112
6854879461706872112	2024-01-05	TVEpisode	Mac's Back	1984-10-11	5	5828688862497145112
8900324842016973112	2024-02-01	TVEpisode	Chasing Carbon Zero	2023-04-26	50	8954551503237514112
7296952386544668112	2024-02-09	Movie	Knives Out	2019-11-27	0	
5579886715476303112	2024-02-09	TVEpisode	Encounter at Farpoint	1987-09-28	1	6708008572006424112
7005101327318928112	2024-02-13	Movie	Enter the Void	2010-09-24	0	
6779111333921273112	2024-02-12	Movie	The Hobbit: The Battle of the Five Armies	2014-12-12	0	
4625790228296752112	2024-02-13	TVEpisode	Soup, Sandwiches and Seafood	2024-02-02	48	4791200799030182112
6093884507455312112	2024-05-03	TVEpisode	Sterling and Lolo Wood XXXIII	2024-04-21	39	6774048176174390112
7327129984702439112	2024-05-03	TVEpisode	Sterling and Lolo Wood XXXIV	2024-04-21	39	6774048176174390112
8549414008683872112	2024-05-09	TVEpisode	Sterling and Carly Aquilino	2023-04-10	31	6774048176174390112
9080352002767116112	2024-05-14	TVEpisode	Sterling and Nina Agdal LXIII	2024-04-28	39	6774048176174390112
6804319822038397112	2023-10-11	TVEpisode	Sterling and Carly Aquilino XXXIV	2023-09-22	35	6774048176174390112
8860295698457390112	2023-10-14	TVEpisode	Sterling and Carly Aquilino XXXV	2023-09-25	35	6774048176174390112
9093086405790205112	2023-10-14	TVEpisode	Sterling and Nina Agdal XXXVII	2023-10-23	35	6774048176174390112
9072868586933267112	2024-01-11	TVEpisode	Kiss of the Sabre	1984-12-13	5	5828688862497145112
5382440103408360112	2023-12-05	TVEpisode	Sterling and Carly Aquilino LIII	2023-11-17	36	6774048176174390112
6877225942809652112	2023-12-05	TVEpisode	Sterling and Camille Kostek XXIII	2023-11-17	37	6774048176174390112
5086204396777320112	2024-01-20	TVEpisode	Ms. Jones	1985-03-07	5	5828688862497145112
7939727910216651112	2024-01-06	TVEpisode	Tran Quoc Jones	1984-11-29	5	5828688862497145112
4614722697508180112	2024-01-06	TVEpisode	Murder 101	1984-11-15	5	5828688862497145112
7477165081833599112	2024-01-08	Movie	The Dirty Dozen	1967-06-15	0	
9149417919193076112	2024-01-08	Movie	Predestination	2015-01-07	0	
4714599609500625112	2024-01-08	Movie	Daybreakers	2010-01-08	0	
8435463977680513112	2024-01-12	TVEpisode	Shark Tank	2023-04-07	14	6002411599924498112
4823621708070154112	2024-01-12	TVEpisode	Little Games	1985-01-03	5	5828688862497145112
5489986342917683112	2024-01-14	TVEpisode	From Noodle to Strudel	2024-01-05	48	4791200799030182112
4819199583437460112	2024-02-07	TVEpisode	Deja Vu	1985-09-26	6	5828688862497145112
5899475331055083112	2024-01-10	Movie	Pale Rider	1985-06-28	0	
7181565253097647112	2024-01-25	TVEpisode	Russian Dolls; Aloe Vera; Flags	2013-10-31	10	7112240447450524112
8622571200348647112	2024-01-26	TVEpisode	Bells; Hurricane Clean Up; Dates	2013-10-24	10	7112240447450524112
7308766416547490112	2024-02-10	TVEpisode	Round and Around	1985-10-24	6	5828688862497145112
6037552640248213112	2024-01-12	TVEpisode	Professor Jonathan Higgins	1985-01-10	5	5828688862497145112
4930453971021176112	2024-01-16	TVEpisode	All for One	1985-01-31	5	5828688862497145112
4773977000795436112	2024-01-16	TVEpisode	All for One	1985-01-31	5	5828688862497145112
5960536595184979112	2024-01-16	TVEpisode	Owned It	2018-03-14	9	6229452957505901112
9088311528293985112	2024-01-18	TVEpisode	The Love-for-Sale Boat	1985-02-14	5	5828688862497145112
6349911340556967112	2024-01-26	TVEpisode	Press Your Luck's Holiday Extravaganza II	2023-11-28	5	7350561899827239112
7272528419486396112	2024-01-23	TVEpisode	Hearty Handfuls	2024-01-12	48	4791200799030182112
4794680937209403112	2024-01-26	TVEpisode	Royalty!!!	2024-01-11	5	7350561899827239112
6589855555042732112	2024-01-21	TVEpisode	The Man From Marseilles	1985-03-14	5	5828688862497145112
6327914586871817112	2024-01-24	TVEpisode	Paris Sewers; Beretta; Cotton	2013-10-17	10	7112240447450524112
7630222004025342112	2024-01-20	TVEpisode	Let Me Hear the Music	1985-02-21	5	5828688862497145112
8786733033394686112	2024-01-26	TVEpisode	The Whammy Strikes Back	2024-01-18	5	7350561899827239112
5754083231770894112	2024-01-27	TVEpisode	Torah, Torah, Torah	1985-03-28	5	5828688862497145112
8422346744628928112	2024-01-26	Movie	Braveheart	1995-05-24	0	
7439944167583515112	2024-02-10	TVEpisode	Deja Vu	1985-09-26	6	5828688862497145112
8390016198101131112	2024-01-28	TVEpisode	Triple D Nation: Fresh and Fried	2024-01-19	48	4791200799030182112
4901162453905239112	2024-01-30	Movie	The Replacements	2000-08-07	0	
5986754882221025112	2024-02-11	Movie	The Hobbit: An Unexpected Journey	2012-12-13	0	
7729495408042586112	2024-02-09	TVEpisode	Press My L-U-C-K!	2024-02-01	5	7350561899827239112
6868720693015013112	2024-02-12	Movie	The Hobbit: The Desolation of Smaug	\N	0	
6717742219714053112	2024-02-11	Movie	V for Vendetta	2006-03-16	0	
8852768177781182112	2024-02-10	TVEpisode	Old Acquaintance	1985-10-03	6	5828688862497145112
6458562651085466112	2024-03-04	TVEpisode	This Is the Battle We've Been Waiting For	2024-01-09	1	4820226555821797112
8455692573754777112	2024-02-29	TVEpisode	Mad Dogs and Englishmen	1986-01-23	6	5828688862497145112
5603287522463475112	2024-03-05	TVEpisode	Bird, Belly and Beef	2024-02-23	48	4791200799030182112
8805948410259616112	2024-03-01	TVEpisode	The Story of the Prize Monster and the Hobbit Hole	2021-08-11	3	7350561899827239112
7950178854410423112	2024-05-18	TVEpisode	Sterling and Brie Bella III	2023-05-08	31	6774048176174390112
6218656124366456112	2024-03-07	TVEpisode	All Hail the King of the Floor	2024-02-27	1	4820226555821797112
6587404674190626112	2024-03-07	TVEpisode	Who is Don Luis Higgins, and Why Is He Doing These Terrible Things to Me?	1986-03-20	6	5828688862497145112
8344398175545145112	2024-03-07	TVEpisode	Just One More	2021-09-01	3	7350561899827239112
7898503504747556112	2024-03-18	TVEpisode	Bender's Big Score	2008-07-26	6	4652117770324939112
8008350211827195112	2024-05-14	TVEpisode	Sterling and Nina Agdal LXII	2024-04-28	38	6774048176174390112
7669577106350440112	2024-05-18	TVEpisode	Sterling and Lolo Wood XXXVI	2024-04-21	40	6774048176174390112
7691789797654100112	2024-05-18	TVEpisode	Sterling and Brie Bella	2023-05-08	31	6774048176174390112
4769916688567083112	2024-05-18	TVEpisode	Sterling and Lolo Wood XXXV	2024-04-21	40	6774048176174390112
6041823753853107112	2024-05-18	TVEpisode	Sterling and Paige Desorbo II	2024-04-28	40	6774048176174390112
6677121287828007112	2024-05-18	TVEpisode	Daymond John II	2024-05-05	40	6774048176174390112
6254352759265342112	2023-12-07	TVEpisode	Sterling and Rocsi Diaz VIII	2023-11-10	37	6774048176174390112
7396431273094911112	2024-03-04	TVEpisode	It's a Horror Show	2024-01-16	1	4820226555821797112
8846695206051121112	2023-12-07	TVEpisode	Sterling and Rocsi Diaz IX	2023-11-10	37	6774048176174390112
7907804188392633112	2023-12-12	TVEpisode	Sterling and Camille Kostek XXVI	2023-12-01	37	6774048176174390112
7503154013117995112	2024-02-13	TVEpisode	The Kona Winds	1985-10-10	6	5828688862497145112
7797900368117674112	2024-05-18	TVEpisode	Daymond John III	2024-05-05	40	6774048176174390112
7519905606421322112	2024-02-13	TVEpisode	The Warrior	2002-04-12	5	7188923726922774112
5769280083409312112	2024-02-18	TVEpisode	Triple D Nation: From Steak to Seafood	2024-02-09	48	4791200799030182112
5506886558153011112	2024-02-16	Movie	The Hunger	1983-04-29	0	
5861960545789080112	2024-02-21	TVEpisode	Blood and Honor	1985-11-21	6	5828688862497145112
5635764469758894112	2024-02-14	TVEpisode	The Hotel Dick	1985-10-17	6	5828688862497145112
4739461518300326112	2024-02-20	TVEpisode	The Treasure of Kalanioupu'u	1985-11-14	6	5828688862497145112
7983933889146645112	2024-02-22	TVEpisode	Rapture	1985-11-28	6	5828688862497145112
4698909643726996112	2024-02-23	TVEpisode	Oh, My Nervous System!	2021-05-26	3	7350561899827239112
9167787139892623112	2024-02-22	TVEpisode	I Never Wanted to Go to France, Anyway	1986-01-02	6	5828688862497145112
6804903499285470112	2024-02-24	Movie	The Shawshank Redemption	1994-09-01	0	
7581422231923329112	2024-02-24	TVEpisode	Suzuki Signs Off	\N	62	4758191019189134112
8555091230323134112	2024-02-25	Movie	The Wedding Planner	2001-01-26	0	
7173651524710090112	2024-02-23	TVEpisode	The Secrets of Friendship	\N	62	4758191019189134112
8643195811108011112	2024-02-25	TVEpisode	Flavor World	2024-02-16	48	4791200799030182112
8639881014705636112	2024-03-04	TVEpisode	I Did Not See That Coming	2024-01-30	1	4820226555821797112
5080214880530211112	2024-03-10	TVEpisode	Episode 12	2023-10-11	7	7948816894611030112
7578065747020106112	2024-03-05	TVEpisode	Craziest Day of My Life!	2021-08-25	3	7350561899827239112
7351716181222724112	2024-03-06	TVEpisode	The BBQ Showdown	2024-02-13	1	4820226555821797112
7318005340678739112	2024-03-07	TVEpisode	Photo Play	1986-04-10	6	5828688862497145112
7005009263596167112	2024-03-11	TVEpisode	Young Man's Fancy	1962-05-11	3	8866251514307483112
5844971911957803112	2024-02-25	TVEpisode	You Can't Write This #"!*$	2021-06-16	3	7350561899827239112
7099618654988688112	2024-03-06	TVEpisode	Unusual Suspects	2019-01-30	10	6229452957505901112
7191372077304544112	2024-03-06	TVEpisode	You Can Run but You Can't Hide	2024-02-06	1	4820226555821797112
8918448581343755112	2024-03-11	TVEpisode	A User's Guide to the Voice	\N	63	4758191019189134112
7346276539405226112	2024-03-06	TVEpisode	The Professor	2024-02-20	1	4820226555821797112
7698578146815829112	2024-03-17	TVEpisode	Shark Tank	2023-05-05	14	6002411599924498112
7177871515712332112	2024-03-01	TVEpisode	Bahrain Grand Prix, Qualifying	2024-03-01	0	5584345400977409112
8544664560887229112	2024-03-02	TVEpisode	This Island Isn't Big Enough	1986-02-13	6	5828688862497145112
6103189973746707112	2024-03-03	TVEpisode	Whammageddon!	2021-08-18	3	7350561899827239112
6973848521855151112	2024-03-02	TVEpisode	All Thieves on Deck	1986-01-30	6	5828688862497145112
6685670052587696112	2024-03-07	TVEpisode	Tonight, I'm Going to Make History	2024-02-27	1	4820226555821797112
7870778203298141112	2024-03-12	TVEpisode	Smokin' Southern Decadence	2024-03-01	47	4791200799030182112
9086402252388465112	2024-03-16	TVEpisode	Shark Tank	2023-04-14	14	6002411599924498112
8781393224204531112	2024-03-14	TVEpisode	L.A.	1986-10-01	7	5828688862497145112
5971720124178658112	2024-05-18	TVEpisode	Sterling and Brie Bella II	2023-05-08	31	6774048176174390112
7103040788143077112	2024-03-03	TVEpisode	Bahrain Grand Prix	2024-03-02	0	5584345400977409112
7258321124846007112	2024-04-09	TVEpisode	The Legend	2020-07-12	2	7350561899827239112
8238632868846818112	2024-04-12	TVEpisode	The Prize Magnet	2020-10-08	2	7350561899827239112
4684589660413437112	2024-04-12	TVEpisode	Nobody Lives Forever	2018-06-25	6	8601213205877266112
6738560836412447112	2024-04-12	TVEpisode	The Adventure of the Ersatz Sobekneferu	2018-07-02	6	8601213205877266112
4975808971919274112	2024-04-12	TVEpisode	You've Come a Long Way, Baby	2018-07-16	6	8601213205877266112
7414816499218106112	2024-04-12	TVEpisode	Fluid: Life Beyond the Binary	\N	63	4758191019189134112
9008805396028013112	2024-03-25	TVEpisode	Kapu	1986-11-26	7	5828688862497145112
5233574785403564112	2024-03-27	CreativeWork	Science's Greatest Mysteries: The Far Side of the Moon	\N	0	
5583795501459564112	2024-04-05	TVEpisode	Little Sapiens	\N	63	4758191019189134112
8781430694768502112	2024-04-13	TVEpisode	The Discord Leaks	2023-12-12	42	5090743086571666112
8386407340740823112	2024-05-18	TVEpisode	Sterling and Nikki Blades IV	2023-05-03	31	6774048176174390112
6518438079594474112	2024-05-18	TVEpisode	Sterling and B. Simone IV	2023-04-24	31	6774048176174390112
6611683251698695112	2024-04-02	TVEpisode	Forty	1987-02-11	7	5828688862497145112
7437056679506147112	2024-05-18	TVEpisode	Sterling and B. Simone III	2023-04-24	31	6774048176174390112
6739686288200221112	2024-05-18	TVEpisode	Sterling and Rachel Wolfson III	2023-05-01	31	6774048176174390112
9124062553840894112	2024-05-18	TVEpisode	Sterling and Rachel Wolfson	2023-05-01	31	6774048176174390112
8048875750846167112	2024-05-18	TVEpisode	Sterling and B. Simone II	2023-04-24	31	6774048176174390112
9148212625860363112	2024-05-18	TVEpisode	Sterling and Rachel Wolfson IV	2023-05-01	31	6774048176174390112
6187988195143135112	2024-05-18	TVEpisode	Sterling and Nikki Blades II	2023-05-03	31	6774048176174390112
5180674477971171112	2023-10-22	TVEpisode	Sterling and Nina Agdal XXXVI	2023-09-29	35	6774048176174390112
4811516916484876112	2023-10-17	TVEpisode	Sterling and Nina Agdal XXXIX	2023-09-29	35	6774048176174390112
7109875769425680112	2023-10-17	TVEpisode	Sterling and Nina Agdal XL	2023-09-29	35	6774048176174390112
5917187732681412112	2024-04-09	TVEpisode	Brief Candle	1997-09-19	1	7188923726922774112
7540314105729083112	2023-12-13	TVEpisode	Sterling and Nina Agdal LI	2023-12-01	36	6774048176174390112
8415597117730433112	2024-04-05	TVEpisode	Sandwich-Craft	2004-10-03	8	6711403570066623112
4735386712548404112	2024-03-15	TVEpisode	Straight and Narrow	1986-10-15	7	5828688862497145112
5296280512912426112	2024-03-30	TVEpisode	The People vs The Ticket Giant	2024-04-15	51	7097268181266001112
5386414838016049112	2023-12-12	TVEpisode	Sterling and Nina Agdal L	2023-12-01	36	6774048176174390112
7912051308089238112	2024-04-09	TVEpisode	Thor's Hammer	1997-09-26	1	7188923726922774112
8299861098753069112	2023-12-13	TVEpisode	Sterling and Rocsi Diaz X	2023-12-01	37	6774048176174390112
7961550499254796112	2024-03-13	TVEpisode	L.A.	1986-10-01	7	5828688862497145112
7813469718544650112	2024-03-18	TVEpisode	Bender's Big Score	2008-07-26	6	4652117770324939112
6272034669179461112	2024-03-21	TVEpisode	Little Girl Who	1986-11-05	7	5828688862497145112
5551335325506446112	2024-03-18	TVEpisode	A.A.P.I.	1986-10-22	7	5828688862497145112
6062776668000141112	2024-03-25	TVEpisode	Novel Connection	1986-11-19	7	5828688862497145112
7282478943562839112	2024-03-18	TVEpisode	You Are Here	2022-10-31	17	7225479914576293112
6077379712908071112	2024-03-20	TVEpisode	Gabrielle Miller & Shane Meier	\N	5	6558549278414560112
5884007848330058112	2024-03-22	TVEpisode	Paper War	1986-11-12	7	5828688862497145112
8225967131770100112	2024-03-22	TVEpisode	108	2019-06-11	1	7350561899827239112
6729814741070955112	2024-03-23	TVEpisode	Australian Grand Prix, Qualifying	2024-03-22	0	5584345400977409112
6102252061863028112	2024-03-30	TVEpisode	Murder by Night	1987-01-14	7	5828688862497145112
5128605571390259112	2024-03-25	TVEpisode	104	2019-06-12	1	7350561899827239112
7354308961833344112	2024-03-31	Movie	The Terminator	1984-10-26	0	
5204033964602308112	2024-04-06	TVEpisode	Beyond the Now	2024-04-03	1	6841471502942939112
9101211097987818112	2024-04-02	TVEpisode	Hairy Tales	\N	63	4758191019189134112
6624744743683652112	2024-03-26	TVEpisode	107	2019-06-19	1	7350561899827239112
6326462520578752112	2024-03-26	TVEpisode	Death of the Flowers	1986-12-10	7	5828688862497145112
5400704102689321112	2024-04-02	TVEpisode	On the Fly	1987-01-21	7	5828688862497145112
8276111721412657112	2024-04-02	TVEpisode	Laura	1987-02-25	7	5828688862497145112
4719745822167195112	2024-04-10	TVEpisode	The Torment of Tantalus	1997-10-03	1	7188923726922774112
6338013391381281112	2024-04-06	TVEpisode	Children of the Gods	1997-07-27	1	7188923726922774112
6759541965284464112	2024-04-06	TVEpisode	1978	\N	1	6909959019347192112
8910693697581568112	2024-03-27	TVEpisode	Autumn Warrior	1986-12-17	7	5828688862497145112
7752725613840986112	2024-04-11	TVEpisode	Cor-Ai	1998-01-23	1	7188923726922774112
6777020361899183112	2024-04-01	TVEpisode	Love Hurts: The Science of Heartbreak	\N	63	4758191019189134112
7336486199325543112	2024-04-03	TVEpisode	The People vs. Orville Wright	1987-04-01	7	5828688862497145112
6409346250387693112	2024-04-07	TVEpisode	From Spicy to Sticky	2024-03-29	48	4791200799030182112
7276792766669462112	2024-04-11	TVEpisode	Enigma	1998-01-30	1	7188923726922774112
8680675016377197112	2024-05-18	TVEpisode	Sterling and Nikki Blades III	2023-05-03	31	6774048176174390112
5078792566065889112	2024-05-18	TVEpisode	Sterling and Nikki Blades	2023-05-03	31	6774048176174390112
7101575715201460112	2024-04-07	TVEpisode	Japanese Grand Prix	2024-04-06	0	5584345400977409112
7069222893539690112	2024-04-13	TVEpisode	Through the Fog	2018-08-06	6	8601213205877266112
7420125762349276112	2024-04-15	TVEpisode	Uncanny Valley of the Dolls	2018-08-13	6	8601213205877266112
5010601612263230112	2024-04-12	TVEpisode	Meet Your Maker	2018-07-23	6	8601213205877266112
5686171681887644112	2024-04-13	TVEpisode	Breathe	2018-07-30	6	8601213205877266112
5098863198019848112	2024-04-17	TVEpisode	The Visions of Norman P. Horowitz	2018-08-27	6	8601213205877266112
5590098288098017112	2024-04-14	TVEpisode	How to Get a Head	2018-08-12	6	8601213205877266112
8572759455643499112	2024-04-17	TVEpisode	The Geek Interpreter	2018-09-03	6	8601213205877266112
7068043947034969112	2024-04-18	TVEpisode	Fit to Be Tied	2018-09-10	6	8601213205877266112
4773886894485285112	2024-04-16	TVEpisode	The Worms Crawl in, the Worms Crawl Out.	2018-08-20	6	8601213205877266112
4649416862726467112	2024-04-18	TVEpisode	The Further Adventures	2019-05-23	7	8601213205877266112
9157227932349217112	2024-04-19	TVEpisode	Gutshot	2019-05-30	7	8601213205877266112
5146962476157216112	2024-04-18	TVEpisode	Whatever Remains, However Improbable	2018-09-17	6	8601213205877266112
7603523903368686112	2024-04-19	TVEpisode	The Price of Admission	2019-06-06	7	8601213205877266112
8980799875700340112	2024-04-20	TVEpisode	Red Light, Green Light	2019-06-13	7	8601213205877266112
8415395284757357112	2024-04-22	TVEpisode	Into the Woods	2019-06-20	7	8601213205877266112
7483945850868857112	2024-04-22	TVEpisode	Command: Delete	2019-06-27	7	8601213205877266112
7094385468286868112	2024-05-01	TVEpisode	Pappygate Conspiracy	2024-01-14	13	5217253762355250112
8698932653448315112	2024-05-02	TVEpisode	Infinity and Jelly Doughnuts	1987-10-07	8	5828688862497145112
7614280191349406112	2024-05-03	TVEpisode	Toto Washlets; Fire Scout; Demolition Drills	2011-10-20	8	7112240447450524112
5765838250699231112	2024-05-03	TVEpisode	Innocence ... A Broad	1987-10-28	8	5828688862497145112
7668408492580330112	2024-05-04	TVEpisode	The Leviathan	2012-12-13	1	8601213205877266112
7429534624817508112	2024-05-06	TVEpisode	Miami Grand Prix	2024-05-05	0	5584345400977409112
5474711553228633112	2024-06-15	TVEpisode	Sterling and Carly Aquilino LXXII	2024-05-12	38	6774048176174390112
8932419062430370112	2024-06-15	TVEpisode	Sterling and Carly Aquilino LXX	2024-05-12	38	6774048176174390112
5719880278909374112	2024-06-15	TVEpisode	Sterling and Carly Aquilino LXXI	2024-05-12	38	6774048176174390112
8420963765112569112	2024-05-11	TVEpisode	A Giant Gun, Filled With Drugs	2013-02-07	1	8601213205877266112
6253470897107821112	2024-05-01	TVEpisode	One Way to Get Off	2012-11-15	1	8601213205877266112
8146003437616086112	2024-05-18	TVEpisode	Sterling and Madison Beer VII	2023-04-26	31	6774048176174390112
9160369917176616112	2023-12-13	TVEpisode	Sterling and Rocsi Diaz XI	2023-12-01	37	6774048176174390112
7594539814964658112	2024-04-14	TVEpisode	Starship Down	1995-11-06	4	8070563485151928112
4704524372196870112	2024-04-16	Movie	The Bourne Legacy	2012-08-09	0	
6248715825886765112	2024-04-21	TVEpisode	Chinese Grand Prix	2024-04-20	0	5584345400977409112
6874087136258622112	2024-04-26	TVEpisode	Unfriended	2019-08-01	7	8601213205877266112
5387305531896755112	2024-04-23	TVEpisode	From Russia With Drugs	2019-07-04	7	8601213205877266112
4797351794774980112	2024-04-24	TVEpisode	1969	1999-03-05	2	7188923726922774112
7025500312201516112	2024-04-28	Movie	Superman Returns	2006-06-28	0	
7057712457765329112	2024-05-05	Movie	Carry on Sergeant	\N	0	
6971036096723170112	2024-04-24	TVEpisode	Miss Understood	2019-07-11	7	8601213205877266112
6464161199775393112	2024-05-01	TVEpisode	Flight Risk	2012-11-08	1	8601213205877266112
9138358526149928112	2024-04-25	TVEpisode	Out of Mind	1999-03-12	2	7188923726922774112
8185609339141869112	2024-05-02	TVEpisode	The Long Fuse	2012-11-29	1	8601213205877266112
8099592761335983112	2024-05-03	TVEpisode	Pleasure Principle	1987-10-14	8	5828688862497145112
5999196459506193112	2024-05-04	TVEpisode	Dirty Laundry	2013-01-03	1	8601213205877266112
8470506380032840112	2024-05-11	TVEpisode	The Red Team	2013-01-31	1	8601213205877266112
6605887689558311112	2024-04-29	TVEpisode	While You Were Sleeping	2012-10-03	1	8601213205877266112
6020796308899099112	2024-05-11	TVEpisode	M.	2013-01-10	1	8601213205877266112
5486890138707223112	2024-05-12	TVEpisode	Details	2013-02-14	1	8601213205877266112
7979825241714296112	2024-05-18	TVEpisode	Sterling and Rachel Wolfson II	2023-05-01	31	6774048176174390112
6635432816012358112	2024-06-15	TVEpisode	Sterling and Carly Aquilino LXXIII	2024-05-12	38	6774048176174390112
4632288018036706112	2023-10-22	TVEpisode	Sterling and Nina Agdal XLII	2023-10-02	36	6774048176174390112
8230727021475704112	2024-01-10	TVEpisode	Sterling and Carly Aquilino LIV	2023-12-08	36	6774048176174390112
5422115520671725112	2024-04-13	TVEpisode	Let's Get It!	2020-10-29	2	7350561899827239112
6865922636382487112	2024-04-24	TVEpisode	Show and Tell	1999-02-26	2	7188923726922774112
6127342011445811112	2024-04-26	TVEpisode	The Latest Model	2019-07-25	7	8601213205877266112
7137510414538181112	2024-04-26	TVEpisode	Their Last Bow	2019-08-15	7	8601213205877266112
8790233492508106112	2024-04-29	TVEpisode	Child Predator	2012-10-18	1	8601213205877266112
5831200906200501112	2024-05-03	TVEpisode	Dark City: The Cleaner	\N	1	5238507611660114112
8307540164144520112	2024-06-16	TVEpisode	Sterling and Rocsi Diaz XXII	2024-05-26	39	6774048176174390112
4782222008325658112	2024-05-01	TVEpisode	Lesser Evils	2012-11-01	1	8601213205877266112
8860334031751150112	2024-04-26	TVEpisode	Reichenbach Falls	2019-08-08	7	8601213205877266112
6238099347951844112	2024-05-02	TVEpisode	Limbo	1987-04-15	7	5828688862497145112
8258672148932633112	2024-05-12	TVEpisode	Possibility Two	2013-02-21	1	8601213205877266112
6724984243297171112	2024-05-18	TVEpisode	Roads to Nowhere	\N	1	6932774445162525112
8177440161666488112	2024-05-20	TVEpisode	Mr. Garrity and the Graves	1964-05-08	5	8866251514307483112
7419114313621129112	2024-05-18	TVEpisode	Judgment	\N	5	8198160699065196112
7267069080938153112	2024-05-23	TVEpisode	Resolutions	1988-05-08	8	5828688862497145112
5805256098596755112	2024-05-18	TVEpisode	Motorize the Masses	2021-05-24	1	5689589901453309112
6304068518484836112	2024-05-12	TVEpisode	Tomorrows	2024-05-08	1	6841471502942939112
7117222057326983112	2024-05-12	TVEpisode	Snow Angels	2013-04-04	1	8601213205877266112
6622927631576369112	2024-05-15	TVEpisode	Heroine	2013-05-16	1	8601213205877266112
5015145954813650112	2024-05-15	TVEpisode	Tigers Fan	1987-11-04	8	5828688862497145112
8891865837753943112	2024-05-16	TVEpisode	A Girl Named Sue	1988-01-13	8	5828688862497145112
7820739658636971112	2024-05-15	CreativeWork	The Tonight Show Starring Jimmy Fallon: 10th Anniversary Special	2024-05-14	0	
8155199599626808112	2024-05-20	TVEpisode	The Brain Center at Whipple's	1964-05-15	5	8866251514307483112
7926392882707275112	2024-05-22	TVEpisode	Resolutions	1988-05-01	8	5828688862497145112
8613466128936231112	2024-05-18	TVEpisode	Alex Doesn't Live Here Anymore	1989-05-14	7	6207748530948939112
6663488878377493112	2024-05-18	TVEpisode	The Great Hawaiian Adventure Company	1988-01-27	8	5828688862497145112
6667774178802396112	2024-05-18	TVEpisode	24 Hours of Daytona; Rum	2011-12-01	8	7112240447450524112
9167865903915315112	2023-10-24	TVEpisode	Sterling and Carly Aquilino XLI	2023-10-06	36	6774048176174390112
8886132318842105112	2024-05-20	TVEpisode	Legend of the Lost Art	1988-02-10	8	5828688862497145112
6964694565941766112	2024-01-11	TVEpisode	Sterling and Karrueche Tran XLV	2023-12-08	37	6774048176174390112
5932366963926030112	2024-05-18	TVEpisode	Quest for Power	\N	1	6932774445162525112
7356568672902878112	2024-05-23	TVEpisode	Don't Eat the Snow in Hawaii	1980-12-11	1	5828688862497145112
6850127986599384112	2024-05-27	TVEpisode	Monaco Grand Prix - Formula 1 Monaco Grand Prix	2024-05-26	0	5584345400977409112
6755643307666087112	2024-05-27	Movie	Robin Hood	2010-05-13	0	
5532854147855947112	2024-05-27	TVEpisode	On the Line	2013-11-21	2	8601213205877266112
8765680494972976112	2024-05-27	TVEpisode	Tremors	2013-12-05	2	8601213205877266112
5376096794194511112	2024-06-16	TVEpisode	Sterling and Rocsi Diaz XXIV	2024-05-26	39	6774048176174390112
7016380549414581112	2024-06-16	TVEpisode	Sterling and Rocsi Diaz XXIII	2024-05-26	39	6774048176174390112
6621968781537714112	2024-06-17	TVEpisode	Sterling and Lolo Wood XXXVIII	2024-05-05	40	6774048176174390112
7911767601234205112	2024-06-16	TVEpisode	Sterling and Rocsi Diaz XX	2024-05-26	39	6774048176174390112
5833593054492668112	2024-05-18	TVEpisode	Mind Blown	2018-05-02	9	6229452957505901112
8476828480391695112	2024-06-17	TVEpisode	Sterling and Lolo Wood XXXIX	2024-05-19	40	6774048176174390112
5389661382003947112	2024-05-18	TVEpisode	NASCAR All-Star Open, Qualifying	2023-05-20	0	5432391537853816112
4942844256077382112	2024-05-18	TVEpisode	Ghost Ships	\N	1	6932774445162525112
7323407574626897112	2024-05-15	Movie	True Romance	1993-09-10	0	
7652356598717437112	2024-05-22	TVEpisode	Torque	\N	6	8344645316308623112
8857685744881024112	2024-05-22	TVEpisode	We Are Everyone	2013-10-10	2	8601213205877266112
6064997517522731112	2024-05-22	TVEpisode	Solve for X	2013-10-03	2	8601213205877266112
8993384895410631112	2024-05-23	TVEpisode	Ancient Earth: Frozen	2023-10-11	50	8954551503237514112
8658600504690285112	2024-01-12	TVEpisode	Sterling and Karrueche Tran XLVI	2023-12-08	37	6774048176174390112
7747942364144175112	2024-05-12	TVEpisode	Human	2024-04-24	1	6841471502942939112
6075576420667395112	2024-05-23	TVEpisode	Ancient History	2013-10-24	2	8601213205877266112
6558030522104186112	2024-05-12	TVEpisode	Once Upon a Time	2024-04-17	1	6841471502942939112
6867190051400329112	2024-05-12	TVEpisode	Together	2024-05-01	1	6841471502942939112
7541239897878870112	2024-05-12	TVEpisode	A Landmark Story	2013-05-02	1	8601213205877266112
7698453332572781112	2024-05-12	TVEpisode	Déjà Vu All Over Again	2013-03-14	1	8601213205877266112
8823578273374344112	2024-05-11	TVEpisode	The Deductionist	2013-02-03	1	8601213205877266112
5649760609895628112	2024-05-15	Movie	Heist	2001-11-09	0	
8309299721124544112	2024-05-15	Movie	Marshall	2017-10-13	0	
5886948020569962112	2024-05-16	TVEpisode	Forever in Time	1987-11-11	8	5828688862497145112
5656458377663953112	2024-05-18	TVEpisode	Lost Bridges	\N	1	6932774445162525112
4707266583711854112	2024-05-19	TVEpisode	Missoula	2024-02-18	1	5226145098289575112
5628987763651230112	2024-05-19	TVEpisode	Ancient Earth: Birth of the Sky	2023-10-04	50	8954551503237514112
6267752415418163112	2024-05-23	TVEpisode	An Unnatural Arrangement	2013-10-31	2	8601213205877266112
8717179420010780112	2024-05-19	TVEpisode	Springland	2024-02-25	1	5226145098289575112
7667226936588500112	2024-05-23	TVEpisode	The Marchioness	2013-11-07	2	8601213205877266112
7586887464115223112	2024-05-16	TVEpisode	The Love That Lies	1987-11-18	8	5828688862497145112
8098022316113349112	2024-05-17	TVEpisode	Unfinished Business	1988-01-20	8	5828688862497145112
7661300136202251112	2024-05-18	TVEpisode	Alex Doesn't Live Here Anymore	1989-05-14	7	6207748530948939112
8397558758057050112	2024-05-22	TVEpisode	Poison Pen	2013-10-17	2	8601213205877266112
8572052528589038112	2024-05-23	TVEpisode	Don't Eat the Snow in Hawaii	1980-12-11	1	5828688862497145112
4916364567905375112	2024-05-20	TVEpisode	Transitions	1988-02-17	8	5828688862497145112
8088879585902111112	2024-06-05	TVEpisode	Inside China's Tech Boom	2023-11-08	50	8954551503237514112
8876607489058085112	2024-06-11	TVEpisode	Building the Eiffel Tower	2024-02-14	51	8954551503237514112
5651568058891776112	2024-06-10	TVEpisode	Easter Islands Origins	2024-02-07	51	8954551503237514112
5372605882856973112	2024-06-17	TVEpisode	Hunt for the Oldest DNA	2024-02-21	51	8954551503237514112
7695784400777936112	2024-07-26	TVEpisode	The Crack	2023-01-19	1	6124985572721027112
4773249584020139112	2024-07-19	TVEpisode	Halls Balls!!!	2024-07-18	6	7350561899827239112
8919425050893806112	2024-07-29	TVEpisode	Metamorphosis	2023-08-17	4	6840225315386192112
7599570109097553112	2024-07-29	TVEpisode	Getting Ice Dick, Don't Wait Up	2023-08-13	4	6840225315386192112
7161174207135140112	2024-07-29	TVEpisode	The Most Culturally Impactful Film Franchise of All Time	2023-08-24	4	6840225315386192112
5465282000469503112	2024-07-29	TVEpisode	Potato Based Cloning Incident	2023-09-07	4	6840225315386192112
5777879209845185112	2024-07-29	TVEpisode	Il Buffone	2023-09-03	4	6840225315386192112
5155608092408506112	2023-08-08	TVEpisode	Sterling and Camille Kostek XI	2023-07-05	33	6774048176174390112
6369517489445956112	2023-08-08	TVEpisode	Sterling and Camille Kostek XII	2023-07-05	33	6774048176174390112
8352873743729825112	2023-08-08	TVEpisode	Sterling and Karrueche Tran XIX	2023-07-07	33	6774048176174390112
8285580029653847112	2023-08-03	TVEpisode	Sterling and Camille Kostek X	2023-07-05	33	6774048176174390112
5950609534386752112	2023-08-08	TVEpisode	Sterling and Karrueche Tran XIII	2023-07-07	33	6774048176174390112
6916200659263504112	2023-08-08	TVEpisode	Sterling and Karrueche Tran XX	2023-07-07	33	6774048176174390112
7543534614546263112	2023-08-08	TVEpisode	Sterling and Karrueche Tran XVIII	2023-07-07	33	6774048176174390112
5928559199812802112	2023-08-08	TVEpisode	Sterling and Lolo Wood XIV	2023-07-10	33	6774048176174390112
7236857248072495112	2023-08-08	TVEpisode	Sterling and Lolo Wood X	2023-07-10	33	6774048176174390112
7843043364137133112	2024-05-24	TVEpisode	Blood Is Thicker	2013-11-14	2	8601213205877266112
7344203116293599112	2024-06-10	TVEpisode	Shine Pods	2024-04-30	13	5217253762355250112
5811270737741476112	2024-05-28	Movie	Harry Potter and the Prisoner of Azkaban	2004-05-31	0	
8690038480727216112	2024-01-17	TVEpisode	Sterling and Rocsi Diaz XIII	2023-12-15	37	6774048176174390112
5305590753620603112	2024-06-23	TVEpisode	Spanish Grand Prix	2024-06-23	0	5584345400977409112
5795471519707564112	2024-06-19	TVEpisode	The Birth of Mickey	2024-04-28	1	7764599026066481112
6232542935971617112	2024-05-29	TVEpisode	Ancient Earth: Life Rising	2023-10-18	50	8954551503237514112
4915675716090714112	2024-06-17	TVEpisode	Teddy Swims	2024-05-19	40	6774048176174390112
8386416054825905112	2024-07-02	TVEpisode	Camp Cook-Offs and Chuckwagons	2024-06-21	3	8290899894231225112
5703588434788967112	2024-06-26	TVEpisode	Sterling and Lolo Wood XLIII	2024-06-02	40	6774048176174390112
8856845970819329112	2024-06-27	TVEpisode	Madison Pettis	2024-06-16	40	6774048176174390112
5592218434414338112	2024-07-07	TVEpisode	British Grand Prix - Formula 1 British Grand Prix	2024-07-07	0	5584345400977409112
7700865346448731112	2024-07-10	TVEpisode	It's Nacho Night!	2024-01-25	5	7350561899827239112
8729678959677424112	2024-07-10	TVEpisode	A Spiritual Experience	2023-10-17	5	7350561899827239112
7537399380012278112	2024-07-30	TVEpisode	Killer's Block	2023-09-14	4	6840225315386192112
8837854698644553112	2024-07-14	TVEpisode	Phoenix Food Fans	2024-04-05	48	4791200799030182112
7727121750559128112	2024-07-29	TVEpisode	Triple D Nation: Rockin' Recipes	2024-07-12	48	4791200799030182112
8330413651726985112	2024-06-10	TVEpisode	The Curse of Oaked Bourbon	2024-05-21	13	5217253762355250112
6236430486756019112	2024-05-29	Movie	You Are What You Act	\N	0	
9061734502697693112	2024-07-04	TVEpisode	Good Luck Gummy Bears	2023-11-21	5	7350561899827239112
7576569166931443112	2024-06-26	TVEpisode	Sterling and Lolo Wood XL	2024-05-19	40	6774048176174390112
9139263470223323112	2024-07-12	TVEpisode	WHAT!?!?	2023-10-10	5	7350561899827239112
8056160111781780112	2024-07-10	TVEpisode	Go Big or Go Gnome	2023-10-24	5	7350561899827239112
8951181944501468112	2023-10-24	TVEpisode	Sterling and Carly Aquilino XLIII	2023-10-06	36	6774048176174390112
4687616202305711112	2023-10-25	TVEpisode	Sterling and Nina Agdal XLVII	2023-10-13	36	6774048176174390112
4810358283012549112	2024-01-12	TVEpisode	Sterling and Carly Aquilino LXIV	2023-12-08	37	6774048176174390112
8213298090355738112	2024-01-26	TVEpisode	Sterling and Nina Agdal LVI	2023-12-22	36	6774048176174390112
5005863606617099112	2024-05-24	TVEpisode	Skin Deep	1981-01-15	1	5828688862497145112
8309197365705204112	2024-05-29	TVEpisode	Ancient Earth: Humans	2023-11-01	50	8954551503237514112
8420293762900598112	2024-06-04	CreativeWork	Pink - Live From Wembley Arena	2007-01-01	0	
4738426858236615112	2024-05-31	TVEpisode	Shark Tank	2024-01-19	15	6002411599924498112
6942623728878843112	2024-06-04	Movie	Watchmen	2009-03-05	0	
6550122702456073112	2024-06-09	TVEpisode	Canadian Grand Prix	\N	2024	8512640428818561112
7285066564486730112	2024-06-16	TVEpisode	Kickin' off the Food and Fun	2024-06-07	3	8290899894231225112
8529672580755449112	2024-06-26	TVEpisode	Nina Drama II	2024-06-09	39	6774048176174390112
6908771045515702112	2024-06-23	TVEpisode	Father's Day Feasts and Camp Side Competitions	2024-06-14	3	8290899894231225112
6916909873429471112	2024-06-25	TVEpisode	Nina Drama	2024-06-09	39	6774048176174390112
5586179294794657112	2024-07-07	TVEpisode	Food Trucks, Friends and Carnival Fun	2024-06-28	3	8290899894231225112
5817564908132739112	2024-05-18	TVEpisode	Mission: Space	\N	1	6932774445162525112
7451447382379481112	2024-07-12	TVEpisode	Happy Birthday, Press Your Luck!	2023-10-31	5	7350561899827239112
5504696213821309112	2023-08-08	TVEpisode	Sterling and Lolo Wood XV	2023-07-10	33	6774048176174390112
9026267815664264112	2023-08-09	TVEpisode	Sterling and Nina Agdal XV	2023-07-12	33	6774048176174390112
7580370320746500112	2023-08-09	TVEpisode	Sterling and Nina Agdal XVI	2023-07-12	33	6774048176174390112
7884102165984561112	2023-08-09	TVEpisode	Sterling and Lolo Wood XVIII	2023-07-10	33	6774048176174390112
4924995127023354112	2023-08-09	TVEpisode	Sterling and Nina Agdal XVII	2023-07-12	33	6774048176174390112
8737077447207137112	2024-01-17	TVEpisode	Sterling and Rocsi Diaz XII	2023-12-15	37	6774048176174390112
6282689783545161112	2024-01-30	TVEpisode	Sterling and Carly Aquilino LVII	2023-12-22	36	6774048176174390112
9034232549042367112	2024-02-01	TVEpisode	Sterling and Nina Agdal LVII	2023-12-22	38	6774048176174390112
5892394058315181112	2023-08-30	TVEpisode	Sterling and Nina Agdal XXI	2023-07-30	34	6774048176174390112
5952478457686203112	2023-08-13	TVEpisode	Sterling and Carly Aquilino XVII	2023-07-16	34	6774048176174390112
7502674980054347112	2023-08-31	TVEpisode	Sterling and Nina Agdal XXII	2023-08-04	34	6774048176174390112
7498926111466205112	2023-08-17	TVEpisode	Sterling and Lolo Wood XIX	2023-07-21	34	6774048176174390112
7940434479414584112	2023-08-29	TVEpisode	Sterling and Carly Aquilino XXVI	2023-07-28	34	6774048176174390112
7016042490046380112	2023-08-15	TVEpisode	Sterling and Carly Aquilino XVIII	2023-07-16	34	6774048176174390112
6392091052645652112	2023-09-25	TVEpisode	Sterling and Karrueche Tran XXVI	2023-08-28	35	6774048176174390112
8521997415065327112	2023-09-25	TVEpisode	Sterling and Karrueche Tran XXIX	2023-08-28	35	6774048176174390112
8219428546024013112	2023-09-26	TVEpisode	Sterling and Carly Aquilino XXV	2023-09-01	35	6774048176174390112
6620246922534651112	2023-08-13	TVEpisode	Sterling and Carly Aquilino XVI	2023-07-14	33	6774048176174390112
7154273069620846112	2023-08-17	TVEpisode	Sterling and Lolo Wood XX	2023-07-21	34	6774048176174390112
6341705948877390112	2023-09-05	TVEpisode	Sterling and Camille Kostek XVIII	2023-08-06	34	6774048176174390112
5305063071572650112	2023-08-30	TVEpisode	Sterling and Lolo Wood XXIII	2023-07-31	34	6774048176174390112
5422232524007251112	2023-09-13	TVEpisode	Sterling and Nina Agdal XLI	2023-08-18	34	6774048176174390112
4683354277895231112	2023-08-18	TVEpisode	Sterling and Lolo Wood XXI	2023-07-21	34	6774048176174390112
8549056817957821112	2023-08-22	TVEpisode	Sterling and Karrueche Tran XXI	2023-07-24	34	6774048176174390112
7801826431566720112	2023-09-14	TVEpisode	Sterling and Karrueche Tran XXX	2023-08-20	34	6774048176174390112
7230883928722743112	2023-09-11	TVEpisode	Sterling and Nina Agdal XXXI	2023-08-13	34	6774048176174390112
5811296174373918112	2023-09-19	TVEpisode	Sterling and Nina Agdal XXVI	2023-08-21	34	6774048176174390112
7992974295966627112	2023-08-15	TVEpisode	Sterling and Camille Kostek XIII	2023-07-17	34	6774048176174390112
5386356225031349112	2023-08-18	TVEpisode	Sterling and Lolo Wood XXII	2023-07-23	34	6774048176174390112
7732177270802908112	2023-09-05	TVEpisode	Sterling and Carly Aquilino XXII	2023-08-07	34	6774048176174390112
8284438922385304112	2023-09-19	TVEpisode	Sterling and Karrueche Tran XXVII	2023-08-25	35	6774048176174390112
5473024731829191112	2023-09-26	TVEpisode	Sterling and Arielle Vandenberg II	2023-09-03	35	6774048176174390112
5350205463926347112	2023-09-25	TVEpisode	Sterling and Carly Aquilino XXIV	2023-09-01	35	6774048176174390112
6491644863130760112	2023-10-25	TVEpisode	Sterling and Rocsi Diaz III	2023-10-16	36	6774048176174390112
9210473298014783112	2023-08-22	TVEpisode	Sterling and Camille Kostek XVI	2023-07-23	34	6774048176174390112
6822596327863295112	2023-08-29	TVEpisode	Sterling and Carly Aquilino XIX	2023-07-28	34	6774048176174390112
8548727007408035112	2023-08-31	TVEpisode	Sterling and Nina Agdal XIX	2023-08-04	34	6774048176174390112
8073247432489680112	2023-09-07	TVEpisode	Sterling and Carly Aquilino XXIII	2023-08-07	34	6774048176174390112
6708148402687182112	2023-09-13	TVEpisode	Sterling and Lolo Wood XXVIII	2023-08-14	34	6774048176174390112
7266398624249641112	2023-09-18	TVEpisode	Sterling and Nina Agdal XXIV	2023-08-21	34	6774048176174390112
7077798094303095112	2023-09-11	TVEpisode	Sterling and Nina Agdal XXXII	2023-08-13	34	6774048176174390112
7463371290677394112	2023-09-11	TVEpisode	Sterling and Lolo Wood XXVII	2023-08-14	34	6774048176174390112
6141013778182795112	2023-09-23	TVEpisode	Sterling and Carly Aquilino XXIX	2023-08-27	35	6774048176174390112
6172130161654098112	2023-09-14	TVEpisode	Sterling and Nina Agdal XXIX	2023-08-18	34	6774048176174390112
4613542955769506112	2023-08-15	TVEpisode	Sterling and Camille Kostek XIV	2023-07-17	34	6774048176174390112
5500956312950502112	2023-09-13	TVEpisode	Sterling and Nina Agdal XXVII	2023-08-18	34	6774048176174390112
5058058243291516112	2023-09-19	TVEpisode	Sterling and Karrueche Tran XXIV	2023-08-25	35	6774048176174390112
5248768646158879112	2023-09-24	TVEpisode	Sterling and Karrueche Tran XXV	2023-08-28	35	6774048176174390112
7056608314784464112	2023-09-23	TVEpisode	Sterling and Carly Aquilino XXVIII	2023-08-27	35	6774048176174390112
5050503577294683112	2023-08-23	TVEpisode	Sterling and Karrueche Tran XXIII	2023-07-24	34	6774048176174390112
5766668852855940112	2023-08-30	TVEpisode	Sterling and Lolo Wood XXIV	2023-07-31	34	6774048176174390112
8423535809874186112	2023-09-05	TVEpisode	Sterling and Nina Agdal XXIII	2023-08-04	34	6774048176174390112
9071560952784386112	2023-08-15	TVEpisode	Sterling and Camille Kostek XV	2023-07-17	34	6774048176174390112
6248959842151007112	2023-08-31	TVEpisode	Sterling and Lolo Wood XXV	2023-07-31	34	6774048176174390112
7876761933214229112	2023-09-11	TVEpisode	Sterling and Lolo Wood XXVI	2023-08-14	34	6774048176174390112
8584569423922991112	2023-09-18	TVEpisode	Sterling and Nina Agdal XXV	2023-08-21	34	6774048176174390112
5295298421207199112	2023-09-19	TVEpisode	Sterling and Karrueche Tran XXVIII	2023-08-25	35	6774048176174390112
5217369299854734112	2024-08-07	TVEpisode	An Occurrence at Owl Creek Bridge	1964-02-28	5	8866251514307483112
7938709646040977112	2023-09-30	TVEpisode	Sterling and Karrueche Tran XXXIII	2023-09-08	35	6774048176174390112
7334581157447583112	2023-10-11	TVEpisode	Sterling and Carly Aquilino XXXVI	2023-09-22	35	6774048176174390112
7040480175438978112	2023-10-15	TVEpisode	Sterling and Carly Aquilino XXXVII	2023-09-25	35	6774048176174390112
6820315046007820112	2023-10-18	TVEpisode	Between Two Fires	2001-08-24	5	7188923726922774112
5939066639469642112	2023-10-24	TVEpisode	Sterling and Carly Aquilino XLVI	2023-10-09	36	6774048176174390112
5142635776605238112	2023-10-24	TVEpisode	Sterling and Carly Aquilino XLV	2023-10-09	36	6774048176174390112
6767590443777251112	2024-01-30	TVEpisode	Sterling and Karrueche Tran XLVII	2023-12-22	37	6774048176174390112
6411304740005732112	2024-01-30	TVEpisode	Sterling and Carly Aquilino LVIII	2023-12-22	36	6774048176174390112
6244423604741495112	2023-10-17	TVEpisode	Sterling and Carly Aquilino XXXVIII	2023-09-25	36	6774048176174390112
6732161009329897112	2023-10-18	TVEpisode	2001	2001-08-31	5	7188923726922774112
7148694346144096112	2024-02-08	TVEpisode	Sterling and Carly Aquilino LX	2023-12-29	36	6774048176174390112
5304044820703860112	2024-02-09	TVEpisode	Sterling and Karrueche Tran XLIX	2023-12-29	37	6774048176174390112
8766837607092789112	2024-08-06	TVEpisode	Sterling and Lolo Wood II	2023-04-12	31	6774048176174390112
8559364788885582112	2024-06-27	TVEpisode	Dee Snider	2024-06-02	41	6774048176174390112
8872665589874439112	2024-06-27	TVEpisode	Madison Pettis II	2024-06-16	40	6774048176174390112
8053389041408292112	2023-10-01	TVEpisode	Pretense	1999-11-12	3	7188923726922774112
7868897392271246112	2023-10-05	TVEpisode	Sterling and Karrueche Tran XXXV	2023-09-15	35	6774048176174390112
9013843649462460112	2024-08-06	TVEpisode	Sterling and Camille Kostek	2023-04-17	31	6774048176174390112
7174570093627273112	2024-07-04	TVEpisode	Sterling and Carly Aquilino LXXV	2024-06-19	38	6774048176174390112
4679718106638546112	2024-08-06	TVEpisode	Sterling and Camille Kostek II	2023-04-17	31	6774048176174390112
7855296553923699112	2023-10-10	TVEpisode	Sterling and Karrueche Tran XXXVI	2023-09-18	35	6774048176174390112
6819424884477011112	2024-06-26	TVEpisode	Sterling and Lolo Wood XLIV	2024-06-02	40	6774048176174390112
5197950333656778112	2024-06-26	TVEpisode	Lexi Rivera	2024-06-09	40	6774048176174390112
9150319668719315112	2024-06-28	TVEpisode	Lexi Rivera II	2024-06-09	41	6774048176174390112
6305438356561468112	2024-08-06	TVEpisode	Sterling and Lolo Wood V	2023-04-12	31	6774048176174390112
8060429405671684112	2024-08-07	TVEpisode	Sterling and B. Simone	2023-04-24	31	6774048176174390112
8190105153117734112	2023-10-10	TVEpisode	Sterling and Carly Aquilino XXXIII	2023-09-22	35	6774048176174390112
4851938189432841112	2023-10-11	TVEpisode	Sloppy, Saucy and Stuffed	2023-07-07	46	4791200799030182112
6436202094179336112	2023-10-30	TVEpisode	Caves	2023-10-19	4	9037311307409885112
5817883175547311112	2023-08-13	TVEpisode	Sterling and Carly Aquilino XV	2023-07-14	33	6774048176174390112
5424800740569636112	2023-10-11	TVEpisode	2010	2001-01-12	4	7188923726922774112
5057079380111127112	2023-09-19	TVEpisode	Tok'ra	1998-10-09	2	7188923726922774112
7783345459259505112	2024-01-26	TVEpisode	Sterling and Carly Aquilino LVI	2023-12-15	36	6774048176174390112
5092174447233528112	2023-09-20	TVEpisode	J. "Digger" Doyle	1981-04-09	1	5828688862497145112
7082923406112437112	2024-02-08	TVEpisode	Sterling and Carly Aquilino LIX	2023-12-29	36	6774048176174390112
7812252643965859112	2024-07-04	TVEpisode	Sterling and Carly Aquilino LXXIV	2024-06-19	38	6774048176174390112
6187640368734806112	2024-08-06	TVEpisode	Secrets in Your Data	2024-05-15	51	8954551503237514112
7543941142196653112	2023-10-15	TVEpisode	Sterling and Nina Agdal XXXVIII	2023-10-23	35	6774048176174390112
6886183200064124112	2023-10-23	TVEpisode	Sterling and Nina Agdal XLIII	2023-10-02	36	6774048176174390112
7178250463783335112	2023-10-03	TVEpisode	Sterling and Carly Aquilino XXXII	2023-09-11	35	6774048176174390112
8905230514733701112	2023-10-23	TVEpisode	Sterling and Nina Agdal XLIV	2023-10-02	36	6774048176174390112
7556327434830006112	2023-08-22	TVEpisode	The Powers That Be	2005-08-12	9	7188923726922774112
7768741316551112112	2023-08-22	TVEpisode	Beachhead	2005-08-19	9	7188923726922774112
7698760651586248112	2023-08-22	TVEpisode	Ex Deus Machina	2005-08-26	9	7188923726922774112
8715153762994707112	2023-08-28	TVEpisode	The Floating Fixer Upper	2017-02-07	4	4990190839873229112
5049336716305017112	2023-09-05	TVEpisode	Sterling and Camille Kostek XVII	2023-08-06	34	6774048176174390112
7977124287821053112	2023-09-05	TVEpisode	Sterling and Carly Aquilino XXI	2023-08-07	34	6774048176174390112
8546304172932659112	2023-09-21	TVEpisode	Battle of the Bridges	2021-11-21	1	5950084733441793112
9105068369302727112	2023-09-21	TVEpisode	Where There's Smoke	2023-06-10	4	6509213195746878112
8880080605460966112	2023-10-03	TVEpisode	Sterling and Carly Aquilino XXXI	2023-09-11	35	6774048176174390112
7634938253014102112	2024-08-06	TVEpisode	A.I. Revolution	2024-03-27	51	8954551503237514112
8324076148740989112	2023-08-10	TVEpisode	Evolution	2004-01-09	7	7188923726922774112
5832017841073914112	2023-08-10	TVEpisode	Death Knell	2004-02-06	7	7188923726922774112
8358527140309417112	2024-08-06	TVEpisode	Great American Eclipse	2024-04-03	51	8954551503237514112
5355375204341749112	2024-08-07	TVEpisode	Sterling and Karrueche Tran III	2023-04-17	31	6774048176174390112
4934687012878773112	2024-08-07	TVEpisode	Sterling and Lolo Wood XLV	2024-07-07	40	6774048176174390112
7934953210027764112	2023-08-10	TVEpisode	Birthright	2003-08-15	7	7188923726922774112
7776899475939219112	2023-10-13	TVEpisode	Double Jeopardy	2001-02-09	4	7188923726922774112
7890982873129250112	2023-10-24	TVEpisode	Sterling and Carly Aquilino XLII	2023-10-06	36	6774048176174390112
6713930754757463112	2023-10-24	TVEpisode	Sterling and Carly Aquilino XLVII	2023-10-09	36	6774048176174390112
4652315335191597112	2023-10-29	TVEpisode	Saint Croix Swipe	2015-08-12	3	5573821131460912112
6117525996493012112	2023-10-26	TVEpisode	The Reality Revolution	2023-08-21	1	6196794598537403112
8504379768943646112	2023-09-22	TVEpisode	From Chicken to Caribbean	2023-09-01	46	4791200799030182112
5280209612779210112	2023-09-11	TVEpisode	Hell, Hogs and High Water	2023-09-03	1	8930118108881286112
5944545747909061112	2023-11-10	TVEpisode	Shark Tank	2023-03-17	14	6002411599924498112
7698791259869495112	2023-08-23	TVEpisode	The Fourth Horseman	2006-01-06	9	7188923726922774112
7338215875687123112	2023-09-28	TVEpisode	The Ski Lodge	1998-02-24	5	8135854751464083112
7551868396506698112	2023-10-11	TVEpisode	Triple D Nation: Mexi-Cali Meals	2023-07-14	46	4791200799030182112
5160277737991588112	2023-10-27	TVEpisode	Abyss	2002-07-19	6	7188923726922774112
7648746593626851112	2023-11-14	TVEpisode	Sterling and Nina Agdal LIV	2023-12-15	36	6774048176174390112
8236698319931365112	2023-10-03	TVEpisode	Shades of Grey	2000-02-11	3	7188923726922774112
5314689868222819112	2023-08-22	TVEpisode	Sterling and Karrueche Tran XXII	2023-07-24	34	6774048176174390112
6655671033473372112	2023-12-03	TVEpisode	Meaty to Meatless	2023-11-10	47	4791200799030182112
7081343337527384112	2023-12-04	CreativeWork	100 Years of Warner Bros.: Wizarding World and The Big Bang	2022-12-31	0	
7410817391042991112	2023-11-01	TVEpisode	Metamorphosis	2003-02-07	6	7188923726922774112
7947648500376075112	2023-08-27	TVEpisode	Catcher in the Bronx	1999-09-21	4	5422142342997076112
5428209506951813112	2023-12-05	TVEpisode	Sterling and Karrueche Tran XLI	2023-11-03	37	6774048176174390112
8039491115214717112	2023-12-08	TVEpisode	Sterling and Camille Kostek XXV	2023-12-01	37	6774048176174390112
8927630870736419112	2023-12-10	Movie	Tales From the Gimli Hospital: Redux	1991-12-21	0	
8682918862396856112	2024-03-04	TVEpisode	Find Me a Rainbow	1986-03-13	6	5828688862497145112
8544118193526960112	2024-03-07	TVEpisode	A Little Bit of Luck, A Little Bit of Grief	1986-04-03	6	5828688862497145112
6333984339380343112	2024-03-17	TVEpisode	Shark Tank	2023-05-19	14	6002411599924498112
5654946619085893112	2023-12-17	TVEpisode	Mexican, Mediterranean and Mofongo	2023-03-24	45	4791200799030182112
7293391827168559112	2023-12-24	Movie	Race for Your Life, Charlie Brown!	1977-07-16	0	
7348521129465789112	2024-02-14	Movie	Black Sunday	1961-04-18	0	
4874611608160655112	2024-03-18	TVEpisode	One Picture Is Worth	1986-10-08	7	5828688862497145112
4859558058897277112	2024-01-10	TVEpisode	Luther Gillis: File No. 001	1984-12-06	5	5828688862497145112
6188923225507814112	2024-01-11	TVEpisode	Sterling and Nina Agdal LII	2023-12-08	36	6774048176174390112
6984374857527274112	2024-02-28	TVEpisode	Does He Know I'm From Boston?!?!?	2021-06-23	3	7350561899827239112
4910121736685203112	2024-08-08	TVEpisode	Sport Climbing, Cycling	2024-08-07	0	4672030491728623112
8565459317421371112	2024-03-19	TVEpisode	Death and Taxes	1986-10-29	7	5828688862497145112
6750583862818080112	2024-08-07	TVEpisode	What's in the Box?	1964-03-13	5	8866251514307483112
5167463013222651112	2024-01-08	TVEpisode	Triple D Nation: Eats of the Northeast	2023-12-29	47	4791200799030182112
8559097783210781112	2023-08-13	TVEpisode	Sterling and Nina Agdal XVIII	2023-07-12	33	6774048176174390112
6142127631886721112	2023-08-10	TVEpisode	Fallout	2004-01-23	7	7188923726922774112
7084218469346320112	2023-08-13	TVEpisode	Inauguration	2004-02-27	7	7188923726922774112
7850937670662283112	2023-08-21	Movie	Lost Command	1966-09-14	0	
7327712800488723112	2023-08-28	TVEpisode	The Colossal Crawford Reno	2017-03-28	4	4990190839873229112
8982331418252001112	2023-08-21	TVEpisode	Avalon	2005-07-15	9	7188923726922774112
8290092203831893112	2023-09-18	TVEpisode	Sterling and Karrueche Tran XXXI	2023-08-20	34	6774048176174390112
7193362052655415112	2023-10-04	TVEpisode	Maternal Instinct	2000-02-25	3	7188923726922774112
6765534085169020112	2023-10-10	TVEpisode	Sterling and Karrueche Tran XXXVII	2023-09-18	35	6774048176174390112
6649745786460344112	2023-10-17	TVEpisode	The Jororo Kill	1982-01-07	2	5828688862497145112
8965777615442284112	2023-10-26	TVEpisode	Something Borrowed, Something Green	2023-09-21	4	9037311307409885112
8693678694222163112	2023-10-27	TVEpisode	Dragons' Den	\N	18	8720544592473937112
7500843431721433112	2023-10-28	TVEpisode	The Other Guys	2002-08-02	6	7188923726922774112
5035702453828022112	2023-11-14	TVEpisode	Staircase to Heaven	2014-06-21	5	8666423609016769112
9157763486641036112	2023-10-29	TVEpisode	No Safe Harbor	2015-08-19	3	5573821131460912112
8546688579984346112	2023-11-15	TVEpisode	Sterling and Nina Agdal LV	2023-12-15	36	6774048176174390112
6157634502062654112	2023-12-03	TVEpisode	Triple D Nation: Fishin' in Flavortown	2023-11-03	47	4791200799030182112
5587621712377235112	2024-02-14	TVEpisode	Going Home	1985-10-31	6	5828688862497145112
8659509534890965112	2024-02-23	TVEpisode	Hidden Volcano Abyss	2023-05-10	50	8954551503237514112
4960218151021730112	2024-02-23	TVEpisode	Summer School	1986-01-09	6	5828688862497145112
8426916535918062112	2024-02-23	TVEpisode	We Got Robots!	2021-06-02	3	7350561899827239112
8492492810586257112	2024-03-18	TVEpisode	French Flavor and Meaty Kabobs	2024-03-08	48	4791200799030182112
6557384919014571112	2024-01-09	Movie	How to Make an American Quilt	1996-02-10	0	
5647368598979550112	2023-08-28	TVEpisode	Son Surprises His Family With a Major Renovation	2017-01-24	4	4990190839873229112
8630522301700667112	2023-08-21	TVEpisode	Origin	2005-07-29	9	7188923726922774112
5188227729967427112	2024-01-11	Movie	Tequila Sunrise	1988-12-02	0	
4691643517044261112	2023-10-07	TVEpisode	Scorched Earth	2000-08-25	4	7188923726922774112
5662801883470652112	2024-05-30	TVEpisode	Tea Party Rebellion	\N	13	5217253762355250112
6103842155857123112	2023-10-19	TVEpisode	Board Game Empires	2021-12-19	1	6685567252992161112
5438190517789970112	2024-08-07	TVEpisode	Sterling and Nina Agdal LXVIII	2024-07-03	39	6774048176174390112
5086564597631098112	2024-04-26	TVEpisode	On the Scent	2019-07-18	7	8601213205877266112
7630323973568249112	2024-08-07	TVEpisode	Sterling and Nina Agdal LXIX	2024-07-03	39	6774048176174390112
8717595168626539112	2024-08-09	TVEpisode	Sterling and Brie Bella IV	2023-05-08	31	6774048176174390112
9148369507878407112	2024-08-07	TVEpisode	Sterling and Karrueche Tran VI	2023-04-17	31	6774048176174390112
6668920899048589112	2024-08-09	TVEpisode	Sterling and Maddy Smith	2023-05-10	31	6774048176174390112
6677993829511240112	2024-08-09	TVEpisode	Sterling and Madison Beer III	2023-04-26	31	6774048176174390112
6746991375666438112	2023-12-20	Movie	Dr. Seuss' The Grinch	2018-11-08	0	
8157972214765509112	2024-01-14	Movie	New Jack City	1991-03-08	0	
5253301327066916112	2024-02-09	TVEpisode	Sterling and Karrueche Tran XLVIII	2023-12-22	37	6774048176174390112
7239122037275926112	2024-03-04	TVEpisode	Let the Duel Begin	2024-01-02	1	4820226555821797112
6928531732511036112	2024-03-04	TVEpisode	Don't Judge This Book by Its Cover	2024-01-23	1	4820226555821797112
8180929817921754112	2024-03-24	TVEpisode	From the Seas and Overseas	2024-03-15	48	4791200799030182112
6917669907944659112	2024-03-25	TVEpisode	Missing Melody	1986-12-03	7	5828688862497145112
5678599806385096112	2024-04-02	TVEpisode	Solo Flight	1987-02-04	7	5828688862497145112
6622245843574686112	2024-04-02	TVEpisode	Out of Sync	1987-03-11	7	5828688862497145112
8298629175917226112	2024-04-28	TVEpisode	Pilot	2012-09-27	1	8601213205877266112
6736938198263910112	2024-05-12	TVEpisode	Dead Man's Switch	2013-04-25	1	8601213205877266112
5154541437776581112	2024-05-13	TVEpisode	Your Brain: Perception Deception	2023-05-17	50	8954551503237514112
9180949395607885112	2024-05-13	TVEpisode	Your Brain: Who's in Control?	2023-05-24	50	8954551503237514112
8664667853763912112	2024-05-13	TVEpisode	Bermuda Sail Grand Prix	2024-05-11	2024	8116473929552398112
6742062988450732112	2024-05-13	TVEpisode	Risk Management	2013-05-09	1	8601213205877266112
6834938735374441112	2024-05-13	TVEpisode	The Woman	2013-05-16	1	8601213205877266112
8979259582253368112	2024-05-20	TVEpisode	Guilt Trip	2024-10-02	2	7243064540067164112
5899845159181137112	2024-05-29	TVEpisode	Ancient Earth: Inferno	2023-10-25	50	8954551503237514112
6364537894559084112	2024-05-21	TVEpisode	Step Nine	2013-09-26	2	8601213205877266112
8374763547830715112	2024-05-28	TVEpisode	Internal Audit	2013-12-12	2	8601213205877266112
8243361354671953112	2024-06-04	TVEpisode	Carolina Crash Course	2024-04-23	13	5217253762355250112
5220845320960979112	2024-05-28	Movie	The Lavender Hill Mob	1951-09-10	0	
8347882463463940112	2024-06-09	TVEpisode	Canadian Grand Prix	2024-06-09	0	5584345400977409112
8897122631347526112	2024-06-28	TVEpisode	Sterling and Kristy Sarah	2024-06-16	41	6774048176174390112
5427646139708254112	2024-08-07	TVEpisode	Sterling and Nina Agdal LXVII	2024-07-03	39	6774048176174390112
4976564986084490112	2024-08-08	TVEpisode	The Masks	1964-03-20	5	8866251514307483112
6810043347612877112	2024-04-17	TVEpisode	Family	1998-08-14	2	7188923726922774112
5958132522836237112	2024-04-19	TVEpisode	Chinese Grand Prix, Sprint Qualifying	2024-04-18	0	5584345400977409112
6913624478791498112	2024-04-20	TVEpisode	Chinese Grand Prix, Qualifying	2024-04-19	0	5584345400977409112
6295713791437427112	2024-04-19	TVEpisode	Chaos & Complexity	2024-04-10	1	6841471502942939112
6788196831503733112	2024-05-01	TVEpisode	The Rat Race	2012-10-25	1	8601213205877266112
8413766392240926112	2024-05-03	TVEpisode	You Do It To Yourself	2012-12-06	1	8601213205877266112
4749641451840480112	2024-08-09	TVEpisode	Sterling and Madison Beer	2023-04-26	31	6774048176174390112
5514395386083990112	2023-12-05	TVEpisode	Sterling and Karrueche Tran XLIV	2023-11-17	37	6774048176174390112
7903465227441461112	2024-04-02	TVEpisode	The Aunt Who Came to Dinner	1987-03-18	7	5828688862497145112
8598578755908585112	2024-08-10	TVEpisode	Press Your Luck-Mania!	2024-08-08	6	7350561899827239112
8707980213652405112	2024-08-10	TVEpisode	Sterling and Karrueche Tran IV	2023-05-17	31	6774048176174390112
6754737592019520112	2024-08-10	TVEpisode	Sterling and Camille Kostek III	2023-05-15	31	6774048176174390112
5387957703651442112	2024-08-10	TVEpisode	Sterling and Camille Kostek IV	2023-05-15	31	6774048176174390112
8124353378406004112	2024-08-10	TVEpisode	Sterling and Karrueche Tran II	2023-05-17	31	6774048176174390112
8652414313292732112	2023-08-13	TVEpisode	Top-Notch Toppings	2023-07-28	46	4791200799030182112
7291675468092612112	2023-08-30	TVEpisode	Sterling and Nina Agdal XX	2023-07-30	34	6774048176174390112
7147298291058559112	2023-08-29	TVEpisode	Sterling and Carly Aquilino XX	2023-07-28	34	6774048176174390112
6315729856124124112	2023-12-11	Movie	Solaris	1972-03-20	0	
9098903874780601112	2024-01-26	TVEpisode	Chinamax; Russian Standard; Abalone	2013-12-12	10	7112240447450524112
8964677438244202112	2024-01-26	TVEpisode	Ball Bearings; Cartoonists' Ink; False Eyes	2013-11-07	10	7112240447450524112
9132458193619736112	2024-08-09	TVEpisode	Sterling and Maddy Smith III	2023-05-10	31	6774048176174390112
5877333461813851112	2024-08-09	TVEpisode	Morning/Primetime, Day 14	\N	0	6659086370425105112
4948172631973547112	2024-03-04	TVEpisode	Way of the Stalking Horse	1986-02-20	6	5828688862497145112
9204265058312278112	2024-05-24	TVEpisode	Beauty Knows No Pain	1981-04-16	1	5828688862497145112
4830015944284672112	2024-06-26	TVEpisode	Sterling and Lolo Wood XLI	2024-05-19	40	6774048176174390112
5813339001956041112	2024-06-26	TVEpisode	Sterling and Lolo Wood XLII	2024-06-02	40	6774048176174390112
4946543210582276112	2024-08-09	TVEpisode	Sterling and Maddy Smith II	2023-05-10	31	6774048176174390112
5432306279834572112	2024-08-09	TVEpisode	Sterling and The Stallone Sisters	2023-05-15	31	6774048176174390112
7762919950703898112	2024-08-09	TVEpisode	Sterling and Madison Beer IV	2023-04-26	31	6774048176174390112
5335968098651527112	2024-08-09	TVEpisode	Sterling and Maddy Smith IV	2023-05-10	31	6774048176174390112
8315144993089477112	2024-08-09	TVEpisode	Sterling and The Stallone Sisters II	2023-05-15	31	6774048176174390112
7570873857917502112	2024-08-10	TVEpisode	Sabotage	2005-02-25	1	5534151813022966112
4808211570404926112	2024-08-10	TVEpisode	Triple D Nation: Diner Dishes	2024-07-18	48	4791200799030182112
8915401542771431112	2024-08-11	TVEpisode	Sterling and Karrueche Tran IX	2023-06-07	32	6774048176174390112
8140542608570789112	2024-08-11	TVEpisode	Sterling and Karrueche Tran V	2023-05-17	32	6774048176174390112
5566004400169767112	2024-08-11	TVEpisode	Fistful of Flavor	2024-08-02	48	4791200799030182112
5552773293017605112	2024-08-11	TVEpisode	Sterling and Nina Agdal V	2023-05-22	32	6774048176174390112
5855554498023207112	2024-08-11	TVEpisode	Sterling and Nina Agdal III	2023-05-22	32	6774048176174390112
7114680449766435112	2024-08-11	TVEpisode	Sterling and Karrueche Tran VII	2023-05-17	32	6774048176174390112
9092478607369636112	2024-08-11	TVEpisode	Sterling and Nina Agdal IV	2023-05-22	32	6774048176174390112
7982257633732851112	\N	Unknown	error 404	\N	0	
6085881137214872112	\N	Unknown	error 404	\N	0	
5321677994369601112	2024-08-11	TVEpisode	Sterling and Lolo Wood III	2023-05-24	32	6774048176174390112
8538843271897858112	2024-08-11	TVEpisode	Sterling and Nina Agdal IX	2023-05-22	32	6774048176174390112
8403562208485176112	2024-08-11	TVEpisode	Sterling and Carly Aquilino VI	2023-05-29	32	6774048176174390112
7157996626544443112	2024-08-11	TVEpisode	Sterling and Lolo Wood VI	2023-05-24	32	6774048176174390112
5450737085568149112	2024-08-11	TVEpisode	Sterling and Lolo Wood IX	2023-05-24	32	6774048176174390112
4957286488180065112	2024-08-11	TVEpisode	Sterling and Carly Aquilino IX	2023-05-29	32	6774048176174390112
8669640860341192112	2024-08-11	TVEpisode	Sterling and Lolo Wood	2023-05-24	32	6774048176174390112
4646764383193125112	2024-08-11	TVEpisode	Sterling and Carly Aquilino V	2023-05-29	32	6774048176174390112
6791572340051454112	2024-08-12	TVEpisode	Sterling and Madison Beer VIII	2023-05-31	32	6774048176174390112
9137862078597883112	2024-08-12	TVEpisode	Sterling and Madison Beer V	2023-05-31	32	6774048176174390112
7306527312029366112	2024-08-11	TVEpisode	Sterling and Madison Beer II	2023-05-31	32	6774048176174390112
7405609317939219112	2024-08-12	TVEpisode	Sterling and Madison Beer VI	2023-05-31	32	6774048176174390112
9022213405767366112	2024-08-12	Movie	The Bourne Identity	2002-06-06	0	
4720252871307091112	2023-11-06	TVEpisode	Chanel and Sterling DXIX	2022-07-06	27	6774048176174390112
6445854544219875112	2024-04-12	TVEpisode	Chanel and Sterling CL	2019-12-27	15	6774048176174390112
4836484629794430112	2024-08-12	TVEpisode	Counterfeit Reality	2005-03-11	1	5534151813022966112
8418766733889667112	2024-08-12	TVEpisode	Identity Crisis	2005-04-01	1	5534151813022966112
5709835163778694112	2024-08-12	TVEpisode	Sterling and Draya Michele	2023-06-05	32	6774048176174390112
6072905608634808112	2024-08-12	TVEpisode	Sterling and Draya Michele II	2023-06-05	32	6774048176174390112
6093077231999587112	2024-08-12	TVEpisode	Sterling and Draya Michele III	2023-06-05	32	6774048176174390112
7887540810212039112	2024-08-12	TVEpisode	Sterling and Draya Michele IV	2023-06-05	32	6774048176174390112
6509530243681794112	2024-08-13	TVEpisode	Sterling and Karrueche Tran XII	2023-06-09	32	6774048176174390112
8934791676080961112	2024-08-12	TVEpisode	Sterling and Karrueche Tran X	2023-06-07	32	6774048176174390112
5335871034802275112	2024-08-13	TVEpisode	Sterling and Karrueche Tran XI	2023-06-09	32	6774048176174390112
5463835662571441112	2024-08-13	TVEpisode	Sterling and Nina Agdal VII	2023-06-12	32	6774048176174390112
6220425129630042112	2024-08-13	TVEpisode	Sterling and Nina Agdal X	2023-06-12	32	6774048176174390112
5575134372815670112	2024-08-13	TVEpisode	Sniper Zero	2005-04-15	1	5534151813022966112
7543791488115189112	2024-08-13	TVEpisode	Dirty Bomb	2005-04-22	1	5534151813022966112
8073145608091746112	2024-08-13	TVEpisode	Sterling and Nina Agdal XI	2023-06-12	32	6774048176174390112
6347466956146749112	2024-08-13	TVEpisode	Sterling and Lolo Wood IV	2023-06-14	32	6774048176174390112
5729435422312718112	2024-08-14	TVEpisode	Shark Tank	2024-01-26	15	6002411599924498112
8432702816620849112	2024-08-15	TVEpisode	Sterling and Lolo Wood VII	2023-06-14	32	6774048176174390112
7672044351447013112	2024-08-14	Movie	Casablanca	2005-05-27	0	
6273001259092095112	2024-08-15	TVEpisode	Sterling and Lolo Wood XVI	2023-06-14	32	6774048176174390112
8197418323497876112	2024-08-15	TVEpisode	Sterling and Lolo Wood XII	2023-06-14	32	6774048176174390112
7525195654000368112	2024-08-16	TVEpisode	Sterling and Carly Aquilino XIII	2023-06-16	32	6774048176174390112
5683935054099926112	2024-08-16	TVEpisode	Sterling and Carly Aquilino IV	2023-06-16	32	6774048176174390112
8141548497796260112	2024-08-16	TVEpisode	Sterling and Carly Aquilino VII	2023-06-16	32	6774048176174390112
7803551349935626112	2024-08-16	TVEpisode	Sterling and Camille Kostek V	2023-06-19	32	6774048176174390112
4736885347633372112	2024-08-16	TVEpisode	Sterling and Carly Aquilino XI	2023-06-16	32	6774048176174390112
9072504920848572112	2024-03-12	TVEpisode	Sterling and Jessica Wild	2024-03-08	38	6774048176174390112
5120308305358677112	2024-08-16	TVEpisode	Sterling and Camille Kostek VI	2023-06-19	32	6774048176174390112
6121373857834578112	2024-08-16	TVEpisode	I Don't Believe It!	2024-08-15	6	7350561899827239112
8920808041827762112	2024-08-16	TVEpisode	Sterling and Camille Kostek VIII	2023-06-19	32	6774048176174390112
6052311296228804112	2024-08-16	TVEpisode	Sterling and Karrueche Tran XIV	2023-06-21	33	6774048176174390112
6298622681429794112	2024-08-16	TVEpisode	Sterling and Karrueche Tran XV	2023-06-21	33	6774048176174390112
8787347708599065112	2024-08-16	TVEpisode	Sterling and Karrueche Tran XVI	2023-06-21	33	6774048176174390112
8653229723970172112	2024-08-16	TVEpisode	Sterling and Karrueche Tran XVII	2023-06-21	33	6774048176174390112
9090229007408227112	2024-08-16	TVEpisode	Sterling and Brittney Elena	2023-06-23	33	6774048176174390112
9173944506350969112	2024-08-16	TVEpisode	Sterling and Brittney Elena II	2023-06-23	33	6774048176174390112
5962039992433327112	2024-08-17	Movie	Knowing	2009-03-20	0	
8057714457573877112	2024-08-19	TVEpisode	Obsession	2005-10-07	2	5534151813022966112
7912311251740476112	2024-04-04	TVEpisode	[bad] Sterling and Jessica Wild	\N	38	6774048176174390112
6820075358513969112	2024-08-19	TVEpisode	Sterling and Nina Agdal VIII	2023-06-26	33	6774048176174390112
7275329163423263112	2024-08-19	TVEpisode	Assassin	2005-10-21	2	5534151813022966112
8379895996698422112	2024-08-19	TVEpisode	Sterling and Brittney Elena IV	2023-06-23	33	6774048176174390112
6525342523797995112	2024-08-19	TVEpisode	Sterling and Brittney Elena III	2023-06-23	33	6774048176174390112
8691292999082186112	2024-08-19	TVEpisode	Sterling and Nina Agdal XIV	2023-06-26	33	6774048176174390112
9221332288497180112	2024-08-19	TVEpisode	Sterling and Nina Agdal XIII	2023-06-26	33	6774048176174390112
5994943457834632112	2024-08-19	TVEpisode	Sterling and Nina Agdal XII	2023-06-26	33	6774048176174390112
7455642923265331112	2024-08-20	TVEpisode	Sterling and Teala Dunn II	2023-06-30	33	6774048176174390112
8726155529074826112	2024-08-20	TVEpisode	Sterling and Teala Dunn	2023-06-30	33	6774048176174390112
5907530310716560112	2024-08-19	TVEpisode	Sterling and Lolo Wood XI	2023-06-28	33	6774048176174390112
9180643589050739112	2024-08-19	TVEpisode	Sterling and Lolo Wood XVII	2023-06-28	33	6774048176174390112
6191725147325167112	2024-08-20	TVEpisode	Sterling and Lolo Wood XIII	2023-06-28	33	6774048176174390112
8522491424279812112	2024-08-20	TVEpisode	Sterling and Lolo Wood VIII	2023-06-28	33	6774048176174390112
5977294271422558112	2024-08-20	TVEpisode	Sterling and Teala Dunn IV	2023-06-30	33	6774048176174390112
8177700457666702112	2024-08-20	TVEpisode	Sterling and Teala Dunn III	2023-06-30	33	6774048176174390112
\.


--
-- PostgreSQL database dump complete
--

