# 📚 Bookia - Flutter Mobile Application

**Bookia** is a modern, elegantly designed mobile application built with Flutter. It focuses on providing a seamless user experience with complete support for **Light & Dark Themes**, dynamic **Localization**, and a scalable **Clean Architecture** codebase.

---

## 📹 App Demo





https://github.com/user-attachments/assets/cecd576b-33aa-4916-a3f2-06b56f8700d8




</div>

---

## ✨ Features

- **🎨 Dynamic Light & Dark Mode:** Smooth switching between light and dark themes using Cubit, with user selection persistent across app restarts.
- **🌐 Localization Support:** Multi-language support (Arabic & English) via `easy_localization` with automatic text direction (RTL / LTR) handling.
- **📱 Responsive UI:** Fully adaptive layouts across all mobile screen sizes powered by `flutter_screenutil`.
- **⚡ Auto-Generated Code:** Automated generation of assets, fonts, and localization keys using `flutter_gen`.
- **🚀 Native Splash Screen:** Custom native splash screen integrated for both Android and iOS.
- **🔀 Centralized Dynamic Routing:** Organized screen navigation managed through `onGenerateRoute`.
- **🛠️ Custom Dart Extensions:** Handcrafted BuildContext extensions for concise navigation and theme/localization access.
- **💾 Local Persistence:** Saving user theme preferences locally using `SharedPreferences`.
- **💾 dependency injection getit.

---

## 🏗️ Architecture & Project Structure

The project follows **Clean Architecture** principles structured by **Feature-First** organization to ensure scalability, testability, and maintainability:

```text
lib/
├── common_widgets/          # Shared reusable widgets (buttons, fields, headers)
├── core/                    # App-wide essentials
│   ├── constants/           # Keys, constants, and color definitions
│   ├── helper/              # Context extensions and utility functions
│   ├── routing/             # Dynamic router & route generation logic
│   ├── services/            # Local storage service (SharedPreferences)
│   └── theme/               # Light/Dark ThemeConfig & ThemeCubit
├── features/                # Application Features
│   ├── auth/                # Authentication Feature (Login, Register, Welcome)
│   │   ├── data/            # Repositories & Use Cases
│   │   └── presentation/    # Screens & Feature-specific Widgets
│   └── home_screen/         # Home Feature
│       ├── data/
│       └── presentation/
├── gen/                     # Auto-generated code (Assets, Fonts, Localization Keys)
├── main.dart                # Application entry point & service initialization
└── my_app.dart              # MaterialApp setup & global BlocProviders

& "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe" uninstall com.example.bookia
