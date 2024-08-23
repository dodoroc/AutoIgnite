# AutoIgnite

- This was supposed to be a simple way to track episodes of series where a mismatch between episode titles/dates/seasons occurred; specifically the show Ridiculousness after Chanel (female laughing host) left.
- A source of well known episode names is imported and then compared against data received from the api of watched episodes. 
- The source provider (Rogers Ignite) uses Comcast's XFinity system which uses Firebolt.


## Extension

Browser extension to inject code to the ignitetv.rogers.com and get results where applicable for storage. 

Tech: HTML, CSS, JS/ES6 (Use vuejs if interface gets complex; unknown)

- Get watched list (object or array depending on how accessed).
- Get details for each item in watched list such as show name, series name, season, show title...
- Remove item in watched list via 'mark unwatched' (needs confirmation but expected to work)
- Show which episodes haven't been watched to schedule recording (automation possible?)

## Server

Track the show in question by show and/or title. 

Tech: PHP8


## Reference
https://docs.developer.comcast.com/docs/120-core-entertainment-schema
https://stackoverflow.com/questions/9515704/access-variables-and-functions-defined-in-page-context-from-an-extension
https://patrickdesjardins.com/blog/how-to-communicate-from-your-website-to-a-chrome-extension
https://duo.com/labs/tech-notes/message-passing-and-security-considerations-in-chrome-extensions
https://www.freecodecamp.org/news/chrome-extension-message-passing-essentials/
https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/runtime/Port
