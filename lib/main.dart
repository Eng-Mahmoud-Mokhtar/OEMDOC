import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/HomeStructure.dart';
import 'package:oemdoc/generated/l10n.dart';
import 'Core/utiles/LocaleCubit.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => BlocProvider<LocaleCubit>(
        create: (_) => LocaleCubit(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: locale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            return Directionality(
              textDirection: locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: DevicePreview.appBuilder(context, child!),
            );
          },
          theme: ThemeData(fontFamily: 'Tajawal'),
          home: HomeStructure(),
        );
      },
    );
  }
}
