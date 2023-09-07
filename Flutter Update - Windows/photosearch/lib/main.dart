import 'package:fluent_ui/fluent_ui.dart';
import 'package:photosearch/pages/Home.dart';
import 'package:system_theme/system_theme.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: FluentThemeData(
          accentColor: SystemTheme.accentColor.accent.toAccentColor()),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
