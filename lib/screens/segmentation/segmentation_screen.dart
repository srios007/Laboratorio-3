import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/config/constants/list_constants.dart';
import 'package:laboratorio_3/models/models.dart';
import 'package:laboratorio_3/screens/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SegmentationScreen extends StatefulWidget {
  @override
  _SegmentationScreenState createState() => _SegmentationScreenState();
}

class _SegmentationScreenState extends State<SegmentationScreen> {
  ScrollController _scrollController;
  List<Process> processList = [];

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
  List<Process> auxSegmentationList = [
    Process(
        isSelected: true,
        isDeleted: false,
        name: 'Segmento Proceso 1',
        size: 0.2,
        id: '1'),
    Process(
        isSelected: true,
        isDeleted: false,
        name: 'Segmento Proceso 2',
        size: 0.1,
        id: '1'),
    Process(
        isSelected: true,
        isDeleted: false,
        name: 'Segmento Proceso 1',
        size: 0.2,
        id: '1'),
    Process(
        isSelected: true,
        isDeleted: false,
        name: 'Segmento Proceso 2',
        size: 0.1,
        id: '1'),
    Process(
        isSelected: true,
        isDeleted: false,
        name: 'Segmento Proceso 1 y Proceso 2',
        size: 0.3,
        id: '1 2'),
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
                        'Segmentación',
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
                                    segmentationFuntion(position, value);
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
            itemCount: auxSegmentationList.length,
            itemBuilder: (context, position) {
              return SegmentationContainerWidget(
                process: auxSegmentationList[position],
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

  bool getIsDeletedSegmentation() {
    setState(() {
      isNotEmpty = false;
    });
    auxSegmentationList.forEach((element) {
      if (element.isDeleted) {
        setState(() {
          isNotEmpty = true;
          index = auxSegmentationList.indexWhere(
            (process) => process.isDeleted,
          );
        });
        return isNotEmpty;
      }
    });
  }

  bool findSpaceSegmentation(int position) {
    setState(() {
      findSpaceBool = false;
    });
    // derecha: Lista de procesos
    // izquierda: Lista gráfica de procesos
    auxSegmentationList.forEach((process) {
      if (process.isDeleted) {
        setState(() {
          findSpaceBool = true;
          index = auxSegmentationList.indexWhere(
            (process2) => process2.isDeleted,
          );
        });
        return isNotEmpty;
      }
    });
  }

  void segmentationFuntion(int position, bool value) {
    setState(() {
      findSpaceSegmentation(position);
      if (value) {
        processList[position].isSelected = value;
        if (findSpaceBool) {
          int aux = processList[position].size < 0.5
              ? 1
              : int.parse(processList[position].size.toStringAsFixed(0));

          {
            for (int i = 0; i < 3; i++) {
              auxSegmentationList.removeAt(index);
              auxSegmentationList.insert(
                index,
                Process(
                    id: processList[position].id,
                    isSelected: true,
                    isDeleted: false,
                    name: 'Segmento ${processList[position].name}',
                    size: i == 0
                        ? processList[position].codeSize
                        : i == 1
                            ? processList[position].dataSize
                            : processList[position].stackSize),
              );
              getIsDeletedSegmentation();
            }
          }
        } else {
          for (int i = 0; i < 3; i++) {
            auxSegmentationList.add(
              Process(
                  id: processList[position].id,
                  isSelected: true,
                  isDeleted: false,
                  name: 'Segmento ${processList[position].name}',
                  size: i == 0
                      ? processList[position].codeSize
                      : i == 1
                          ? processList[position].dataSize
                          : processList[position].stackSize),
            );

            getIsDeletedSegmentation();
          }
          // processList[position].isSelected = false;
          // Alert(
          //   context: context,
          //   type: AlertType.error,
          //   title: 'Memoria insuficiente',
          //   desc: 'El proceso no se puede agregar porque no hay más memoria.',
          //   buttons: [
          //     DialogButton(
          //       child: Text(
          //         'Ok',
          //         style: TextStyle(color: Palette.white, fontSize: 20),
          //       ),
          //       onPressed: () => Navigator.pop(context),
          //       width: 120,
          //     )
          //   ],
          // ).show();
        }
      } else {
        processList[position].isSelected = false;
        setState(() {
          auxSegmentationList.forEach((element) {
            if (element.id == processList[position].id) {
              element.isDeleted = true;
            }
          });
        });
      }
    });
  }
}
