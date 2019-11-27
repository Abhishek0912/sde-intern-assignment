Entry Management System – Flutter App

SDE intern assignment

Approach:

I have approached the problem with a beta framework called flutter. This app might reside on the receptionist’s computer or mobile. The nature of the app will provide  all the versatility needed. Flutter apps can run anywhere with the same codebase. While the web framework is in beta, the android and iOS side of the platform is stable. I have developed this app in android but it can be run on any device in the future with minimum enhancements in the code.

What it can do:

    • Saves the name, email address, phone no of the visitor and same information 	is captured for the host.
    • Once the data is captured, it is stored in the backend.
    • Visitor details are sent to host via SMS and email.
    • On check-out, the details of the meeting are emailed to the visitor.
	(Email and SMS functionality doesn’t work because it needs premium services. 	The 	mock API call has been indicated in code)
    • Check-in time and check-out time are  automatically captured and are not 	required for input.

Technologies:

    • Flutter for Android 
    • Firebase Firestore

Supported Platforms:

Currently works on Android (API>=21) but can run anywhere with little modifications.

How to run?

    • Firebase projects needs to be linked with the app to get the backend working.
    • Connect a virtual or physical device to run the project. 

How does it work?

The visitor and host details are stored in the firebase firestore NoSQL database. The check-in time is not shown as field and is generated using the system time. As the details is pushed to the database, the screen changes and displays all the entered details. When the check-out button is pressed the time is automatically generated and pushed to the database. Mock API calls for SMS and email have been indicated and they are needed to be implemented.
