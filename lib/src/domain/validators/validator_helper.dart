abstract class Validator {
  static String? emailAddress({
    String? value,
    String? errMessage,
  }) {
    try {
      final emailRegex =
          RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
      if (!emailRegex.hasMatch(value!)) {
        return errMessage ?? 'Email tidak valid';
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static String? password({
    required int length,
    String? value,
    String? errMessage,
  }) {
    if (value == null || value.length < length) {
      /// Add if condition have minimal char
      return errMessage ?? 'Password minimal 6 karakter';
    }

    /// Check if string has uppercase and lowercase characters
    if (!RegExp(r'[A-Z]').hasMatch(value) ||
        !RegExp(r'[a-z]').hasMatch(value)) {
      return errMessage ??
          'Password anda tidak mengandung Uppercase atau Lowercase';
    }

    return null;
  }
}
