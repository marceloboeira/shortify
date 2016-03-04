## Assignment

Your task is to build a web service for shortening URLs. This will be an API-only service with no built-in browser UI. The deliverable is the source code, written in any language you choose, using whichever libraries, tools, database(s), and development methodologies you choose.

The requirements intentionally leave out many details. This is an opportunity for you to make decisions about the design of the service. What you leave out is just as important as what you include!

### Product Requirements:

* An API client should be able to send an HTTP request to create a shortened URL which redirects to some other URL.
  - In the request, the client should be able to optionally specify a string to use as the "slug" which the shortened URL is based on.
  - If no slug is provided, the service should generate one.
  - The response body should include some representation of the shortened URL along with the target URL that it redirects to.

* When a client makes a request to one of the shortened URLs that have been created, the service should respond with an HTTP redirect to the associated target URL.

### Project Requirements:

* The project should include an automated test suite.

* The project should include a README file with instructions for running the web service and its tests. You should also use the README to provide context on choices made during development.

* The project should be packaged as a compressed archive (e.g. a zip file).

