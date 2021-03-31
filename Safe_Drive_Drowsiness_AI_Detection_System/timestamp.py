import firebase_admin
from firebase_admin import credentials
from google.cloud import firestore
from firebase_admin import credentials, firestore
import time
from datetime import datetime 
import datetime
import os
import sys
import pyrebase


cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
date = datetime.datetime.now()

firebaseConfig = {  'apiKey': "AIzaSyD8bpVvcHKT-6iuQ1YzC65tSodV78eTbcg",
                    'authDomain': "dd-authentications.firebaseapp.com",
                    'databaseURL': "https://dd-authentications-default-rtdb.firebaseio.com",
                    'projectId': "dd-authentications",
                    'storageBucket': "dd-authentications.appspot.com",
                    'messagingSenderId': "595375688543",
                    'appId': "1:595375688543:web:7ce235004c3edec46b84ea",
                    'measurementId': "G-6C61Z16KJX"}

firebase=pyrebase.initialize_app(firebaseConfig)
auth=firebase.auth()


print("Log in...")
email=input("Enter email: ")
password=input("Enter password: ")
try:
    login = auth.sign_in_with_email_and_password(email, password)
    print("Successfully logged in!")
    user = auth.get_account_info(login['idToken'])
    userId = auth.get_account_info(login['idToken'])['users'][0]['localId']
    email = auth.get_account_info(login['idToken'])['users'][0]['email']
    print(userId)
except:
    print("Invalid email or password")
    

def timeStamp():
    return db.collection('timestamps').add({'email': email, 'uid':userId, 'date': date.strftime("%x"), 'time':date.strftime("%X")})
timeStamp()

