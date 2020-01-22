import 'package:flutter/material.dart';
import 'package:test_swipes/src/components/rounded_button.dart';
import 'package:test_swipes/src/components/squared_button.dart';
import 'package:test_swipes/src/components/central_box.dart';
import 'package:test_swipes/src/bloc/swipes/swipes_bloc.dart';
import 'package:test_swipes/src/screens/counter_data/counter_data.dart';
import 'package:provider/provider.dart';

class SwipeScreen extends StatefulWidget {
  static String id = 'swipe_screen';
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen>
    with TickerProviderStateMixin {
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
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SwipesBloc>(
        builder: (context, _swipesBloc, child) {
          return StreamBuilder<int>(
            stream: _swipesBloc.pressedCount,
            builder: (context, snapshot) {
              String counterValue = snapshot.data.toString();

              return Stack(
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
                                  _swipesBloc.incrementCounter.add(-1);
                                },
                              ),
                              SquaredButton(
                                buttonKey: 'incrementPlusButton',
                                title: '+',
                                onPressed: () {
                                  _swipesBloc.incrementCounter.add(1);
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundedButton(
                              color: Color(0xFFEC706E),
                              title: 'Reset',
                              onPressed: () {
                                _swipesBloc.resetCount;
                              },
                            ),
                            RoundedButton(
                              color: Color(0xFF999999),
                              title: 'To data screen',
                              onPressed: () {
                                Navigator.of(context).pushNamed(CounterData.id);
                              },
                            ),
                          ],
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
                              _swipesBloc.incrementCounter.add(1);
                              setState(() {
                                _controller.value = 0.5;
                                _controller.forward();
                              });
                            } else {
                              _swipesBloc.incrementCounter.add(-1);
                              setState(() {
                                _controller.value = 0.5;
                                _controller.forward();
                              });
                            }
                          },
                          child: CentralBox(
                            title: counterValue,
                            size: MediaQuery.of(context).size.width /
                                2 *
                                _animation.value,
                          )),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
