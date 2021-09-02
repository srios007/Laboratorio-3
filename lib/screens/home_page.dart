import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  bool partition1Bool = false;
  bool partition2Bool = false;
  bool partition3Bool = false;
  bool partition4Bool = false;
  bool partition5Bool = false;
  bool partition6Bool = false;
  bool partition7Bool = false;
  bool partition8Bool = false;
  bool partition9Bool = false;
  bool partition10Bool = false;

  bool button1Bool = false;
  bool button2Bool = false;
  bool button3Bool = false;
  bool button4Bool = false;
  bool button5Bool = false;
  bool button6Bool = false;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  int page = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Laboratorio 3'),
      ),
      body: SafeArea(
        child: WebScrollbar(
          color: Colors.white,
          backgroundColor: Colors.white,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 400,
                          width: 500,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette.darkBlue,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomCheckBox(
                                  partition: partition1Bool,
                                  text: 'Proceso 1',
                                  size: 2,
                                ),
                                CustomCheckBox(
                                  partition: partition2Bool,
                                  text: 'Proceso 2',
                                  size: 4,
                                ),
                                CustomCheckBox(
                                  partition: partition3Bool,
                                  text: 'Proceso 3',
                                  size: 6,
                                ),
                                CustomCheckBox(
                                  partition: partition4Bool,
                                  text: 'Proceso 4',
                                  size: 8,
                                ),
                                CustomCheckBox(
                                  partition: partition5Bool,
                                  text: 'Proceso 5',
                                  size: 10,
                                ),
                                CustomCheckBox(
                                  partition: partition6Bool,
                                  text: 'Proceso 6',
                                  size: 1,
                                ),
                                CustomCheckBox(
                                  partition: partition7Bool,
                                  text: 'Proceso 7',
                                  size: 3,
                                ),
                                CustomCheckBox(
                                  partition: partition8Bool,
                                  text: 'Proceso 8',
                                  size: 5,
                                ),
                                CustomCheckBox(
                                  partition: partition9Bool,
                                  text: 'Proceso 9',
                                  size: 7,
                                ),
                                CustomCheckBox(
                                  partition: partition10Bool,
                                  text: 'Proceso 10',
                                  size: 9,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (!button1Bool) {
                                      button1Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                    }
                                  });
                                },
                                title: 'Particiones estáticas fijas',
                                isActive: button1Bool,
                              ),
                              CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (!button2Bool) {
                                      button2Bool = true;
                                      button1Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                    }
                                  });
                                },
                                title: 'Particiones estáticas variables',
                                isActive: button2Bool,
                              ),
                              CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (!button3Bool) {
                                      button3Bool = true;
                                      button2Bool = false;
                                      button1Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                    }
                                  });
                                },
                                title: 'Particiones dinámicas con compactación',
                                isActive: button3Bool,
                              ),
                              CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (!button4Bool) {
                                      button4Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button1Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                    }
                                  });
                                },
                                title: 'Particiones dinámicas sin compactación',
                                isActive: button4Bool,
                              ),
                              CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (!button5Bool) {
                                      button5Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button1Bool = false;
                                      button6Bool = false;
                                    }
                                  });
                                },
                                title: 'Segmentación',
                                isActive: button5Bool,
                              ),
                              CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (!button6Bool) {
                                      button6Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button1Bool = false;
                                    }
                                  });
                                },
                                title: 'Paginación',
                                isActive: button6Bool,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      height: 802,
                      width: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Palette.darkBlue,
                        ),
                        color: Palette.lightBlue.withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                          staticPartitionContainer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget staticPartitionContainer() {
    return Container(
      height: 50,
      width: 500,
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.darkBlue,
        ),
        color: Palette.lightBlue.withOpacity(0.3),
      ),
    );
  }
}