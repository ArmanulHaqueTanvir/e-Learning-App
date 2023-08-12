import 'package:e_learnign_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learnign_app/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_blocks.dart';
import 'app_events.dart';
import 'app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => AppBlocs()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const SignIn(),
          routes: {
            'myHomePage': (context) => MyHomePage(),
            'signIn': (context) => const SignIn(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AppBlocs, AppSates>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${BlocProvider.of<AppBlocs>(context).state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          heroTag: '1',
          onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const Spacer(),
        FloatingActionButton(
          heroTag: '2',
          onPressed: () => BlocProvider.of<AppBlocs>(context).add(Decrement()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
