class SignUpWhithEmailAndPasswordFailure {

  final String message;
  const SignUpWhithEmailAndPasswordFailure([this.message = "An Unknow error occurred."]);

  factory SignUpWhithEmailAndPasswordFailure.code(String code){
    switch (code) {
      case 'weak-password':
        return const SignUpWhithEmailAndPasswordFailure('Please enter a stronger password');
      case 'invalid-email':
        return const SignUpWhithEmailAndPasswordFailure('Email is not valid or badly formated.');
      case 'email-already-in-use':
        return const SignUpWhithEmailAndPasswordFailure('An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignUpWhithEmailAndPasswordFailure('Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWhithEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');
      default: 
        return const SignUpWhithEmailAndPasswordFailure();
    }
  }
  
}