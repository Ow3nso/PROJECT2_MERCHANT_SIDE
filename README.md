# Dukastax Mobile Application

This README guides you through setting up, running, and using the Dukastax mobile application.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Requirements](#requirements)
3. [Setup Guide](#setup-guide)
4. [Running the App](#running-the-app)
5. [Troubleshooting](#troubleshooting)

---

## Project Overview

The Dukastax Flutter application is designed to run on both iOS and Android.

---

## Requirements

To set up and run this Flutter app, you’ll need:
1. **Flutter SDK**: Install the latest stable version from [flutter.dev](https://flutter.dev).
2. **Emulator or Device**: An Android emulator, iOS simulator, or a physical device for testing.
3. **Backend Server**: A Django server must be running to provide data to the app (instructions provided in the Django backend README).
4. **Flutter Packages**: Packages and plugins for additional functionality will be installed during setup.

---

## Setup Guide

### 1. Clone the Project

Clone the project repository to your local machine:
```bash
git clone <project-repo-url>
cd <project-folder>
```
### 2. Install dependencies 

Navigate to the each package folder of the Flutter application and install dependencies. Example:
```bash
cd auth_pkg
flutter pub get
```

### 3. Verify flutter installation

Ensure that your Flutter installation is complete and all necessary components are installed by running:
```bash
flutter doctor
```

### 4. Running the app

This will launch the app on an emulator or connected device.
```bash
flutter run --flavor dev lib/main.dart
```
---

## Troubleshooting

1. **Cannot connect to backend**: Ensure that the backend server is up and running correctly.
2. **Flutter build issues**: Run flutter doctor to confirm that all required dependencies are installed.



