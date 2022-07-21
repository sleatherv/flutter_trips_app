import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  //Data Flow
  //Stream Firebase
  //StreamController
  Stream<User?> stremFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => stremFirebase;

  //Use cases
  //Sign in will be general
  Future<UserCredential> signIn() async {
    return await _authRepository.signInFirebase();
  }

  //Sign Out
  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
