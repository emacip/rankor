# Rankor

### The Problem 
The goal of the project is to build a Question and Answer application.
The users need to login using Google+ API


### Specifications:

- Users can auth with Google Oauth
- Users can submit questions
- Users can submit answers to questions
- Both answers and question bodies should be in markdown
- Questions can be searched by title, and body (you can ignore answers)



### Arquitecture
We are going to create a rails app with a three party services to authenticate in our app.
All actions need to authorize before execute. Internal use. 
After update_or_create the user a new session will be create so we can aouthorize to use the platform. 
Managin three models: User, Question, Answer.
The model Question is going to be indexed to support search functionality.
Will run the elasticsearch cluster with the rails app to use the search function. The search method it is implement in the 
question model to allow filter by title or body at the same time.


##### Requirements
- Ruby 2.3.1
- Rails 5.1.6
- PostgreSQL
- Elasticsearch

### Implementation

- Authentication
  - Method update_or_create in User model to manage the response of the Google+ API.
  Session to login or logout the platform. 

- Authorize
  - Check if `current_user` exist, if not redirect to `root_path`

- Questions and Answers
  - Nested Resources to avoid send ids hiden in the form.


- Markdown Bodys
  - I used the gem `md_simple_editor` like an editor of the textare. When we save a question or an answer the body is save in md format.
  - To decode the md text is necesary use `Redcarpet::Markdown.new`   
  
  
- Elasticsearch
  - Search engine for index the Question model.
  - It is necessary have the elasticsearch cluster running to past the test or search by title or body.
  


### Development environment notes:
  - We are using the Figaro gem for keeping our ENV file hidden. There is a file called `/config/application.yml` that is not commited. 
  - The google API key that we are developing with is configured to accept requests from localhost:3000. If you are using another port for development and attempt to sign in you will get an unauthorized redirect URI error. Use port 3000.
  - You need to start an Elasticsearch cluster for test. Use port 9250.
  
