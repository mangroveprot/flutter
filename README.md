# noteapp_clean_architecture

A new Flutter project.

## Getting Started

This guide will walk you through setting up Firebase for your Flutter project.

**1. Create a Firebase Project**

- Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
- Configure and create a Firestore database within your project.

**2. Install Firebase CLI (if you haven't already)**

- Open your terminal and run:

  ```bash
  npm install -g firebase-tools
  ```

**3. Log in to Firebase CLI**

- In your terminal, run:

  ```bash
  firebase login
  ```

- This will open a browser window to authenticate your Google account. Make sure you log in with the same email you used to create your Firebase project.

- If its not the same email then log out

  ```bash
   firebase logout
  ```

**4. Activate FlutterFire CLI**

- In your terminal, run:

  ```bash
  flutter pub global activate flutterfire_cli
  ```

**5. Configure FlutterFire**

- In your Flutter project directory, run:

  ```bash
  flutterfire configure
  ```

- This will:
  - Prompt you to choose the Firebase project you created.
  - Prompt you to select the platforms you want to support (Android, iOS, Web, macOS, Windows, Linux).
  - Generate the necessary `firebase_options.dart` file in your project.

**6. Add Firebase Core Dependency**

- In your Flutter project directory, run:

  ```bash
  flutter pub add firebase_core
  ```

**7. Add Cloud Firestore Dependency**

- In your Flutter project directory, run:

  ```bash
  flutter pub add cloud_firestore
  ```

**8. Initialize Firebase in your `main.dart`**

- Open your `main.dart` file and add the following code within your `main()` function:

  ```dart
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase_options.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  }
  ```

# BLoC Need To Know

## state

`state` - a state represents the current condition of your app at a given moment.

```dart
      BlocBuilder<NotesBloc, NotesState>(
    builder: (context, state) {
      if (state is NotesInitial) {
        return Text("Welcome! Load your notes.");
      } else if (state is NotesLoading) {
        return CircularProgressIndicator(); // ⏳ Show loading
      } else if (state is NotesLoaded) {
        return ListView.builder(
          itemCount: state.notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.notes[index].title),
              subtitle: Text(state.notes[index].content),
            );
          },
        );
      } else if (state is NotesError) {
        return Text("Error: ${state.message}"); // ❌ Show error
      } else {
        return Text("No notes available.");
      }
    },
  );
```

## emit()

`emit()` - is used inside event handlers to update the state of the BLoC.

### Example:

```dart
    on<LoadNotes>((event, emit) async {
      emit(NotesLoading()); // Set the state to NotesLoading
      try {
        //Get each note in getnotes
        await for (var notes in getNotes()) {
          // Set the state to NotesLoaded
          emit(NotesLoaded(notes));
        }
      } catch (e) {
        //Set the state to NOtesError
        emit(NotesError(e.toString()));
      }
    });
```
