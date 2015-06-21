#frontwhalesOS's project

#FwOS

##CONTENT OF THIS FILE

*Introduction
*API Documatation
*Users
*Posts
*Guesses
*Troubleshooting
*FAQ
*Contributors

##INTRODUCTION

This is a group project Rails Engineers are currently developing along with Front-End Engineers and a IOS Engineer. We are  developing a
Guess-the-Image Web-Application where users are welcome to play; guess the image and have fun! This application is very easy to adapt.
Every time you guess an image correctly, you will earn points. In the contrary, points will be deducted every time you guessed incorrectly.
Visit our App to sharpened your guessing skills while having a splendid time.

##Website URL

https://morning-sands-1943.herokuapp.com/

##API's

###Sign up to:
* Post requests for images.
* Answer requests or view answers to existing requests.
* Vote answers up or down.

### User

### Sign Up / Register

* Path: `POST '/users/register'`
* Params:
  * username: a string
  * Full name: a string
  * email: a string
  * password: a string

* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:

  ```
{
  "user": {
    "id": 2,
    "email": "brit@tiy.com",
    "access_token": "c25ddd49a8b0bc1cb8ba84727538e376"
  }
}
  ```

  * Example failure:

  ```
{
  "errors": [
    "Email has already been taken"
  ]
}
  ```
  
### Login

* Path: `POST '/users/login'`
* Params: 
  * username: a string
  * password: a string
  
```
{"user":{"id":4,"username":"tucker","full_name":null,"email":"tucker0@tucker.com","access_token":"dbe2e11d187ddc0a13476c8df6716cbe"}}
```

* A new access token will be created for each session

### View a single User

* Path: `GET '/users/:user_id'`

```
{"user":{"id":2,"username":null,"full_name":null,"email":"Blah@blah.com","access_token":"75293a1701b8e748a673865f45e835f4"}}
```

### View all Users

* Path: `GET '/users'`

```
{"user":[
         {"id":1,"username":null,"full_name":null,"email":"tucker@tucker.com"},
         {"id":2,"username":null,"full_name":null,"email":"Blah@blah.com"},
         {"id":3,"username":null,"full_name":null,"email":"tucker1@tucker.com"},
         {"id":4,"username":null,"full_name":null,"email":"tucker2@tucker.com"},
         {"id":5,"username":null,"full_name":null,"email":"tucker3@tucker.com"},
         {"id":6,"username":null,"full_name":null,"email":"tucker4@tucker.com"},
         {"id":7,"username":null,"full_name":null,"email":"nick@test.com"},
         {"id":8,"username":null,"full_name":null,"email":"nick@tes1t.com"},
```

##Posts

###Request all posts:

* Path: `GET '/posts'`
* Params: none
* If authanticated
* Status: 200 Ok
* Response:
```
 {
    "id": 1,
    "image_url": "http://www.yahoo.com",
    "user_id": null,
    "answer": null,
    "guesses": [],
    "guess_id": null,
    "created_at": "2015-06-19T11:41:50.270Z",
    "updated_at": "2015-06-19T11:41:50.270Z",
    "title": "What is this",
    "posted_at": null
  },
  ```

* If unauthenticated.
* Status: 200 OK
* Response:

```
{
  "post": [
    {
      "id": 1,
      "image_url": "http://www.yahoo.com",
      "title": "What is this",
      "posted_at": null
    },
  ]
}
```

###Create a Post

* Path: `POST '/posts'`
* Params: none

* You must be authanticated before creating a post.
* Status: 201 Created
* Response:

```{
  "post": {
    "id": 24,
    "image_url": "google.com",
    "user_id": null,
    "answer": "bottle",
    "guesses": [],
    "guess_id": null,
    "created_at": "2015-06-20T22:12:45.701Z",
    "updated_at": "2015-06-20T22:12:45.701Z",
    "title": "Guess",
    "posted_at": null
  }
}```

* If authanticated.
* Status: 500 Internal Server Error
* Error Message:

```{"message":"Access Token not found."}```

###Show a Post

* Path: `GET '/posts/:username/:id'`
* Params: username and id
* Must be authanticated to see a particular post
* Response:

```{
  "post": {
    "id": 24,
    "image_url": "google.com",
    "user_id": null,
    "answer": "bottle",
    "guesses": [],
    "guess_id": null,
    "created_at": "2015-06-20T22:12:45.701Z",
    "updated_at": "2015-06-20T22:12:45.701Z",
    "title": "Guess",
    "posted_at": null
  }
}```

* If unauthenticated.
* Status: 500 Internal Server Error
* Error:

```{"message":"Access Token not found."}```

###New Post

* Path: `GET '/posts/new'`
* Params:none
* Must be authanticated to create a post
* Status: 200 OK
* Response:

```{
  "post": {
    "image_url": null,
    "answer": null,
    "title": null
  }
}```

* If not authanticated,
* Status: 500 Internal Server Error.
* Response:

```
{
  "message": "Access Token not found."
}
```

###Edit a Post

* Path: `GET '/posts/:id/edit'`
* Params: id
* Must be authanticated to edit a post
* Response:

```{
  "post": [
    {
      "id": 1,
      "image_url": "http://www.yahoo.com",
      "title": "What is this",
      "posted_at": null
    },
  ]
}```

* If not authanticated,
* Status: 500 Internal Server Error.
* Response:

```
{
  "message": "Access Token not found."
}
```

###Update a Post

* Path: `PATCH '/posts/:id'`
* Params: id
* Must be authanticated to update a post.

```{
  "post": [
    {
      "id": 1,
      "image_url": "http://www.yahoo.com",
      "title": "What is this",
      "posted_at": null
    },
  ]
}```

* If not authanticated
* Status: 500 Internal Server Error
* Response:

```
{
  "message": "Access Token not found."
}
```

###Delete a Post

* Path `DELETE '/posts/:id'`
* Params: id
* Must be authanticated to delete a post

```{
  "post": [
    {
      "id": 1,
      "image_url": "http://www.yahoo.com",
      "title": "What is this",
      "posted_at": null
    },
  ]
}```

* If not authanticated
* Status: 500 Internal Error Server
* Response:

```{
  "message": "Access Token not found."
}```


#Contributors to FwOS

##Front End

  * Joseph W Joyave
    * https://github.com/jjoyave1
  
  * Nick Leach
    * https://github.com/nickleach
   
  * Christian Bustamante
    * https://github.com/chrisbusta
  
##Mobile

  * Reed Carson
    * https://github.com/rpcarson
 
##Back End

  * Juan Ordaz
    * https://github.com/juanr2001
  
  * Tyler Day
    * https://github.com/TK2Day
  
  * Tucker Watts
    * https://github.com/TuckerWatts
  