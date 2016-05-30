# FormWrapper Module
This form wrapper is using to render dynamic form elements from a json file.

In the json file we can specify the elememts and its properties.

```json
{
  "form_name" : "test_form",
  "elements": {
    "1" : {
      "type" : "password",
      "field" : "comment",
      "name" : "password",
      "class": "class_name",
      "validations" : ""
      },
   "2" : {
      "type" : "number",
      "field" : "comment",
      "name" : "password",
      "class": "class_name",
      "validations" : ""
      },
   "3" : {
      "type" : "select_box",
      "field" : "comment",
      "name" : "password",
      "class": "class_name",
      "validations" : "",
      "options": [value,name]
      },
    }
  }
  ```
  
## System dependencies
```ruby
ruby version >= 1.9
```
Recommending _bootstrap_ gem to design form or indivitual form elemets

##Instalation
 First add
```ruby
  form_builder_helper.rb
```
to the lib directory
 
 Add this line to your ApplicationHelper Module
 
 ```ruby
 include FormBuilderHelper
 ```

## Usage
We can use this method to render the form  elements into view
 ```ruby
 create_form_elements(json)
 ```
 We can use this function inside a form block like this
 
```ruby
<%= form_for(@post) do |f| %>
 <%=create_form_elements(json)%>
<% end %>
```
Here **json** is an instance variable that contains details about form elements.

## Input Format
In the input json should have form_name that same as the  object name like 'post','comment'. 
Each elemets that is for specifying each form tags, and its properties.
```json
     "1" : {
      "type" : "",
      "field" : "",
      "name" : "",
      "class": "",
      "validations" : ""
      },
  ```
**type** is for specifying the of the input tag like
**text_box**,**checkbox**
