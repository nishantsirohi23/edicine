import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

class Authentification {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential

    return await FirebaseAuth.instance.signInWithCredential(credential);



  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
  void writeNewPost(String uid, String username, String picture, String title,
      String body) async {
    // A post entry.
    final postData = {
      'author': username,
      'uid': uid,
      'body': body,
      'title': title,
      'starCount': 0,
      'authorPic': picture,
    };

    // Get a key for a new Post.
    final newPostKey =
        FirebaseDatabase.instance.ref().child('posts').push().key;

    // Write the new post's data simultaneously in the posts list and the
    // user's post list.
    final Map<String, Map> updates = {};
    updates['/posts/$newPostKey'] = postData;
    updates['/user-posts/$uid/$newPostKey'] = postData;

    return FirebaseDatabase.instance.ref().update(updates);
  }
}