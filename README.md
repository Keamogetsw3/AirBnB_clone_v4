# AirBnB clone

## 0x06. AirBnB clone - Web dynamic

While we won’t be implementing every feature, we’ll focus on key functionalities that cover all the fundamental concepts we've been learning. Over the next four months, we’ll develop a complete web application that includes:

1. A Command Interpreter: To manipulate data without a visual interface, just like in a Shell—perfect for development and debugging.
2. A Website (Front-End): To showcase our final product to the world, with both static and dynamic elements.
3. Data Storage: Using either a database or files to store our data, which consists of objects.
4. [An API](https://github.com/Keamogetsw3/AirBnB_clone_v4): To create a communication interface between the front-end and our data, allowing us to retrieve, create, delete, and update information.

![image](https://github.com/user-attachments/assets/4aea27a9-ac13-4219-b6a1-383f5b32ceba)

### ORIGINAL AUTHORS
Alexa Orrico

Jennifer Huang

Jhoan Zamora

David Ovalle

This project is a fork of https://github.com/jzamora5/AirBnB_clone_v3

Original Project's [README](https://github.com/jzamora5/AirBnB_clone_v3/blob/master/README.md)

### NEW CONTRIBUTORS
Keamogetswe M

# Contributions

## 1. Write a script that starts a Flask web application:

- Based on web_flask, copy: web_flask/static, web_flask/templates/100-hbnb.html, web_flask/__init__.py and web_flask/100-hbnb.py into the web_dynamic folder
- Rename 100-hbnb.py to 0-hbnb.py
- Rename 100-hbnb.html to 0-hbnb.html
- Update 0-hbnb.py to replace the existing route to /0-hbnb/
- If 100-hbnb.html is not present, use 8-hbnb.html instead
- One problem now is the asset caching done by Flask.
  - To avoid that, you will add a query string to each asset:
  - In 0-hbnb.py, add a variable cache_id to the render_template. The value of this variable must be an UUID (uuid.uuid4())
  - In 0-hbnb.html, add this variable cache_id as query string to each <link> tag URL

 Replace the route 0-hbnb with 1-hbnb in the file 1-hbnb.py (based on 0-hbnb.py)

## 2. Create a new template 1-hbnb.html (based on 0-hbnb.html) and update it:

- Import JQuery in the <head> tag
- Import the JavaScript static/scripts/1-hbnb.js in the <head> tag
- In 1-hbnb.html and the following HTML files, add this variable cache_id as query string to the above <script> tag
- Add a <input type="checkbox"> tag to the li tag of each amenity
- The new checkbox must be at 10px on the left of the Amenity name
- Add to the input tags of each amenity (<li> tag) the attribute data-id=":amenity_id" => this will allow us to retrieve the Amenity ID from the DOM
- Add to the input tags of each amenity (<li> tag) the attribute data-name=":amenity_name" => this will allow us to retrieve the Amenity name from the DOM
- Write a JavaScript script (static/scripts/1-hbnb.js):
  - Your script must be executed only when DOM is loaded
  - You must use JQuery
  - Listen for changes on each input checkbox tag:
  - if the checkbox is checked, you must store the Amenity ID in a variable (dictionary or list)
  - if the checkbox is unchecked, you must remove the Amenity ID from the variable
  - update the h4 tag inside the div Amenities with the list of Amenities checked

 ## 3. Update the API entry point (api/v1/app.py) by replacing the current CORS CORS(app, origins="0.0.0.0") by CORS(app, resources={r"/api/v1/*": {"origins": "*"}}).

#### Change the route 1-hbnb to 2-hbnb in the file 2-hbnb.py (based on 1-hbnb.py)

Create a new template 2-hbnb.html (based on 1-hbnb.html) and update it:

- Import the JavaScript static/scripts/2-hbnb.js in the <head> tag (instead of 1-hbnb.js)
- Add a new div element in the header tag:
- Attribute ID should be api_status
- Align to the right
- Circle of 40px diameter
- Center vertically
- At 30px of the right border
- Background color #cccccc
- Also add a class available for this new element in web_dynamic/static/styles/3-header.css:
- Background color #ff545f


#### Write a JavaScript script (static/scripts/2-hbnb.js):
- Based on 1-hbnb.js
- Request http://0.0.0.0:5001/api/v1/status/:
  - If in the status is “OK”, add the class available to the div#api_status
  - Otherwise, remove the class available to the div#api_status

#### To start the API in the port 5001:
$ HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db HBNB_API_PORT=5001 python3 -m api.v1.app


## 4. 
