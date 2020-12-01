
# Simple Weather
###### Version 1.0 - november 2020

This is a simple weather aplication that shows the weather of the place you currently are along with other informations as wind speed, rain, current moon state and when the sun will be up or down. You can also change between Celsius(°C) and Fahrenheit(°F)

![Gif showing the main features of the app: It starts with the main screen of the phone opening the new weather application, followed by the main screen of the app asking for localization permission. After the permission is granted, it shows where the user is (city and country) and the current degrees in celsius. The bot menu is opened by scrolling up showing more information about the location as the min and max degrees, moon state, humidity and rain probability.](ReadmeFiles/demoNW.gif)



## Table of contents
* [Features](#features)
* [Screenshots](#screenshots)
* [Design](#design)
* [Dark Sky API](#api)

     

<a name="features"></a>
## Features
- Made 100% in **Swift**;
- Using **MVC** Arquitecture;
- **Constraints** to work in different screen sizes;
- **NSUserDefaults** to remember the preference between Celsius(°C) and Fahrenheit(°F)
- API request and json decoded natively using:
    - **URLSession**;
    - **JSONDecoder**;
    - **Codable protocol** for the models;

      

<a name="screenshots"></a>
## Screenshots
![three screen shots. First showing the alert asking for location permission. Second showing the main screen of the app. Third showing the date, current weather and other relevant information as the current state (sunny), min and max temperature, humidity, rain probability, time when the sun rises and when it sets](ReadmeFiles/screens001.png)
![three screen shots. First showing the weather for the next days. Second showing the top menu open with Celsius selected as prefered metric and third showing the top menu open with Fahrenheit selected as prefered metric](ReadmeFiles/screens002.png)

      
  

<a name="design"></a>
## Design
The app idea was designed using **keynote**:
![Screen drawings of the concept of the app.](ReadmeFiles/design.png)
      
      
   

<a name="api"></a>
## Dark Sky API 
To learn more about Dark Sky API [click here](https://darksky.net/dev).
     
Since it uses an ID to identify who is requesting, **you will need to add your own before run the aplication (or it won't work).** It can be easily done by opening the "Contants" class and adding it to the **keyValue** constant, where you can find a comment that says "Add your own key here".

![Screenshots of the code where you need to add your own key for the app to make requisitions using the DarkSkyAPI](ReadmeFiles/KeyScreenshot.png)

