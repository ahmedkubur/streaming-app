import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/Theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String locale = prefs.getString('locale');
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: transparentColor),
  );
  runApp(
    Phoenix(
        child: BlocProvider(
            create: (context) => LanguageCubit(locale), child: Clipix())),
  );
}

class Clipix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 5.0;

    return BlocBuilder<LanguageCubit, Locale>(builder: (context, appLocale) {
      return MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],

        ///supported Languages
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
          const Locale('fr'),
          const Locale('in'),
          const Locale('pt'),
          const Locale('es'),
        ],
        locale: appLocale,
        theme: appTheme,
        home: SignInNavigator(),
        routes: PageRoutes().routes(),
      );
    });
  }
}
