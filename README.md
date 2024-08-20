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

## 1 Write a script that starts a Flask web application:

- Based on web_flask, copy: web_flask/static, web_flask/templates/100-hbnb.html, web_flask/__init__.py and web_flask/100-hbnb.py into the web_dynamic folder
- Rename 100-hbnb.py to 0-hbnb.py
- Rename 100-hbnb.html to 0-hbnb.html
- Update 0-hbnb.py to replace the existing route to /0-hbnb/
- If 100-hbnb.html is not present, use 8-hbnb.html instead
- One problem now is the asset caching done by Flask.
  - To avoid that, you will add a query string to each asset:
  - In 0-hbnb.py, add a variable cache_id to the render_template. The value of this variable must be an UUID (uuid.uuid4())
  - In 0-hbnb.html, add this variable cache_id as query string to each <link> tag URL
