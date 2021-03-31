# SAFE DRIVE Drowsineess AI Detection System
The system sounds an alarm when it detects that the driver is getting drowsy by monitoring yawning detection, eyes monitoring, and head positioning so that the driver can take immediate action to avoid a collision. 

# SAFE DRIVE Mobile Application(drowsiness_detector) 
SAFE DRIVE Mobile Application provides a standard drowsiness report on a driver’s cell phone by transmitting the driver's alertness status, the date, and time to a data-streaming platform for data processing that could provide evidence of drowsy driving.

## Overview
The 2021 Solution Challenge mission is to solve for one or more of the United Nations 17 Sustainable Development Goals using Google technology.

### Project Demos
SAFE DRIVE - GDSC Solution Challenge 2021 demo can be viewed on YouTube(https://youtu.be/0rn80eauv4Y).

### How the system works

The the user registers on to the flutter mobile application in order to  review the active reports, and after the user is authenticated the system will start its processing by starting the built in web cam to detect the drowsiness state of the person operating  a viehicle using  TenserFlow and Keras model. Then as soon as a persons drowsiness is detected the system returns an alert and records a timestamp right when that alert is generated and this generted timestamp will be directly stored on the firebase. At the same time, the data stored on the firebase will be fetched from the firestore and be displayed on the flutter application so that the user can view the active reports.

### How to run SAFE DRIVE Drowsineess AI Detection System
* pip install -r requirements.txt
* python drowsinessdetection.py
<br/>

### How to run SAFE DRIVE Mobile Application(drowsiness_detector) 
* flutter pub get 
* flutter run

Note the quality may be low due to conversion from video to GIF format. <br/>
# SAFE DRIVE Drowsineess AI Detection System

**Eyes Monitoring** <br/><br/>
<img src="GIF\eye_drowsy.gif" width=65%/>

**Head Positioning** <br/><br/>
<img src="GIF\head.gif" width=65%/>
<img src="GIF\head2.gif" width=65%/>

**Yawning Detection** <br/><br/>
<img src="GIF\yawn.gif" width=65%/>

# SAFE DRIVE Mobile Application(drowsiness_detector)

**Register** <br/><br/>
<img src="GIF\REGISTER.gif" width=65%/>

**Active_Reports** <br/><br/>
<img src="GIF\ACTIVE.gif" width=65%/>


### Architecture

**Languages**
<br/>
- * Python
 	* Dart
   
- Main Framework/Libraries:
 	 *  keras
   *  OpenCV


**Backend**
- TesnorFlow
- Firebase


## Bug Reports and Improvements
If you experience any bugs or see anything that can be improved or added, please feel free to [open an issue](https://github.com/DSC-DBU/SAFE-DRIVE---GDSC-Solution-Challenge-2021/issues) here or simply contact us through any of the methods below. Thanks in advance!

Email:    mariya2k21@gmail.com <br/>
Linkedin: https://www.linkedin.com/in/mariamawit-alemu/ <br/>

Email:    eskewtam12@gmail.com <br/>
Linkedin: https://www.linkedin.com/in/eskinder-tamrat-8844071b6/ <br/>

Email:    eseiteagonafer@gmail.com <br/>
Linkedin: https://www.linkedin.com/in/eseite-agonafer/ <br/>

Email:    mediget920@gmail.com <br/>





