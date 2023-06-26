
# Adya Health Flutter Assignment!

Design and implement a non-linear video session system using Flutter framework that provides interactive elements to the user, allowing them to make decisions that will dynamically impact the later parts of the video.

### Deliverables:
- Flutter Application- Develop a Flutter application that incorporates the non-linear video session system with playback functionality. It should allow users to control their journey- play, pause, move freely to any moment in the video, and flexibility to change their interactive decisions/choices.
- Documentation- Provide comprehensive documentation that includes installation instructions, system architecture, and guidelines for using and modifying the Flutter application.

### Linear Video Demo [Given with the Problem Statement]:
https://app.adya.care/user/i

### Process
- Used ChatGPT for the assignment video script.
- Using pyttsx3 package in package, generated audio files from the script.
- Merge the audio Files with a soothing nature video using online tool.
- Upload all the video assets on github. The link for the video can be found [here](https://github.com/YashMakan/adya_assignment_videos/).
- Thought about the logical implementation. Used the graph data structure to represent each stage as `VideoNode`.
- Created the flutter project, designed the minimal viable product and implemented the logic.
- Created a readable documentation to guide the reader.

### Aditional Efforts
Besides adding a button grid, I have also implemented the logic for textfield. The entire flow can be changed by changing the `mock_response.dart` file. Here, the `Map<String, dynamic>` is defined which shows the graph representation of all the video screens. The screens will change based on the user choices making the flow non linear.

### App Installation (.apk)
The application is hosted on the same github repository as of the videos. The apk can be installed by visiting [here](https://github.com/YashMakan/adya_assignment_videos/raw/master/app.apk).

### Installation
- The project is developed using `windows 10` with Flutter 3.7.6. This flutter version can be download from [here](https://docs.flutter.dev/get-started/install).
- Using`git clone` the project can be cloned in the system.
- After cloning, run flutter pub get to get the project dependencies.
- After getting dependencies, the project can run by `flutter run` .
PS: I have used Android Studio IDE. If you face any difficulties while installing or any other process, then please let me know.

### State Management
The project uses `provider` state management to manage the state the application. The class `NonLinearVideoController` is used where all the necessary information like currentVideoNode etc is stored.

## Authors

- [@YashMakan](https://www.github.com/YashMakan)

