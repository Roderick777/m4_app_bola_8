import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:m4_app_bola_8/ui/providers/main.provider.dart';
import 'package:m4_app_bola_8/ui/view/home/home.view.dart';
import 'package:m4_app_bola_8/ui/view/response/response.view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bola 8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const HomeView(),
        '/response': (context) => const ResponseView(response: ''),
      },
    );
  }
}
