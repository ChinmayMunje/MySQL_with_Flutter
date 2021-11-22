import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

class PIP extends StatefulWidget {
  const PIP({Key? key}) : super(key: key);

  @override
  _PIPState createState() => _PIPState();
}

class _PIPState extends State<PIP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PIP View"),
      ),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PIPView(
      builder: (context, isFloating) {
        return Scaffold(
          resizeToAvoidBottomInset: !isFloating,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 100,),
                    const Center(child: Text('This is the PIP Window..')),
                    const SizedBox(height: 50,),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      child: const Text('Start floating!',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        PIPView.of(context).presentBelow(BackgroundScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('This is the background page!')),
        ),
      ),
    );
  }
}