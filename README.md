## Frontend
---

## Repository
Repository: Facepro

Path: https://github.com/shaomei2023/facepro
      
## My environment
Operating System for Development (Dev OS): Windows

Development Tools (Dev Tool): Android Studio

Programming Languages and Libraries: Dart, Flutter, Dio, Camera

Target Operating System (Target OS): Android   

## Steps of Deployment 
1. Clone the "facepro" repository to your local machine.
2. Add "facepro" to your Android Studio project and open it.
3. Connect your computer and phone using a USB data cable, ensuring that the "Developer options" and "USB debugging" are enabled on your phone. If the connection is successful, you should see your phone's information in Android Studio's device manager.
4. In the "picture.dart" file, find the line that says "String url = 'http://168.138.12.115:8000/upload';" and replace the address with your IP address. Save the file. If you want to use a different port, make sure to modify the port in the "facepro.py" file as well.
   Note: Due to time constraints, the IP address and port are currently specified directly in these files. In the future, I will consider moving these configurations into a configuration file.
5. In Android Studio, click the green play button to run the frontend program "main.dart".
6. Now, the facepro app will be installed on your mobile device and You can use the app without the need for a USB data cable connection.

