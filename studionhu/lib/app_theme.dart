import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // 3
  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme.light(),
      textTheme: lightTextTheme,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: Colors.white,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(color: Colors.green);
          }
          return const TextStyle(color: Colors.black);
        }),
        iconTheme: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Colors.green);
            }
            return const IconThemeData(color: Colors.black);
          },
        ),
      ),
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(),
      textTheme: darkTextTheme,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: Colors.black,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(color: Colors.green);
          }
          return const TextStyle(color: Colors.white);
        }),
        iconTheme: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Colors.green);
            }
            return const IconThemeData(color: Colors.white);
          },
        ),
      ),
    );
  }

  // studioNhu theme
  static ThemeData studioNhu() {
    return ThemeData(
      colorScheme: const ColorScheme.light(),
      textTheme: lightTextTheme,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 141, 170, 130),
        // backgroundColor: Colors.red,
        foregroundColor: Color.fromARGB(255, 10, 2, 119),
        centerTitle: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: Colors.white,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(color: Colors.green);
          }
          return const TextStyle(color: Colors.black);
        }),
        iconTheme: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Colors.green);
            }
            return const IconThemeData(color: Colors.black);
          },
        ),
      ),
    );
  }
}
      /*
       * Định nghĩa tất tần tật hiển thị của App.
       * Chúng ta không cung cấp ThemeData thì app sẽ sử dụng Theme mặc định
       * Muốn tùy biến thì ta xét thuộc tính cần tùy biến.
       * Thông thường ta dùng tùy biến cho ứng dụng.
       * Những widget con của MaterialApp điều có thể truy xuất được
       */
      //   ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      /**
           * colorScheme định nghĩa tập 30 màu của app.
           * để chỉnh màu sắc cho tất cả thành phần trong ứng dụng của chúng ta.
           * cấu hình từng phần cụ thể thì phải tìm hiểu sâu hơn
           */
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: Color.fromARGB(255, 141, 170, 130),
      //   foregroundColor: Color.fromARGB(255, 72, 117, 241),
      // ),
      /**
         * Tùy biến cho appBar
         */
      // ),
