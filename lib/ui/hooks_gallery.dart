import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'infinite_timer.dart';

class HooksGallery extends HookWidget {
  const HooksGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _count = useState(0);
    // AnimationController _animationController =
    //     useAnimationController(duration: Duration(seconds: 4), initialValue: 1);
    // _animationController.repeat(reverse: false);

    // AnimationController controller =
    //     useAnimationController(duration: Duration(seconds: 3), initialValue: 1);
    // controller.repeat(reverse: false, period: Duration(seconds: 4));

    // controller =
    //     useAnimationController(duration: Duration(seconds: 3), initialValue: 1);
    // controller.repeat(reverse: false, period: Duration(seconds: 4));

    // Animation<Offset> offset =
    //     Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
    //         .animate(controller);
    // controller.forward();

    // useEffect(() {
    //   // Timer.periodic(Duration(seconds: 4), (time) {
    //   //   Navigator.of(context).pushReplacementNamed('/');
    //   // });
    // });

    // return SafeArea(
    //     child: Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [Color(0xFFFFFFFF), Color(0xffE3F3FF)],
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //       ),
    //     ),
    //     child: Stack(
    //       children: [
    //         FadeTransition(
    //           opacity: _animationController,
    //           child: Center(
    //               child: FlutterLogo(
    //             size: 50,
    //           )),
    //         ),
    //         Align(
    //             alignment: Alignment.bottomCenter,
    //             child: SlideTransition(
    //               position: offset,
    //               child: Image.network(
    //                 'https://images.unsplash.com/photo-1515041219749-89347f83291a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FydG9vbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    //                 width: MediaQuery.of(context).size.width,
    //                 fit: BoxFit.fill,
    //               ),
    //             ))
    //       ],
    //     ),
    //   ),
    // ));

    final _number = useState(0);
    final hookAnimation =
        useAnimationController(duration: Duration(seconds: 5), initialValue: 1);

    useEffect(() {
      Timer timer = Timer.periodic(Duration(seconds: 1), ((timer) {
        _number.value = timer.tick;
      }));
      print('cal use effect ===');
      return () {
        print('despose call');
        timer.cancel();
      };
    }, const []);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('${_count.value}'),
          Text(_number.value.toString()),
          Text(useInfiniteTimer(context).toString()),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () => _count.value++, child: Text(" + ")),
          GestureDetector(
            onTap: () {
              hookAnimation.forward();
            },
            onDoubleTap: () {
              hookAnimation.reverse();
            },
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                  child: FadeTransition(
                      opacity: hookAnimation,
                      child: ScaleTransition(
                          scale: hookAnimation,
                          child: FlutterLogo(
                            textColor: Colors.blue,
                            size: 500,
                          )))),
            ),
          ),
        ],
      ),
    );
  }
}
