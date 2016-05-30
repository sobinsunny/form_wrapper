# FormWrapper Module
This form wrapper is using to render form elements from a json file.

User can specify the elemets properties inside a json file.


```{
    "form_name" : "test_form",
    "form_id"	: "test_form_id",
    "action"    : "create",
    "controller": "controller",
    "elements": {
      "text" : {
        "type" : "password",
        "field" : "comment",
        "name" : "password",
        "class": "class_name",
        "validations" : ""
        },
     "text" : {
        "type" : "number",
        "field" : "comment",
        "name" : "password",
        "class": "class_name",
        "validations" : ""
        },
      }
    }```
    
    
