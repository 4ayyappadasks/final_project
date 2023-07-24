import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class helper {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  get user => firebaseAuth.currentUser;
  //var verificationId = "".obs;

  // void phoneAuthentication(String? phoneNo)async
  // {
  //   await firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: phoneNo,
  //       verificationCompleted: (credential)
  //       async {
  //         await firebaseAuth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (e)
  //       {
  //         if(e.code=="invalid-phone-number")
  //           {
  //             Get.snackbar("Error", "provided phone no is no valid");
  //           }
  //         else
  //           {
  //             Get.snackbar("Error", "try again later");
  //           }
  //       },
  //       codeSent:  (verificationId,resendToken)
  //       {
  //         this.verificationId.value = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (verificationId)
  //       {
  //         this.verificationId.value = verificationId;
  //       });
  // }

//   Future<bool> verifyotp(String otp)
//   async {
//     var credential = await firebaseAuth.signInWithCredential(PhoneAuthProvider.credential(
//         verificationId: this.verificationId.value,
//         smsCode: otp));
//     return credential.user!=null?true:false;
// }

  Future<String?> SignUP({required String email, required String password}) async
  {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return null;
    }on FirebaseException catch (e)
    {
      return e.message;

    } catch (e) {
      print(e);
    }
  }

  Future<String?> SignIn({required String email, required String password})async
  {
    try
    {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch(e)
    {
      return e.message;

    } catch (e) {
      print(e);
    }
  }


  Future<String?> SignOut()async
  {
    await firebaseAuth.signOut();
  }
}