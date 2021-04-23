## How to use

### Set Up Project

Clone this repository and run:

```
bundle
```

### Set Up Database

* Connect to `psql` and create `bookmark_manager` database and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

* Set up the appropriate tables by connecting to each database in `psql` using the command `\c bookmark_manager;`
* Run the SQL scripts in the `db/migrations` folder in the given order.

### Run The App

```
rackup
```

### Run Tests:

```
rspec
```
### Run Linting:
```
rubocop
```

## User Stories

### User Story 1
```
As a web user 
So that I can access websites I regularly visit
I'd like to see list of saved bookmarks
```
### User Story 2
```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```
### User Story 3
```
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
```


#### Domain Model


| Nouns   | Verbs     |
|---------|-----------|
|Bookmarks| Show list |
|List     | add to list      |
|url      | 
|title    |

| Nouns   | Property/ Owner|
|---------|-----------     |
|Bookmarks| Owner          |
|List     | Owner          |
|url      | property       |
|title    | property       | 

| Actions  | Owned by?  |
|--------- |----------- |
|print_list| List       |
|add_to_list| List      |


| Actions  |Property it reads or changes |
|--------- |-----------                  |
|print_list| @bookmark_manager - reads      |
|add_to_list| @bookmark_manager - changes  |

|Class     | Bookmark  |
|--------- | ----------- |
|Properties| @url, @title|
|Actions   | initialize  |



|Class     | BookmarkManager | 
|---------|----------|
| Properties |  @bookmark_list | 
| Actions | print_list | 
| Actions | add_to_list |


#### Diagram planning: 
* REQUEST: client visits /bookmarks (get request) (client --> controller/server)
* controller (app.rb) asks Bookmark class (model) to retrieve bookmarks (#print_list) (server --> model)
* the Bookmark class returns all stored bookmarks as array (model --> controller/server)
* controller renders the [bookmarks] array to webpage (HTML) view (controller --> view --> controller)
* RESPONSE: This view is sent to the user as a response (controller --> client)

#### User Story 1 Features: 
  1. a Controller
  2. a Bookmark class
  3. a bookmark view
  
  ![user_story_1.png](./public/images/user_story_1.png)

#### User Story 2 Features: 
  1. 

#### User Story 3 Features:
  1. 