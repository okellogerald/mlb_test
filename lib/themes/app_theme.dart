import 'package:mlb_test1/source.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      fontFamily: 'Stratos',
      iconTheme: const IconThemeData(color: AppColors.onPrimary),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme:
          const AppBarTheme(backgroundColor: AppColors.primary, elevation: 0),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.disabled,
          elevation: 2));
}
