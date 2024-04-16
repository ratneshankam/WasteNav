class TExceptions implements Exception{

  /// The Associated error message.
  
  final String message;

  const TExceptions([this.message= "An Unknown Exception Occurred."]);

  // create An  Authentication message
  // from a firebase authentication exception code.

  factory TExceptions.fromCode(String code){

    switch(code){

      case 'email-already-in-use':
        return const TExceptions('Email is already exists.');
        
      case 'invalid-email':
        return const TExceptions('Email is not valid or badly formated.');
        
      case 'weak-password':
        return const TExceptions('Email is already exists.');
        
      case 'user-disabled':
        return const TExceptions('Email is already exists.');
        
      case 'user-not-found':
        return const TExceptions('Email is already exists.');
        
      case 'wrong-password':
        return const TExceptions('Email is already exists.');
        
      case 'too-man-requests':
        return const TExceptions('Email is already exists.');
        
      case 'invalid-argument':
        return const TExceptions('Email is already exists.');
        
      case 'invlid-password':
        return const TExceptions('Email is already exists.');
        
      case 'invalid-phone-number':
        return const TExceptions('Email is already exists.');
        
      case 'operation-not-allowed':
        return const TExceptions('Email is already exists.');
        
      case 'session-cookie-expired':
        return const TExceptions('Email is already exists.');
        
      case 'uid-already-exists':
        return const TExceptions('Email is already exists.');
      default:
        return const TExceptions();
        
    }
  }
}