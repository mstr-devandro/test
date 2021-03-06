import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/users_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<UsersBloc>(
        create: (context) => UsersBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  UsersBloc _userBloc;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UsersBloc>(context);
    _controller.addListener(() {
      _loadUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Github App'),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Username',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: BlocBuilder<UsersBloc, UsersState>(
                builder: (context, state) {
                  return state is UserLoaded
                      ? ListView.builder(
                          itemCount: state.users.items.length,
                          itemBuilder: (context, index) {
                            final user = state.users.items[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                  leading: Image.network(user.avatarUrl),
                                  title: Text(user.login)),
                            );
                          },
                        )
                      : Container();
                },
              ),
            ),
          ],
        ));
  }

  _loadUser() {
    final username = _controller.text;
    if (username.isNotEmpty) _userBloc.add(LoadUser(username));
  }
}
