import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/config/constants/list_constants.dart';
import 'package:laboratorio_3/models/models.dart';
import 'package:laboratorio_3/screens/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class VariableStaticPartitionScreen extends StatefulWidget {
  @override
  _VariableStaticPartitionScreenState createState() => _VariableStaticPartitionScreenState();
}

class _VariableStaticPartitionScreenState extends State<VariableStaticPartitionScreen> {
  ScrollController _scrollController;
  List<Process> processList = [];
  List<Widget> memoryList = [
    PartitionContainer(height: 200,),
    PartitionContainer(height: 150,),
    PartitionContainer(height: 150,),
    PartitionContainer(height: 100,),
    PartitionContainer(height: 50,),
    PartitionContainer(height: 50,),
    PartitionContainer(height: 25,),
    PartitionContainer(height: 25,),
  ];
  List<double> machete = [200,150,150,100,50,50,25,25,];
  List<Process> auxMemoryList = [];
  bool isNotEmpty = false;
  int index = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    processList = processConstantList;

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
                          processConstantList.forEach((element) {
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
                        'Particiones estáticas fijas',
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
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 450,
                      width: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Palette.black,
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
                                staticPartitionFuntion(position, value);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 443,
                      width: 503,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Palette.darkBlue,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Palette.darkBlue,
                                  ),
                                ),
                                height: 40,
                                width: 167,
                                child: Center(
                                  child: Text(
                                    'Nombre del proceso',
                                    style: TextStyle(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Palette.darkBlue,
                                  ),
                                ),
                                height: 40,
                                width: 167,
                                child: Text(
                                  'Dirección base',
                                  style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Palette.darkBlue,
                                  ),
                                ),
                                height: 40,
                                width: 167,
                                child: Text(
                                  'Capacidad',
                                  style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 400,
                            width: 503,
                            child: Center(
                              child: ListView.builder(
                                itemCount: auxMemoryList.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, position) {
                                  return auxMemoryList[position].isDeleted
                                  ? const SizedBox.shrink()
                                  :TableContainer(
                                    process: auxMemoryList[position],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
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
                          height: 800,
                          width: 500,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette.black,
                            ),
                            color: Palette.lightBlue.withOpacity(0.3),
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: auxMemoryList.length,
                            itemBuilder: (context, position) {
                              return  VariableStaticPartitionContainer(
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
                  color: processList[position].color,
                  space: machete[index],
                ),
              );
              print(processList[position].size.round().toRadixString(16));
              getIsDeleted();
            } else {
              auxMemoryList.add(
                Process(
                  isSelected: true,
                  isDeleted: false,
                  name: processList[position].name,
                  size: processList[position].size,
                  color: processList[position].color,
                  space: machete[auxMemoryList.length],

                  
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
}
