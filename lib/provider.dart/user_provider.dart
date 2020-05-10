import 'package:fashionapp/db/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

enum Status {Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier{
 FirebaseUser _user;
 FirebaseAuth _auth;
 Status _status = Status.Uninitialized;
 UserServices _userServices = UserServices();
Status get status => _status;
    FirebaseUser get user => _user;


 UserProvider.initalize(): _auth = FirebaseAuth.instance{
   _auth.onAuthStateChanged.listen(_onStatusChanged);

    }

Future<bool> signIn(String email, String password) async{
  try{
    _status = Status.Authenticating;
  notifyListeners();
  await _auth.signInWithEmailAndPassword(email: email, password: password);
  return true;
  }catch(e){
    _status = Status.Unauthenticated;
    notifyListeners();
    print(e.toString());
    return false;
  }
}

Future<bool> signUp(String name,String email, String password) async{
  try{
    _status = Status.Authenticating;
  notifyListeners();
  await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
    Map<String, dynamic> values = {
      "name": name,
      "email":email,
      "userId":user.user.uid,

    };
    _userServices.createUser(values);
  });
  return true;
  }catch(e){
    _status = Status.Unauthenticated;
    notifyListeners();
    print(e.toString());
    return false;
  }
}

Future signOut() async{
  _auth.signOut();
  _status = Status.Unauthenticated;
  notifyListeners();
  return Future.delayed(Duration.zero);
}
    
   
     Future<void> _onStatusChanged(FirebaseUser event) async{
       if(user == null){
         _status = Status.Unauthenticated;
       }else{
         _user = user;
         _status = Status.Authenticated;
       }
       notifyListeners();
  }
}