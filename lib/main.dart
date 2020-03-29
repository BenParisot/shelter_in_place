import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/pages/questions/note.dart';
import 'package:shelter_in_place/pages/questions/social_distancing.dart';
import 'package:shelter_in_place/services/days_service.dart';
import 'auth.dart';
import 'models/day_model.dart';
import 'pages/home.dart';
import 'pages/localization/localizations.dart';
import 'pages/login.dart';
import 'pages/summary.dart';
import 'pages/questions/activities.dart';
import 'pages/questions/feelings.dart';

void main() => runApp(
    ChangeNotifierProvider<AuthService>(
          child: MyApp(), create: (context) => AuthService()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Day>(
            builder: (context) => Day(),
          ),
          Provider<DaysService>(
            builder: (context) => DaysService(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Shelter in Place Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'), // English
              const Locale('es'), // Spanish
              const Locale('nl') // Dutch
            ],
            home: FutureBuilder(
              future: Provider.of<AuthService>(context).getUser(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.hasData ? HomePage() : LoginPage();
                } else {
                  return Container(color: Colors.white);
                }
              },
            ),
            onGenerateRoute: (routeSettings) {
              // Use names routes to prevent duplicate code
              if (routeSettings.name == 'first-question') {
                return MaterialPageRoute(
                  builder: (context) => SocialDistancing(),
                );
              } else if (routeSettings.name == 'second-question') {
                return MaterialPageRoute(
                  builder: (context) => Activities(),
                );
              } else if (routeSettings.name == 'third-question') {
                return MaterialPageRoute(
                  builder: (context) => Feelings(),
                );
              } else if (routeSettings.name == 'summary') {
                return MaterialPageRoute(
                  builder: (context) => Summary(),
                );
              } else if (routeSettings.name == 'fourth-question') {
                return MaterialPageRoute(
                  builder: (context) => NoteForDay(),
                );
              }else if (routeSettings.name == 'overview') {
                return MaterialPageRoute(
                  builder: (context) => HomePage(),
                );
              }
              return null;
            }));
  }
}

// Not being used yet, but nice for when Firebase implementation is in place
class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
