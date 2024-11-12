// Exception class for handling various platform-related errors.
class AppPlatformException implements Exception {
  final String code;

  // Constructor that accepts the error code and give a message
  AppPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The provider user ID is already in use by another user.';
      case 'sign-in-failed':
        return 'Sign-in failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'internal-error':
        return 'Internal error. Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'not-available':
        return 'The requested service is not available on this platform.';
      case 'invalid-credentials':
        return 'Invalid credentials provided. Please try again.';
      case 'network-error':
        return 'Network error. Please check your connection and try again.';
      case 'permission-denied':
        return 'Permission denied for this action.';
      case 'invalid verification-ID':
        return 'Invalid verification ID. Please enter a valid verification ID and try again.';
      case 'storage-full':
        return 'Device storage is full. Free up space and try again.';
      case 'timeout':
        return 'Operation timed out. Please try again.';
      default:
        return 'An unknown platform error occurred. Please try again.';
    }
  }
}
