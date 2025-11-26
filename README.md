# Capstone Login UI

## Project Description
**Capstone Login UI** is a beginner-friendly Flutter project that demonstrates a **Simple Login UI** with local validation.  
The app allows users to enter an email and password, validates the input locally, and navigates to a Welcome screen.  
This project is designed for learning Flutter basics, including forms, validation, navigation, and responsive layouts.

---

## Key Features
- Email and password fields with validation  
- Obscured password toggle  
- Loading indicator on login attempt  
- Navigation to a Welcome screen with user email displayed  
- Responsive design for desktop, web, and mobile  
- Example dialogs for "Forgot password?" and test credentials

---

## Technologies Used
- Flutter SDK  
- Dart programming language  
- VS Code or Android Studio (recommended editors)  
- Android Emulator / iOS Simulator / Windows Desktop support  

---

## Installation Requirements
Before running the project, make sure you have:
- Flutter SDK ≥ 3.x installed  
- JDK 11+ (Windows/Linux)  
- VS Code or Android Studio installed with Flutter/Dart extensions  
- Android Emulator / iOS Simulator / Desktop support enabled  

---

## Installation Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/CarribeanVickie/CAPSTONE-PROJECT.git
   cd login_demo


## Fetch dependencies:
flutter pub get


## Run the app on your preferred platform:
Android Emulator:
        flutter run -d <device-id>
Windows Desktop:
        flutter config --enable-windows-desktop
        flutter run -d windows
Web (Chrome/Edge):
        flutter run -d chrome
        
## Usage
Enter a valid email (e.g., test@example.com)
Enter a password (minimum 6 characters)
Press Login
Successful login navigates to the Welcome screen
Extra buttons:
        Forgot password? – shows an info dialog
        Need test credentials? – shows a snackbar with instructions

## Configuration Options
Responsive layout automatically adapts to screen width
Text theme updated for Flutter 3.x+
No backend configuration is needed; all validation is local

## Troubleshooting
headline6 errors: Update to titleLarge in Theme.of(context).textTheme
Emulator not starting: Restart ADB or check Android Studio setup
PATH issues: Ensure Flutter bin is added to environment PATH
Pubspec errors: Check indentation and run flutter pub get
Desktop build fails: Enable desktop with flutter config --enable-windows-desktop

## Contributing Guidelines
Contributions are welcome! To contribute:
1. Fork the repository
2. Create a feature branch:
        git checkout -b feature/your-feature-name
3. Make changes and commit:
        git commit -m "Add your feature description"
4. Push to branch and submit a Pull Request


## License
This project is released under the MIT License – free to use for learning and capstone purposes.

## Code Structure Overview
login_demo/
│
├── lib/
│   └── main.dart        # Main application code
├── pubspec.yaml          # Dependencies and Flutter configuration
└── README.md             # Project documentation

lib/main.dart: Contains all UI code including login screen, validation logic, and welcome screen
pubspec.yaml: Lists dependencies and Flutter SDK configuration
README.md: Documentation and project overview
---

   