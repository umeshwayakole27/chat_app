# Chat App - Flutter

A performant, real-time chat application built with Flutter 3, Firebase, and clean architecture.

## Features

- ✅ Email/Password Authentication
- ✅ Real-time messaging with Firestore
- ✅ Message editing and deletion
- ✅ Offline support with unlimited caching
- ✅ Clean architecture with Riverpod state management
- ✅ Material 3 UI with dark mode support
- ✅ Optimized for Android (74% APK size reduction)

## Tech Stack

- **Framework:** Flutter 3
- **State Management:** Riverpod
- **Backend:** Firebase (Auth, Firestore)
- **Navigation:** go_router
- **Architecture:** Clean Architecture

## Prerequisites

- Flutter SDK (3.0 or higher)
- Firebase project
- Android Studio / VS Code
- Git

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd chat_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Configuration

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable **Email/Password Authentication**
3. Create a **Firestore Database**
4. Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

5. Update `.env` with your Firebase credentials:

```env
FIREBASE_API_KEY=your_api_key_here
FIREBASE_APP_ID=your_app_id_here
FIREBASE_MESSAGING_SENDER_ID=your_sender_id_here
FIREBASE_PROJECT_ID=your_project_id_here
FIREBASE_STORAGE_BUCKET=your_bucket_here
```

**Where to find these values:**

- Go to Firebase Console → Project Settings → Your apps
- Select your Android app (or create one)
- Copy the values from the configuration

### 4. Firestore Security Rules

Copy firestore rules from firestore.rules and apply these rules in Firebase Console → Firestore → Rules:

### 5. Run the App

```bash
# Debug mode
flutter run

# Release mode
flutter run --release
```

## Project Structure

```
lib/
├── core/
│   ├── constants/      # App-wide constants
│   ├── router/         # Navigation configuration
│   └── theme/          # App theming
├── data/
│   ├── models/         # Data models
│   └── repositories/   # Repository implementations
├── domain/
│   ├── entities/       # Business entities
│   └── repositories/   # Repository interfaces
└── presentation/
    ├── providers/      # Riverpod providers
    ├── screens/        # UI screens
    └── widgets/        # Reusable widgets
```

The app uses `flutter_dotenv` for environment configuration. Never commit `.env` to version control.

**Required variables:**

- `FIREBASE_API_KEY`
- `FIREBASE_APP_ID`
- `FIREBASE_MESSAGING_SENDER_ID`
- `FIREBASE_PROJECT_ID`
- `FIREBASE_STORAGE_BUCKET`
