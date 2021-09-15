import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';
import 'package:laboratorio_3/screens/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class VariableStaticPartitionScreen extends StatefulWidget {
  @override
  _VariableStaticPartitionScreenState createState() =>
      _VariableStaticPartitionScreenState();
}

class _VariableStaticPartitionScreenState
    extends State<VariableStaticPartitionScreen> {
  ScrollController _scrollController;
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
  bool isNotEmpty = false;
  bool findSpaceBool = false;

  int index = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Palette.lightBlue,
          bottom: PreferredSize(
            preferredSize: Size(100, 100),
            child: Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 100,
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.arrow_back,
                        color: Palette.white,
                        size: 60,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Particiones estáticas variables',
                        style: TextStyle(
                          color: Palette.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 100,
                    // ignore: missing_required_param
                    child: Center(
                      child: CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Home()),
                          );
                        },
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.arrow_back,
                          color: Palette.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                                    variableStaticPartitionFuntion(
                                        position, value);
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
                            children: [],
                          ),
                        )
                      ],
                    ),
                    Stack(
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
                              return CompactationContainer(
                                process: auxMemoryList[position],
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
            double aux = auxMemoryList[index].size;

            auxMemoryList.removeAt(index);
            auxMemoryList.insert(
              index,
              Process(
                isSelected: true,
                isDeleted: false,
                name: processList[position].name,
                space: aux - processList[position].size,
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
                space: 0,
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
}
