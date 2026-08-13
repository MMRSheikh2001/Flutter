
class ApiConstants {

  ApiConstants._();

  /// Base API URL — same host Angular's `environment.apiUrl` pointed to.

  static const String baseUrl = 'http://localhost:8090/api/';

  /// Base URL for served images (customer/agent/rider profile photos etc.)
  /// Mirrors Angular's `environment.imgUrl`.
  static const String imgUrl = 'http://localhost:8090/images/';

// ── Auth ───────────────────────────────────────────────
  static const String login = 'auth/login';
  static const String forgotPassword = 'auth/forgot-password';
  static const String resetPassword = 'auth/reset-password';
  static const String verifyEmail = 'auth/verifyemail';

}