import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/providers/about_provider.dart';
import 'package:provider_todo/providers/home_provider.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutPro = Provider.of<AboutProvider>(context);
    final homePro = Provider.of<HomeProvider>(context, listen: false);
    final arg = ModalRoute.of(context)!.settings.arguments;
    print(arg);

    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        children: [
          Consumer<HomeProvider>(builder: (context, value, child) {
            return Text('This is about page ${value.count}');
          }),
          Consumer<AboutProvider>(builder: (context, about, child) {
            return Text('${about.price}');
          }),
          Text('${arg.toString()}'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => aboutPro.increment(),
              child: Text('Increment Price')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => homePro.increment(),
              child: Text('Increment counter'))
        ],
      ),
    );
  }
}
