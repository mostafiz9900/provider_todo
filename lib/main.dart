import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/ui/gpql_view.dart';

import 'providers/about_provider.dart';
import 'providers/home_provider.dart';
import 'ui/about_view.dart';
import 'ui/home_view.dart';
import 'ui/hooks_gallery.dart';
import 'ui/link_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => AboutProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          '/about': (context) => const AboutView(),
          '/gallery': (context) => const HooksGallery(),
          '/link': (context) => const LinkView(),
          '/gpql': (context) => const GpqlView(),
        },
      ),
    );
  }
}
