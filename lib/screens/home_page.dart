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

  bool button1Bool = true;
  bool button2Bool = false;
  bool button3Bool = false;
  bool button4Bool = false;
  bool button5Bool = false;
  bool button6Bool = false;
  bool isNotEmpty = false;
  bool findSpaceBool = false;
  bool canAdd = false;

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
    Process(isSelected: false, name: 'Proceso 1', size: 0.5, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 2', size: 0.4, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 3', size: 0.6, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 4', size: 0.8, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 5', size: 1, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 6', size: 1.2, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 7', size: 3, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 8', size: 1.5, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 9', size: 1.7, isDeleted: false),
    Process(isSelected: false, name: 'Proceso 10', size: 1.9, isDeleted: false),
  ];
  int index = 0;
  double totalMemory = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, position) {
                                return CustomCheckBox(
                                  process: processList[position],
                                  onChanged: (value) {
                                    if (button1Bool) {
                                      staticPartitionFuntion(position, value);
                                    } else if (button2Bool) {
                                      variableStaticPartitionFuntion(
                                          position, value);
                                    } else if (button3Bool) {
                                      dynamicCompactionPartitionFuntion(
                                          position, value);
                                    } else if (button4Bool) {
                                      dynamicPartitionWithoutCompactionFuntion(
                                          position, value);
                                    } else if (button5Bool) {
                                      segmentationFuntion(
                                        position,
                                        value,
                                      );
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
                                      auxMemoryList.clear();
                                      button1Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                      setFalseProcess();
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
                                      auxMemoryList.clear();
                                      button2Bool = true;
                                      button1Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                      setFalseProcess();
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
                                      auxMemoryList.clear();
                                      button3Bool = true;
                                      button2Bool = false;
                                      button1Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                      setFalseProcess();
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
                                      auxMemoryList.clear();
                                      button4Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button1Bool = false;
                                      button5Bool = false;
                                      button6Bool = false;
                                      setFalseProcess();
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
                                      auxMemoryList.clear();
                                      button5Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button1Bool = false;
                                      button6Bool = false;
                                      setFalseProcess();
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
                                      auxMemoryList.clear();
                                      button6Bool = true;
                                      button2Bool = false;
                                      button3Bool = false;
                                      button4Bool = false;
                                      button5Bool = false;
                                      button1Bool = false;
                                      setFalseProcess();
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

  void setFalseProcess() {
    setState(() {
      processList.forEach((element) {
        element.isSelected = false;
        element.isDeleted = false;
      });
    });
  }
// Particiones estáticas fijas

  // ignore: missing_return
  bool getIsDeleted() {
    setState(() {
      isNotEmpty = false;
    });
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

  void staticPartitionFuntion(int position, bool value) {
    setState(() {
      getIsDeleted();
      if (value) {
        if (processList[position].size <= 2) {
          processList[position].isSelected = value;
          if (auxMemoryList.length < 8 || isNotEmpty) {
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

  // ignore: missing_return
  bool findSpace(int position) {
    setState(() {
      findSpaceBool = false;
    });
    // derecha: Lista de procesos
    // izquierda: Lista gráfica de procesos
    auxMemoryList.forEach((process) {
      if (processList[position].size <= process.size && process.isDeleted) {
        setState(() {
          findSpaceBool = true;
          index = auxMemoryList.indexWhere(
            (process2) =>
                process2.size >= processList[position].size &&
                process2.isDeleted,
          );
        });
        return isNotEmpty;
      }
    });
  }

  void variableStaticPartitionFuntion(int position, bool value) {
    setState(() {
      findSpace(position);
      if (value) {
        processList[position].isSelected = value;
        if (auxMemoryList.length < 8 || findSpaceBool) {
          if (findSpaceBool) {
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

  Widget variableStaticPartitionContainer() {
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
              return DynamicPartitionContainer(
                process: auxMemoryList[position],
                withCompaction: false,
              );
            },
          ),
        ),
      ],
    );
  }

// Particiones dinámicas de compactación
  void dynamicCompactionPartitionFuntion(int position, bool value) {
    setState(() {
      processList[position].isSelected = value;
      if (!value) {
        auxMemoryList.removeWhere(
          (process) => process.size == processList[position].size,
        );
      } else {
        if (auxMemoryList.length < 18) {
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
    });
  }

  Widget dynamicCompactionPartitionContainer() {
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
              return DynamicPartitionContainer(
                process: auxMemoryList[position],
                withCompaction: true,
              );
            },
          ),
        ),
      ],
    );
  }

// Particiones dinámicas sin compactación

  void setTotalMemory(position) {
    setState(() {
      totalMemory += processList[position].size;
    });
  }

  void enoughSPace(int position) {
    setState(() {
      canAdd = true;
    });
    // derecha: Lista de procesos
    // izquierda: Lista gráfica de procesos
    auxMemoryList.forEach((process) {
      if (processList[position].size <= process.size && process.isDeleted) {
        setState(() {
          canAdd = false;
          index = auxMemoryList.indexWhere(
            (process2) =>
                process2.size >= processList[position].size &&
                process2.isDeleted,
          );
        });
        return isNotEmpty;
      }
    });
  }

  void dynamicPartitionWithoutCompactionFuntion(int position, bool value) {
    enoughSPace(position);
    setTotalMemory(position);
    setState(() {
      findSpace(position);
      if (value) {
        processList[position].isSelected = value;
        if (totalMemory < 16) {
          if (findSpaceBool) {
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
        int index = auxMemoryList.indexWhere(
          (process) => process.size == processList[position].size,
        );
        if (index == auxMemoryList.length - 1) {
          auxMemoryList.removeWhere(
              (process) => process.size == processList[position].size);
        } else {
          auxMemoryList[index].isDeleted = true;
        }
        setState(() {
          totalMemory -= processList[position].size;
        });
      }
    });
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
            itemCount: auxMemoryList.length,
            itemBuilder: (context, position) {
              return DynamicPartitionContainer(
                process: auxMemoryList[position],
                withCompaction: false,
              );
            },
          ),
        ),
      ],
    );
  }

// Segmentación
  void segmentationFuntion(int position, bool value) {}

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
