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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // margin: ,
                    height: 400,
                    width: 500,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette.darkBlue,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomCheckBox(partition: partition1Bool, text: ''),
                        CustomCheckBox(partition: partition2Bool, text: ''),
                        CustomCheckBox(partition: partition3Bool, text: ''),
                        CustomCheckBox(partition: partition4Bool, text: ''),
                        CustomCheckBox(partition: partition5Bool, text: ''),
                        CustomCheckBox(partition: partition6Bool, text: ''),
                        CustomCheckBox(partition: partition7Bool, text: ''),
                        CustomCheckBox(partition: partition8Bool, text: ''),
                        CustomCheckBox(partition: partition9Bool, text: ''),
                        CustomCheckBox(partition: partition10Bool, text: ''),
                      ],
                    ),
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

  Widget checkbox(bool partition, String text) {
    return Row(
      children: [
        Checkbox(
          value: partition,
          activeColor: Palette.normalBlue,
          onChanged: (value) {
            setState(() {
              print(partition);
              partition = value;
              print(partition);
            });
          },
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
