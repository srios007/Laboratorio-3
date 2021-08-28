import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const txtTitle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
    const txtLabel = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
    );
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      margin: const EdgeInsets.symmetric(vertical: 50),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height - 200,
      width: MediaQuery.of(context).size.width,
      color: Palette.white,
      child: Center(
        child: Container(
          height: 500,
          width: 400,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Palette.bgColor,
            border: Border.all(
              color: Palette.black,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contenido',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              Text(
                'Punto 1',
                style: txtTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Particiones estáticas fijas',
                  style: txtLabel,
                ),
              ),
              Text(
                'Punto 2',
                style: txtTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Particiones estáticas variables',
                  style: txtLabel,
                ),
              ),
              Text(
                'Punto 3',
                style: txtTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Particiones dinámicas (con y sin compactación)',
                  style: txtLabel,
                ),
              ),
              Text(
                'Punto 4',
                style: txtTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Segmentación',
                  style: txtLabel,
                ),
              ),
              Text(
                'Punto 5',
                style: txtTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Paginación',
                  style: txtLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
