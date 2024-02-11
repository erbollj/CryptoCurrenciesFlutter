import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white24,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
    useMaterial3: true,
    dividerTheme: const DividerThemeData(color: Colors.white30),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white24,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700
        )
    ),
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20
        ),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14
        )
    )
);
