import 'package:quiknote/components/modul.dart';
import 'package:quiknote/components/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locales.init(['en', 'fa', 'ps']);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        title: "QuikNote",
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeProvider.themeMode,
        home: const GetStartScreen(),
      ),
    );
  }
}
