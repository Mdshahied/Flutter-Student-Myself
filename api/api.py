# code to run api -------------->>>  python -Xfrozen_modules=off api.py

from flask import Flask
from flask import request
from pymongo import MongoClient
from bson.json_util import dumps
import json
from pymongo import MongoClient
from bson import json_util
from flask import Flask, make_response
from flask_cors import CORS

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
mydatabase = client["clgmyself"]
users = mydatabase["studentid"]
# userDetails = mydatabase["red_drop_users"]
CORS(app)


def rep(__self__):
    # donorDetails.__format__
    mydatabase.__format__


@app.route("/register_user", methods=["POST"])
def registerUser():
    try:
        data = json.loads(request.data)
        firstname = data["firstname"]
        lastname = data["lastname"]
        email = data["email"]
        password = data["password"]
        dup_data = users.distinct("email")
        print(dup_data)
        if email not in dup_data:
            status = users.insert_one(
                {
                    "firstname": firstname,
                    "lastname" : lastname,
                    "email" : email,
                    "password": password
                }
            )
            print(status)
            responseData = {"Flag": "T", "Status": "User Created Successfully"}

            response = make_response(responseData)
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers[
                "Access-Control-Allow-Methods"
            ] = "GET, POST, PUT, DELETE, OPTIONS"
            response.headers["Access-Control-Allow-Headers"] = "Content-Type"

            return dumps(responseData)
        else:
            return dumps({"Flag": "F", "Status": "User Already Exists"})
    except Exception as e:
        return dumps({"error": str(e)})


@app.route("/get_user", methods=['GET'])
def get_all_user():
    try:
        user = users.find()
        return dumps(user)
    except Exception as e:
        return dumps({'error': str(e)})


@app.route("/get_user_detail/<name>", methods=['GET'])
def get_user_detail(email):
    try:
        x = users.find_one({"email": email})
        return dumps(x)
    except Exception as e:
        return dumps({'error': str(e)})
    

@app.route("/login", methods=["POST"])
def login():
    try:
        data = json.loads(request.data)
        email = data["email"]
        password = data["password"]
        x = users.find_one({"email": email})

        if x and x["password"] == password:
            responseData = {"Flag": "T", "Status": "Logged In Successfully"}
            response = make_response(responseData)
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers[
                "Access-Control-Allow-Methods"
            ] = "GET, POST, PUT, DELETE, OPTIONS"
            response.headers["Access-Control-Allow-Headers"] = "Content-Type"
            return dumps(responseData)
        else:
            return dumps({"Flag": "F", "Status": "User Detail Not Found"})

    except Exception as e:
        return dumps({"error": str(e)})

@app.route("/")
def home():
    return "Welcome!"


if __name__ == "__main__":
    app.run(
        debug=True,
        host="192.168.249.130",
        port=5000,
    )

