import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ArtisanSPFirebaseUser {
  ArtisanSPFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ArtisanSPFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ArtisanSPFirebaseUser> artisanSPFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ArtisanSPFirebaseUser>(
        (user) => currentUser = ArtisanSPFirebaseUser(user));
