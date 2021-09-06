import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  // double _scrollPosition = 0;
  // double _opacity = 0;

  bool button1Bool = true;
  bool button2Bool = false;
  bool button3Bool = false;
  bool button4Bool = false;
  bool button5Bool = false;
  bool button6Bool = false;
  bool isNotEmpty = false;
  bool aux = false;

  _scrollListener() {
    setState(() {
      // _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  List<Widget> memoryList = [
    PartitionContainer(),
    PartitionContainer(),
    PartitionContainer(),
    PartitionContainer(),
    PartitionContainer(),
    PartitionContainer(),
    PartitionContainer(),
    PartitionContainer(),
  ];
  List<Process> auxMemoryList = [];
  List<Process> processList = [
    Process(isSelected: false, name: 'Proceso1', size: 0.5, isDeleted: false),
    Process(isSelected: false, name: 'Proceso2', size: 0.4, isDeleted: false),
    Process(isSelected: false, name: 'Proceso3', size: 0.6, isDeleted: false),
    Process(isSelected: false, name: 'Proceso4', size: 0.8, isDeleted: false),
    Process(isSelected: false, name: 'Proceso5', size: 1, isDeleted: false),
    Process(isSelected: false, name: 'Proceso6', size: 1.2, isDeleted: false),
    Process(isSelected: false, name: 'Proceso7', size: 3, isDeleted: false),
    Process(isSelected: false, name: 'Proceso8', size: 1.5, isDeleted: false),
    Process(isSelected: false, name: 'Proceso9', size: 1.7, isDeleted: false),
    Process(isSelected: false, name: 'Proceso10', size: 1.9, isDeleted: false),
  ];
  int index = 0;

  List<Process> dynamicWithoutCompactionList = [];
  int dynamicPosition = 0;
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // _opacity = _scrollPosition < screenSize.height * 0.40
    //     ? _scrollPosition / (screenSize.height * 0.40)
    //     : 1;

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
                            child: ListView.builder(
                              itemCount: processList.length,
                              itemBuilder: (context, position) {
                                return CustomCheckBox(
                                  process: processList[position],
                                  onChanged: (value) {
                                    if (button1Bool) {
                                      staticPartitionFuntion(position, value);
                                    } else if (button2Bool) {
                                      variableStaticPartitionFuntion();
                                    } else if (button3Bool) {
                                      dynamicCompactionPartitionFuntion(
                                          position, value);
                                    } else if (button4Bool) {
                                      dynamicPartitionWithoutCompactionFuntion(
                                          position, value);
                                    } else if (button5Bool) {
                                      segmentationFuntion();
                                    } else if (button6Bool) {
                                      paginationFuntion();
                                    }
                                  },
                                );
                              },
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
                    button1Bool
                        ? staticPartitionContainer()
                        : button2Bool
                            ? variableStaticPartitionContainer()
                            : button3Bool
                                ? dynamicCompactionPartitionContainer()
                                : button4Bool
                                    ? dynamicPartitionWithoutCompactionContainer()
                                    : button5Bool
                                        ? segmentationContainer()
                                        : button6Bool
                                            ? paginationContainer()
                                            : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// Particiones estáticas fijas

  // ignore: missing_return
  bool getIsDeleted() {
    auxMemoryList.forEach((element) {
      if (element.isDeleted) {
        setState(() {
          isNotEmpty = true;
          index = auxMemoryList.indexWhere(
            (process) => process.isDeleted,
          );
        });

        return isNotEmpty;
      }
    });
  }

  void getPrueba() {
    auxMemoryList.forEach((element) {
      if (element.isDeleted) {
        setState(() {
          aux = true;
        });
      } else {
        setState(() {
          aux = false;
        });
      }
    });
  }

  void staticPartitionFuntion(int position, bool value) {
    setState(() {
      getIsDeleted();
      if (value) {
        if (processList[position].size <= 2) {
          processList[position].isSelected = value;
          if (auxMemoryList.length < 8 || isNotEmpty) {
            getPrueba();
            print('isNotEmpty: $isNotEmpty');
            if (isNotEmpty) {
              auxMemoryList.removeAt(index);
              auxMemoryList.insert(
                index,
                Process(
                  isSelected: true,
                  isDeleted: false,
                  name: processList[position].name,
                  size: processList[position].size,
                ),
              );
              auxMemoryList.forEach((element) {
                print('${element.name}: ${element.isDeleted}\n\n');
              });
              getIsDeleted();
            } else {
              auxMemoryList.add(
                Process(
                  isSelected: true,
                  isDeleted: false,
                  name: processList[position].name,
                  size: processList[position].size,
                ),
              );
              auxMemoryList.forEach((element) {
                print('${element.name}: ${element.isDeleted}\n\n');
              });
              getIsDeleted();
            }
          } else {
            processList[position].isSelected = false;
            Alert(
              context: context,
              type: AlertType.error,
              title: 'Memoria insuficiente',
              desc: 'El proceso no se puede agregar porque no hay más memoria.',
              buttons: [
                DialogButton(
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Palette.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          }
        } else {
          processList[position].isSelected = false;
          Alert(
            context: context,
            type: AlertType.error,
            title: 'No se puede agregar el proceso',
            desc: 'El proceso sobrepasa el tamaño de 2 MB de las particiones.',
            buttons: [
              DialogButton(
                child: Text(
                  'Ok',
                  style: TextStyle(color: Palette.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
      } else {
        processList[position].isSelected = false;
        int index = auxMemoryList.indexWhere(
          (process) => process.size == processList[position].size,
        );
        if (index == auxMemoryList.length - 1) {
          auxMemoryList.removeWhere(
              (process) => process.size == processList[position].size);
        } else {
          auxMemoryList[index].isDeleted = true;
        }
      }
    });
  }

  Widget staticPartitionContainer() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          height: 800,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.darkBlue,
            ),
            color: Palette.lightBlue.withOpacity(0.3),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          height: 800,
          width: 500,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: memoryList.length,
            itemBuilder: (context, position) {
              return memoryList[position];
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          height: 800,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.darkBlue,
            ),
            color: Palette.lightBlue.withOpacity(0.3),
          ),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: auxMemoryList.length,
            itemBuilder: (context, position) {
              return StaticPartitionContainer(
                process: auxMemoryList[position],
              );
            },
          ),
        ),
      ],
    );
  }

// Particiones estáticas variables
  void variableStaticPartitionFuntion() {}

  Widget variableStaticPartitionContainer() {
    return Stack(
      children: [
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
        ),
      ],
    );
  }

// Particiones dinámicas de compactación
  void dynamicCompactionPartitionFuntion(int position, bool value) {
    setState(() {
      if (processList[position].size <= 2) {
        processList[position].isSelected = value;
        if (!value) {
          auxMemoryList.removeWhere(
            (process) => process.size == processList[position].size,
          );
        } else {
          if (auxMemoryList.length < 8) {
            auxMemoryList.add(
              processList[position],
            );
          } else {
            processList[position].isSelected = false;
            Alert(
              context: context,
              type: AlertType.error,
              title: 'Memoria insuficiente',
              desc: 'El proceso no se puede agregar porque no hay más memoria.',
              buttons: [
                DialogButton(
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          }
        }
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: 'No se puede agregar el proceso',
          desc: 'El proceso sobrepasa el tamaño de 2 MB de las particiones.',
          buttons: [
            DialogButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
    });
  }

  Widget dynamicCompactionPartitionContainer() {
    return Stack(
      children: [
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
        ),
      ],
    );
  }

// Particiones dinámicas sin compactación
  void dynamicPartitionWithoutCompactionFuntion(int position, bool value) {
    setState(() {
      print('-------------------');
      if (verifySpace() < 16.0) {
        dynamicWithoutCompactionList.add(
          Process(
            isSelected: processList[position].isSelected,
            isDeleted: processList[position].isDeleted,
            name: processList[position].name,
            size: processList[position].size,
          ),
        );
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: 'Memoria insuficiente',
          desc: 'El proceso no se puede agregar porque no hay más memoria.',
          buttons: [
            DialogButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Palette.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
    });
  }

  double verifySpace() {
    double aux = 0;
    dynamicWithoutCompactionList.forEach((element) {
      aux += element.size;
    });
    return aux;
  }

  Widget dynamicPartitionWithoutCompactionContainer() {
    return Stack(
      children: [
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
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          height: 800,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.darkBlue,
            ),
            color: Palette.lightBlue.withOpacity(0.3),
          ),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: dynamicWithoutCompactionList.length,
            itemBuilder: (context, position) {
              return DynamicPartitionContainer(
                process: dynamicWithoutCompactionList[position],
              );
            },
          ),
        ),
      ],
    );
  }

// Segmentación
  void segmentationFuntion() {}

  Widget segmentationContainer() {
    return Stack(
      children: [
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
        ),
      ],
    );
  }

// Paginación
  void paginationFuntion() {}

  Widget paginationContainer() {
    return Stack(
      children: [
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
        ),
      ],
    );
  }
}
