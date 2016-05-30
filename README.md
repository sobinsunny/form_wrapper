# FormWrapper Module
This form wrapper is using to render Dynamically create form elements from a json file.

We can specify the elemets attributes inside a json file.


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
      }
     "3" : {
        "type" : "select_box",
        "field" : "comment",
        "name" : "password",
        "class": "class_name",
        "validations" : "",
        "options": [['name1','value1'],['name2','value2']]
        },
      }
    }
    ```
    
##System dependencies

 ```ruby version 1.9```
 
 Recommending bootsrap gem to design form
 
 ##Instalation
   First add  ```form_builder_helper.rb``` to lib file
   Add module to ApplicationHelper Module
   ```include FormBuilderHelper```
   
   

     
    
    
    
