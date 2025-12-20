# Polytecnic_Management_System

--------------------------------------------------------------

A polytechnic management System app , has 4 catagory in it :
* Polytechnic Management,
* Library Management,
* Exam Controller,
* Register/Accounts Management

--------------------------------------------------------------



##   RULES

# For Developers
* Must maintain the app folder structure 
* Store all files in exact folder,
* Use clean and maintainable code,

                            ******* design think  *******
                            
# When design in app from web figma design
# make the web side bar in app drawer
# and all the pop up form use bottomsheet in app 



------------------------------ ARCHITECTURE ---------------------------

*   lib/
*   ├── core/                        # Global and shared code
*   │   ├── constants/               # colors, strings, api_constants
*   │   ├── services/                # ApiService, LocalStorage, AuthService
*   │   ├── theme/                   # AppTheme, TextStyles
*   │   └── widgets/                 # Global common widgets (CustomButton, CustomTextField)
*   │
*   ├── features/                    # main modules and features
*   │   ├── exam_control/
*   │   │   ├── controllers/         # Logic & State (GetX Controllers)
*   │   │   ├── models/              # Data structures
*   │   │   └── views/               # UI Screens & local widgets           
*   │   │
*   │   ├── library_management/           
*   │   │   ├── controllers/
*   │   │   ├── models/
*   │   │   └── views/
*   │   │
*   │   ├── polytechnic_management/
*   │   │   ├── controllers/
*   │   │   ├── models/
*   │   │   └── views/
*   │   │
*   │   └── register_management/
*   │       ├── controllers/
*   │       ├── models/
*   │       └── views/
*   │
*   ├── main_screen/                 # Bottom Navigation or main dashboard
*   │   ├── controllers/
*   │   └── views/
*   │
*   ├── routes/                      # navigation management
*   │   ├── app_pages.dart           # Route definitions (GetPage list)
*   │   └── app_routes.dart          # Route names (static strings)
*   │
*   └── main.dart                    # app entry point
