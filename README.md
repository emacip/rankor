# Rankor

### Intro
The goal of the project is to build a Question and Answer application.

### Specifications:

- Users can auth with Google Oauth
- Users can submit questions
- Users can submit answers to questions
- Both answers and question bodies should be in markdown
- Questions can be searched by title, and body (you can ignore answers)





## Development environment notes:
 - We are using the Figaro gem for keeping our ENV file hidden. There is a file called `/config/application.yml` that is not commited. 
 - The google API key that we are developing with is configured to accept requests from localhost:3000. If you are using another port for development and attempt to sign in you will get an unauthorized redirect URI error. Use port 3000.