import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_network/src/services/service.dart';

import '../models/User.dart';
import '../utils/firebase.dart';

class UserServices extends Service{
  String currentUid(){
    return firebaseAuth.currentUser!.uid;
  }

  setUserStatus(bool isOnline){
    var user = firebaseAuth.currentUser;
    if(user != null){
      userRef.doc(user.uid).update({
        'isOnline':isOnline,
        'lastSeen': Timestamp.now()
      });
    }
  }

  updateProfile({File? image,String? username, String?bio,String? country})async{
    DocumentSnapshot doc= await userRef.doc(currentUid()).get();
    var user = User.fromJson(doc.data() as Map<String,dynamic>);
    user.username= username;
    user.bio = bio;
    user.country = country;
    if(image != null){
      user.photoUrl = await uploadImage(profilePic, image);
    }
    await userRef.doc(currentUid()).update({
      'username':username,
      'bio':bio,
      'country':country,
      'photoUrl':user.photoUrl ?? ''
    });
    return true;
  }
}