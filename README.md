# **Submission 4 - Football Club App (Swift / iOS)**

Football Club app uses data from TheSportsDB (open API) and presents the information to the client. This project is built on Swift for iOS and using the same principle of the Kotlin version. 

### **Objectives**
These are the objectives of this project:
1. Same as Submission 3 - Football Club App (Swift / iOS) project.
2. Implementing Xcode Unit Test and UI Test

### **Prerequisites**
These are the prerequisites before you try to read (and understand) this project:
1. You have some basic experiences in building iOS app.
2. You are familiar with Swift programming language, at least Swift 4.0. 
3. You are familiar with the CocoaPods, one of the most popular dependency manager for iOS project.
4. You are familiar with Alamofire, SwiftyJSON, and Kingfisher. We are going to use those third party library in this project.
4. You are recommended to understand the concept of UITableView dan UITableViewCell in iOS.
5. You are familiar with the concept of Model-View-Controller design pattern and Model-View-Presenter design pattern as well.

### **Project Overview**
This is what you can expect from this project:

![Screenshot][1]

The main page consists of a UITableView and a UISegmentedControl with 3 segments, and the cell consists of 5 UILabels to show Home Team name, Home Team score, Away Team name, Away Team score, and the date. First segment will present 15 last event, second segment will present 15 next event, and the third segment will present all saved event.

The detail page will show the detail information about the score of each team, the goal scorer, the team lineup of each team, as well as team badge image for each team. Now it has "Star" to save the event, and "Unstar" to delete the event from the Core Data.

### **What Will You Learn**
These are all about what you will learn from this project:
#### **Model-View-Presenter (MVP) Design Pattern**
These are main components of MVP design pattern: 
- **_Model_** : Represent the model of your data. In this project, we will create an **Event** model that contains 25 different informations from the server.
- **_View_** : Represent the view of your app. This view may be vary, it can be class for a ViewController, class for a UITableViewCell, or even an Xib file.
- **_Presenter_**: Represent the process of how to present the data from the server (in this case, from TheSportsDB API) to the client.
- **_Controller_**: In MVP design pattern, **Controller** still exist of course, but its function is minimalized. Note that you split all the way the View, Model, and Presenter class, the Controller class can be thinned up, significantly.

#### **Service Class**
Every class in a project have to do only a specific job, and so does **Service** class. This class is created to get data from the server, create object based on the **Model** class, and then transfer the object to the **Presenter**.

#### **Core Data**

Core Data is a data persistance, to save a data as an object. Core Data is built-in on the latest Apple platform development, so you can persist your data easily, without cumbersome additional setup.

### **Author**

* **[Aji Saputra Raka Siwi][2]**

This project is free and open. You can participate to this project to make even more better for everybody to learn.

### **License**
This project is licensed under the GNU General Public License v3.0 - see the [**LICENSE.md**][3] file for details.

[1]:	https://github.com/Ajisaputrars/Submission-4-Football-Match-Schedule-App-Swift-iOS/blob/master/IMG.png
[2]:	https://github.com/Ajisaputrars
[3]:	https://github.com/Ajisaputrars/Submission-4-Football-Match-Schedule-App-Swift-iOS/blob/master/LICENSE