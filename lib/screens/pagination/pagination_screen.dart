import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/config/constants/list_constants.dart';
import 'package:laboratorio_3/models/models.dart';
import 'package:laboratorio_3/screens/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaginationScreen extends StatefulWidget {
  @override
  _PaginationScreenState createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  ScrollController _scrollController;
  List<Process> processList = [];
  
  List<Widget> partitionMemoryList = [
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
    PartitionContainer(height: 50),
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
  List<Process> auxPaginationList = [
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
    Process(isSelected: true, isDeleted: true, name: '', size: 1),
  ];

  bool isNotEmpty = false;
  bool findSpaceBool = false;
  int index = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    processList = processCompleteConstantList;

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
                        setState(() {
                          processCompleteConstantList.forEach((element) {
                            element.isSelected = false;
                            element.isDeleted = false;
                          });
                        });
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
                        'Paginación',
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
                                    paginationFuntion(position, value);
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
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: partitionMemoryList.length,
                            itemBuilder: (context, position) {
                              return partitionMemoryList[position];
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
                            itemCount: auxPaginationList.length,
                            itemBuilder: (context, position) {
                              return PaginationContainer(
                                process: auxPaginationList[position],
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

  bool getIsDeletedPagination() {
    setState(() {
      isNotEmpty = false;
    });
    auxPaginationList.forEach((element) {
      if (element.isDeleted) {
        setState(() {
          isNotEmpty = true;
          index = auxPaginationList.indexWhere(
            (process) => process.isDeleted,
          );
        });
        return isNotEmpty;
      }
    });
  }

  bool findSpacePagination(int position) {
    setState(() {
      findSpaceBool = false;
    });
    // derecha: Lista de procesos
    // izquierda: Lista gráfica de procesos
    auxPaginationList.forEach((process) {
      if (process.isDeleted) {
        setState(() {
          findSpaceBool = true;
          index = auxPaginationList.indexWhere(
            (process2) => process2.isDeleted,
          );
        });
        return isNotEmpty;
      }
    });
  }

  void setFalsePagination() {
    setState(() {
      auxPaginationList.forEach((element) {
        element.isDeleted = true;
      });
    });
  }

  void paginationFuntion(int position, bool value) {
    setState(() {
      findSpacePagination(position);
      if (value) {
        processList[position].isSelected = value;
        if (findSpaceBool) {
          int aux = processList[position].size < 0.5
              ? 1
              : int.parse(processList[position].size.toStringAsFixed(0));

          if (processList[position].size % aux == 0) {
            for (int i = 0; i < aux; i++) {
              auxPaginationList.removeAt(index);
              auxPaginationList.insert(
                index,
                Process(
                    isSelected: true,
                    isDeleted: false,
                    name: processList[position].name,
                    size: 1,
                    id: '${processList[position].size + i}'),
              );
              getIsDeletedPagination();
            }
          } else {
            if (int.parse(processList[position]
                        .size
                        .toStringAsFixed(1)
                        .toString()
                        .replaceAll('.', '')
                        .substring(1)) <
                    5 &&
                (processList[position].size) > 1) {
              for (int i = 0; (i + 1) <= aux + 1; i++) {
                auxPaginationList.removeAt(index);
                auxPaginationList.insert(
                  index,
                  Process(
                    isSelected: true,
                    isDeleted: false,
                    name: processList[position].name,
                    size: i == aux
                        ? int.parse(processList[position]
                                .size
                                .toStringAsFixed(1)
                                .toString()
                                .replaceAll('.', '')
                                .substring(1)) /
                            10
                        : 1,
                  ),
                );
                getIsDeletedPagination();
              }
            } else {
              for (int i = 0; (i + 1) <= aux; i++) {
                auxPaginationList.removeAt(index);
                auxPaginationList.insert(
                  index,
                  Process(
                    isSelected: true,
                    isDeleted: false,
                    name: processList[position].name,
                    size: i + 1 == aux
                        ? int.parse(processList[position]
                                .size
                                .toStringAsFixed(1)
                                .toString()
                                .replaceAll('.', '')
                                .substring(1)) /
                            10
                        : 1,
                  ),
                );
                getIsDeletedPagination();
              }
            }
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
        setState(() {
          auxPaginationList.forEach((element) {
            if (processList[position].name == element.name) {
              element.isDeleted = true;
            }
          });
        });
      }
    });
  }
}
