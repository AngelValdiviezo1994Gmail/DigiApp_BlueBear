
import 'package:auto_size_text/auto_size_text.dart';
import 'package:digi_app/models/index.dart';
import 'package:flutter/material.dart'; 

DigimonDetalleModel? objDigimon;
ColoresApp objColoresModals = ColoresApp();

//ignore: must_be_immutable
class ModalDetalleDigimon extends StatelessWidget {
  
  DigimonDetalleModel? objDigimonTmp;

  ModalDetalleDigimon({Key? key, required objDigimonTmp}) : super(key: key) {
    
    if(objDigimonTmp != null) {
      objDigimon = objDigimonTmp;
    }

  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SimpleDialogOption(
      onPressed: (){},
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              color: Colors.transparent,
              height: size.height * 0.08,
              width: size.width * 0.7,
              alignment: Alignment.center,
              child: AutoSizeText(
                objDigimon?.name ?? '', 
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontFamily: 'Montserrat', fontWeight: FontWeight.bold, ),
                maxLines: 2,
                presetFontSizes: const [28,26,24,22,20,18,16,14,12,10],
                textAlign: TextAlign.center,
              )
            ),

            const SizedBox(height: 5,),

            Container(
              color: Colors.transparent,
              width: 200,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(objDigimon!.images[0].href),
                    fit: BoxFit.contain
                  ),

                  borderRadius: const BorderRadius.all(Radius.circular(350)),
                  border: Border.all(
                    width: 2,
                    color: objColoresModals.digiNaranja,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 10,),

            Container(
              color: Colors.transparent,
              height: size.height * 0.09,
              width: size.width * 0.88,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          'Nivel',
                          style: TextStyle(color: objColoresModals.digiNaranja,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Atributo',
                          style: TextStyle(color: objColoresModals.digiNaranja,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Type',
                          style: TextStyle(color: objColoresModals.digiNaranja,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      if(objDigimon != null && objDigimon!.levels.length > 0)
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          '${objDigimon?.levels[0].level}',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      if(objDigimon == null || objDigimon!.levels.length == 0)
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          '---------',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      if(objDigimon != null && objDigimon!.attributes.length > 0)
                      Container(
                        width: size.width * 0.17,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          '${objDigimon?.attributes[0].attribute}',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      if(objDigimon == null || objDigimon!.attributes.length == 0)
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          '---------',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),

                      if(objDigimon != null && objDigimon!.types.length > 0)
                      Container(
                        width: size.width * 0.18,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          '${objDigimon?.types[0].type}',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),

                      if(objDigimon == null || objDigimon!.types.length == 0)
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          '---------',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                
                ],
              )
            ),

            const SizedBox(height: 10,),

            if(objDigimon != null && objDigimon!.fields.length > 0)
            Container(
              color: Colors.transparent,
              height: size.height * 0.05,
              width: size.width * 0.95,
              alignment: Alignment.center,              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  

                  AutoSizeText(
                    'Fields',
                    style: TextStyle(color: objColoresModals.digiNaranja,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                    maxLines: 2,
                    presetFontSizes: const [16,14,12,10],
                    textAlign: TextAlign.center,
                  ),
                  
                  
                  AutoSizeText(
                    '${objDigimon?.fields[0].field}',
                    style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                    maxLines: 1,
                    presetFontSizes: const [16,14,12,10],
                    textAlign: TextAlign.center,
                  ),
                  
                ],
              )
            ),

          ],
        )
      ),
    );
  }
}

