import 'package:flutter/material.dart';
import 'package:test_swipes/src/components/rounded_button.dart';
import 'package:test_swipes/src/components/squared_button.dart';
import 'package:test_swipes/src/components/central_box.dart';

class SwipeScreen extends StatefulWidget {
  static String id = 'swipe_screen';
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen>
    with TickerProviderStateMixin {
  int _counter = 0;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
      lowerBound: 0.5,
      upperBound: 1,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
    _controller.forward();

    _controller.addListener(
      () {
        setState(() {});
        print(_animation.value);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFF3D9098),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Swipe Counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SquaredButton(
                        title: '-',
                        onPressed: () {
                          setState(() {
                            _counter -= 1;
                          });
                        },
                      ),
                      SquaredButton(
                        title: '+',
                        onPressed: () {
                          setState(() {
                            _counter += 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                RoundedButton(
                  color: Color(0xFFEC706E),
                  title: 'Reset',
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              child: Dismissible(
                  key: UniqueKey(),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      setState(() {
                        _controller.value = 0.5;
                        _controller.forward();
                        _counter -= 1;
                      });
                    } else {
                      setState(() {
                        _controller.value = 0.5;
                        _controller.forward();
                        _counter += 1;
                      });
                    }
                  },
                  child: CentralBox(
                    title: '$_counter',
                    size: MediaQuery.of(context).size.width /
                        2 *
                        _animation.value,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
