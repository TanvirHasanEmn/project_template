# 🧩 Flutter Project Template

A scalable and production-ready **Flutter project template** built using **MVVM + Clean Architecture** principles.  
This template is designed for **pixel-perfect UI**, **modular code organization**, and **clean state management** using **GetX**.

---

## 🚀 Features

✅ **Clean Architecture (MVVM)** — separation of concerns with `Model`, `View`, and `ViewModel (Controller)`  
✅ **GetX State Management** — reactive UI and dependency injection  
✅ **Pixel Perfect UI** — powered by `flutter_screenutil` for responsive design  
✅ **Modular Folder Structure** — feature-based organization for scalability  
✅ **Reusable Widgets & Utilities** — consistent UI and helper functions  
✅ **Network Layer** — clean API integration with centralized error handling  
✅ **Easy to Extend** — add new features or screens with minimal boilerplate  

---

## 🏗️ Folder Structure

<pre>
lib/
│
├── core/
│   ├── custom_widgets/        → Reusable, app-wide widgets (buttons, inputs, etc.)
│   ├── utilities/             → Constants, extensions, and utility classes
│   ├── network/               → API caller, interceptors, and error handlers
│   ├── helper/                → Shared helper functions and mixins
│   └── global/                → Common configs, themes, fonts, and colors
│
├── features/
│   ├── auth/
│   │   ├── controller/        → ViewModels or GetX controllers for Auth
│   │   ├── data/              → Models, repositories, and data sources
│   │   └── presentation/
│   │       ├── screens/       → Auth-related screens (Login, Register, etc.)
│   │       └── widgets/       → Widgets specific to Auth screens
│   │
│   ├── home/
│   │   ├── controller/
│   │   ├── data/
│   │   └── presentation/
│   │       ├── screens/
│   │       └── widgets/
│   │
│   └── ... (other features)
│
└── main.dart                  → App entry point (bindings, routes, themes)
</pre>

---

## ⚙️ Tech Stack

| Layer | Description |
|-------|--------------|
| **Framework** | Flutter (Dart) |
| **State Management** | GetX / Riverpod| 
| **Responsiveness** | flutter_screenutil |
| **Networking** | http / dio |
| **Architecture** | MVVM + Clean Architecture |
| **Fonts & Design** | Custom Fonts (e.g., Gotham), Pixel-Perfect Layouts |

---

## 🧠 MVVM Flow Overview
<pre>
UI (View)
↓ observes
Controller (ViewModel)
↓ uses
Repository (Data Layer)
↓ calls
Network / Local Data Source
</pre>

Each **feature module** manages its own logic and data.  
UI updates automatically when observable state in the controller changes.

---

## 💎 Design Philosophy

- Maintain **pixel-perfect precision** using `flutter_screenutil`  
- Keep UI logic **separate** from business logic  
- Make every feature **independent and reusable**  
- Avoid duplicated code by using **shared custom widgets**

---

## 🧰 Setup Instructions

<pre>
```bash
# 1. Clone the repository
git clone <your-repo-url>

# 2. Install dependencies
flutter pub get

# 3. Run the project
flutter run
📁 Adding a New Feature

Create a new folder under lib/features/feature_name

Add subfolders:

controller/

data/

presentation/screens/

presentation/widgets/

Connect your routes and bind controllers in app_routes.dart and app_bindings.dart

🧑‍💻 Author

Tanvir Hasan
Mobile App Developer (Flutter)
📱 Focused on clean, scalable, and pixel-perfect app development


 </pre>

