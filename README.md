# FormWrapper Module
This form wrapper is used to render dynamic form elements from a JSON file.

In the **json** file we can specify the elememts and its properties.

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
      "options": [["value1","name2"],["value2","name2"]]
      },
    }
  }
  ```

## System dependencies
```ruby
ruby version >= 1.9
```
Recommending _bootstrap_ gem to  design layout of a form or individual form elements

##Instalation
 First add
```ruby
  form_builder_helper.rb
```
to the lib directory of your rails app.

 Add this line to your ApplicationHelper

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
 <%=create_form_elements(@json)%>
<% end %>
```
Here **@json** is a json object containing form field details.
## Input Format
The json object should have a form_name that is same as the object name like 'post','comment'.
Each element of the json object is for specifying the attributes of each form tag. Each element should  have a distinct number as the key.
```json
     "1" : {
      "type" : "",
      "field" : "",
      "name" : "",
      "class": "",
      "validations" : ""
      },
  ```

* **_type_** - is for specifying the of the input tag like
**text_box**,**checkbox**.
* **_field_** -  field name such as name,title.
* **_name_** - name of the html tag.
* **_css_** - css class name.
* **_validations_** - validation is for specifying pattern of an input data. Here we can specify either regular expression, or common  input types like 'url','email'.
  * url - Is for url input. It will check the input data has to be a url. Else it won't allow the form to submit.
  * email - Is for email validations,only specify  ```validation=>'email'```
* options - This is mainly for select box tag. These are used to specify options. It should be in the format of value,name.

  ## Custom configuration
   Here we can render single form tag also
   * for check text box

     ```ruby

      validated_form_tag :name=>"name",:form_name=>"form_name",:class=>"css   class name",:required=>"true",:feild=>"column name"

     ```
   * select
   ```ruby

   build_validated_select :form_name=>"",:feild=>"column name",options=>['value','name'],:multipile=>true

   ```
   * text_area
   ```ruby

     text_area :name=>"name",:form_name=>"form_name",:class=>"css   class name",:required=>"true",:feild=>"column name"

     ```

 For every field, system  will automatically generate one span element along with each form tag. If we want to show the error message, then  user needs to pass the error field inside that element in the JSON object.
