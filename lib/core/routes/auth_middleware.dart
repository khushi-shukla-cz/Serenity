import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../get_it.dart';
import '../services/auth_service.dart';
import 'app_routes.dart';

/// Middleware to check authentication before accessing protected routes
class AuthMiddleware extends GetMiddleware {
  final _authService = getIt<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    // Check if user is authenticated
    if (!_authService.isLoggedIn()) {
      // Redirect to login page if not authenticated
      return const RouteSettings(name: AppRoutes.login);
    }
    // Allow access if authenticated
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    // Can be used to modify page before it's called
    return super.onPageCalled(page);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // Can be used to add additional bindings
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    // Can be used to wrap page with additional widgets
    return super.onPageBuildStart(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    // Can be used to wrap page with additional widgets
    return super.onPageBuilt(page);
  }

  @override
  void onPageDispose() {
    // Can be used to dispose resources
    super.onPageDispose();
  }
}
