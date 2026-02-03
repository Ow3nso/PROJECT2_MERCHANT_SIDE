# Project Setup with FVM, Flutter 3.19.6 & Flavors

This project is managed using **FVM (Flutter Version Management)** and requires a specific Flutter SDK version.  
You must use **Flutter 3.19.6 via FVM** and run the app using the available flavors: `dev` or `prod`.

---

## ✅ Prerequisites

- **FVM (Flutter Version Management)**
  - Install with:
    ```bash
    dart pub global activate fvm
    ```
  - Or via Homebrew (macOS/Linux):
    ```bash
    brew tap leoafarias/fvm
    brew install fvm
    ```

- **Flutter SDK**
  - Version: **3.19.6 (managed by FVM)**

---

## 📦 Setup Instructions

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd <your-project-folder>/lukhu_main
Install the required Flutter version with FVM:

bash
Copy code
fvm install 3.19.6
fvm use 3.19.6
Verify Flutter version (via FVM):

bash
Copy code
fvm flutter --version
Get dependencies:

bash
Copy code
fvm flutter pub get
🚀 Running the App with Flavors
This project supports two flavors:

dev – Development environment

prod – Production environment

▶ Run Dev Flavor
bash
Copy code
fvm flutter run --flavor dev -t lib/main.dart
▶ Run Prod Flavor
bash
Copy code
fvm flutter run --flavor prod -t lib/main.dart
