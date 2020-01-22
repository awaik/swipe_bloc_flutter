import 'package:flutter/material.dart';
import 'src/screens/swipe/swipe_screen.dart';
import 'src/screens/counter_data/counter_data.dart';
import 'package:provider/provider.dart';
import 'package:test_swipes/src/bloc/swipes/swipes_bloc_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SwipesBlocProvider>(create: (_) => SwipesBlocProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SwipeScreen(),
        routes: <String, WidgetBuilder>{
          SwipeScreen.id: (BuildContext context) => SwipeScreen(),
          CounterData.id: (BuildContext context) => CounterData(),
        },
      ),
    );
  }
}
