# AutoIgnite

- This was supposed to be a simple way (console) to track episodes of a series where a mismatch between episode titles/dates/seasons occurred; specifically the show Ridiculousness after Chanel (female laughing host) left.
- A source of well known episode names is imported and then compared against data received from the api of watched episodes. 
- The source provider (Rogers Ignite) uses Comcast's XFinity system.
- This project then grew as an experiment and is broken into 3 parts 'Extension' to bypass CORS issues and fetch data, 'Server' which really is just a basic API and 'Site' which is just a dashboard to view the results. 


## Extension

Browser extension to inject code into the sieged page, create a communications channel, send/recv data from an internal api (server), process data and monitor progress. 

Tech: HTML, CSS, JavaScript/ES, Browser Extension API


## Server

Simple experiment building a no framework api, end result a micro-micro-micro framework emerged. 

Tech: PHP 8, PDO, Composer, PostgreSQL 16 RDBMS, NGiNX web server


## Site

Basically a simple dashboard and some basic filters.

Tech: HTML 5, CSS 3, JavaScript, Petite VUE, nginx



### Other Tech

- GitHub Actions 
- Linux server (Rocky 9)



### Further

- Add program episodes to extension instead of just cutting and pasting script to general query from scraped data.
- ...


### References
- https://docs.developer.comcast.com/docs/120-core-entertainment-schema
- https://stackoverflow.com/questions/9515704/access-variables-and-functions-defined-in-page-context-from-an-extension
- https://patrickdesjardins.com/blog/how-to-communicate-from-your-website-to-a-chrome-extension
- https://duo.com/labs/tech-notes/message-passing-and-security-considerations-in-chrome-extensions
- https://www.freecodecamp.org/news/chrome-extension-message-passing-essentials/
- https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/runtime/Port
