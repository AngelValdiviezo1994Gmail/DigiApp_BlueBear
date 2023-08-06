import 'package:auto_size_text/auto_size_text.dart';
import 'package:digi_app/models/index.dart';
import 'package:digi_app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class ListadoDigimons extends StatelessWidget {
  const ListadoDigimons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: DigimonService().getDigimons('20'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: AutoSizeText(
                '!UPS¡, intenta acceder después de unos minutos.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.hasData){

            DigimonModel  objDigimons = snapshot.data as DigimonModel;

            return Container(
              color: background,
              child: LayoutGrid(
                columnGap: 12,
                rowGap: 12,
                areas: '''
                  r R B B  B
                  r R Y Y  Y
                  y R Y Y  Y
                  y R g b yy
                ''',
                // A number of extension methods are provided for concise track sizing
                columnSizes: [1.0.fr, 3.5.fr, 1.3.fr, 1.3.fr, 1.3.fr],
                rowSizes: [
                  1.0.fr,
                  0.3.fr,
                  1.5.fr,
                  1.2.fr,
                ],
                children: [
                  // Column 1
                  gridArea('r').containing(Container(color: cellRed)),
                  gridArea('y').containing(Container(color: cellMustard)),
                  // Column 2
                  gridArea('R').containing(Container(color: cellRed)),
                  // Column 3
                  gridArea('B').containing(Container(color: cellBlue)),
                  gridArea('Y').containing(Container(color: cellMustard)),
                  gridArea('g').containing(Container(color: cellGrey)),
                  // Column 4
                  gridArea('b').containing(Container(color: cellBlue)),
                  // Column 5
                  gridArea('yy').containing(Container(color: cellMustard)),
                ],
              ),
            );

          }
          
          return Center(
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.3,
              color: Colors.transparent,
              child: Image.asset('assets/loadingEnrolApp.gif'),
            ),
          );
        }
    );
  }
}

class PietNamedAreasApp extends StatelessWidget {
  const PietNamedAreasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Layout Grid Desktop Example',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      builder: (context, child) => const ListadoDigimons(),
    );
  }
}