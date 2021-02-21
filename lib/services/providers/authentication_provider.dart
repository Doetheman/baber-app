import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:push/services/firestore.dart';

class AuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future createUserWithEmailAndPassword({
    @required String email,
    @required String password,
    @required String displayName,
    @required String username,
    @required String phoneNumber,
    @required int avatarColorIndex,
  }) async {
    final UserCredential authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return _setUser(
          authResult.user,
          displayName: displayName,
          username: username,
          avatarColorIndex: avatarColorIndex,
          phoneNumber: phoneNumber,
        );
      }
    
      Future<void> sendPasswordResetEmail(String email) async {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      }
    
      Stream<DocumentSnapshot> currentUser() {
        //final FirebaseUser user = await _firebaseAuth.currentUser();
        Stream<DocumentSnapshot> doc =
            FirestoreService.instance.fetchDocumentStream(
          documentPath: "_username",
          collectionPath: 'users',
        );
    
        return doc;
      }
    
      Future<void> signOut() async {
        return await _firebaseAuth.signOut();
      }
    
      Future _setUser(User user, {String displayName, String username, int avatarColorIndex, String phoneNumber, searchCases}) {}
}
