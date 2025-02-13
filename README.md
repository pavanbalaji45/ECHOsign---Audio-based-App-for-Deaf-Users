# ECHOsign---Audio-based-App-for-Deaf-Users

ECHOsign is an audio-based mobile application designed to assist deaf users in identifying household sounds. The app records ambient sounds, processes them through a machine learning API, and classifies them into predefined categories. The app then notifies users with the predicted class, helping them understand and recognize various sounds around them.

Built with Flutter, Firebase, GetX, Hive, and ML, this app leverages modern technologies to provide a user-friendly experience.


Features
Sound Recording: The app records household sounds to detect audio events in real-time.
Machine Learning: It utilizes a machine learning API to classify recorded sounds into one of 10 categories from an urban sound dataset.
Local Notifications: Users are notified about the detected sound classification using push notifications.
Firebase Integration: The app uses Firebase for backend services and data storage.
Local Storage: The app stores audio-related data and session information locally using Hive.

Technologies Used
Flutter: The app is built using Flutter to ensure cross-platform compatibility (iOS and Android).
Firebase: Firebase is used for app initialization and backend services.
Hive: A lightweight key-value database for local data storage.
GetX: A state management solution for Flutter to handle navigation and app state efficiently.
Machine Learning API: The app integrates with a machine learning model to classify sounds into different categories.
Flutter Local Notifications: A plugin to handle notifications within the app.
Permission Handler: Used to manage user permissions, including notification and microphone access.


Project Structure
The project consists of the following main components:

main.dart: The entry point of the app, where Firebase and necessary services are initialized.
firebase_options.dart: Contains the Firebase configuration settings for different platforms.
app_routes.dart: Defines the app's routing and navigation logic.
theme.dart: Contains the theme and styling configurations for the app.
flutter_local_notifications.dart: Handles notification logic.
permission_handler.dart: Manages app permissions like microphone and notifications.


Permissions
Microphone Permission: The app requires microphone access to record sounds.
Notification Permission: The app requires permission to show notifications to the user.
Contributing
Feel free to fork the repository and submit pull requests. If you find any issues or bugs, feel free to open an issue. Contributions, suggestions, and bug reports are always welcome. 
@pavanbalaji45 @manoj-narasimha 


