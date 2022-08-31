import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/providers/home_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<HomeProvider>(builder: (context, value, chail) {
            return Text('${value.count}');
          }),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () => homePro.increment(), child: Text("Increment")),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/about',
                arguments: 'Text is Argument'),
            child: Text('Go to AboutPage'),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/gallery',
                arguments: 'Text is Argument'),
            child: Text('Go to gallery'),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/link',
                arguments: 'Text is Argument'),
            child: Text('Go to link'),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/gpql',
                arguments: 'Text is Argument'),
            child: Text('Go to gpql'),
          ),
        ],
      ),
    ));
  }
}
