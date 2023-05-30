import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:intl/intl.dart';

import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../save_louch.dart';
import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const AreaInfoText(
                      title: "Pais",
                      text: "Brasil",
                    ),
                    const AreaInfoText(
                      title: "Cidade",
                      text: "Espumoso",
                    ),
                    const AreaInfoText(
                      title: "Idade",
                      text: "47",
                    ),
                    const Skills(),
                    const SizedBox(height: defaultPadding),
                    const Coding(),
                    const Knowledges(),
                    const Divider(),
                    const SizedBox(height: defaultPadding / 2),
                    TextButton(
                      onPressed: () {
                        generateCv();
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: defaultPadding),
                      color: const Color(0xFF24242E),
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              _launchUr1(
                                Uri.parse(
                                    'https://www.linkedin.com/in/alejandro-heredia-3b6085245/'),
                              );
                            },
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUr1(
                                Uri.parse(
                                    'https://www.instagram.com/alejandro.heredia.144/'),
                              );
                            },
                            icon: SvgPicture.asset(
                                "assets/icons/instagram-icon.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              _launchUr1(
                                Uri.parse(
                                    'https://wa.me/message/LAFIIDW2QQZOP1'),
                              );
                            },
                            icon: SvgPicture.asset("assets/icons/whats.svg"),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUr1(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> generateCv() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
      pen: PdfPen(
        PdfColor(142, 170, 219),
      ),
    );
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(
        PdfColor(60, 60, 60),
      ),
      bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90),
    );

    page.graphics.drawString(
      'Alejandro Diego Heredia',
      PdfStandardFont(PdfFontFamily.courier, 25),
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
      format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
    );

    page.graphics.drawString(
      'App Movile Developer',
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      brush: PdfBrushes.aqua,
      bounds: Rect.fromLTWH(100, 23, pageSize.width - 90, 90),
      format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
    );

    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
      brush: PdfSolidBrush(
        PdfColor(65, 104, 205),
      ),
    );

    page.graphics.drawImage(
      PdfBitmap(
        await _readImage(),
      ),
      Rect.fromLTWH(400, 0, 100, 90),
    );

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 12);

    final DateFormat format = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br');
    final String data = 'Data: ${format.format(DateTime.now())}';
    final Size contentSize = contentFont.measureString(data);
    // ignore: leading_newlines_in_multiline_strings
    String address =
        '''Endereço :  \r\nAv. Ângelo Macalos 256 ,Ap 106,\r\nBrasil, Rio Grade do Sul, Espumoso,  \r\nCEP : 99400-000''';
    String contato =
        '''Telefone : +55 54 9 96933976 \r\nLinkedIn : alejandro-heredia-3b6085245,\r\nE-mail : alejandro.maxcom@gmail.com,  \r\nPortafolio : https://alejandroheredia.codemagic.app/''';
    String obejtivo = '''Objetivo de Carreira :
    Desenvolvedor de software com capacidade comprovada de adaptação tanto em ambientes autoiniciantes quanto colaborativos, mantendo o foco na obtenção de resultados de alta qualidade em prazos rígidos.
    Ansioso para obter uma posição desafiadora em uma empresa de prestígio como sua firma, que expandirá meu aprendizado e desenvolverá minhas habilidades de desenvolvedor. 
    
    ''';
    String skill = '''Habilidade : 
    - Dart/Flutter
    - SwiftUI
    - C++    
       ''';

    String knowledges = '''Conhecimentos : 
    - Firebase
    - Iot , Atmega, ESP32, ESP8266
    - Electronica Digital
    - DashBoard 
    - OS Linux  
    - TCP IpTables
    - Montagem de Servers
    - Corel Design
       ''';

    PdfTextElement(text: data, font: contentFont).draw(
      page: page,
      bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
          contentSize.width + 30, pageSize.height - 120),
    );

    PdfTextElement(text: address, font: contentFont).draw(
      page: page,
      bounds:
          Rect.fromLTWH(30, 120, pageSize.width - (30), pageSize.height - 120),
    )!;
    PdfTextElement(text: contato, font: contentFont).draw(
      page: page,
      bounds:
          Rect.fromLTWH(30, 175, pageSize.width - (30), pageSize.height - 120),
    )!;

    PdfTextElement(text: obejtivo, font: contentFont).draw(
      page: page,
      bounds:
          Rect.fromLTWH(30, 235, pageSize.width - (30), pageSize.height - 120),
    )!;
    PdfTextElement(text: skill, font: contentFont).draw(
      page: page,
      bounds:
          Rect.fromLTWH(30, 335, pageSize.width - (30), pageSize.height - 120),
    )!;
    PdfTextElement(text: knowledges, font: contentFont).draw(
      page: page,
      bounds:
          Rect.fromLTWH(30, 400, pageSize.width - (30), pageSize.height - 120),
    )!;

    //Generate PDF grid.

    //Save the PDF document
    final List<int> bytes = document.saveSync();
    //Dispose the document.
    document.dispose();
    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'AlejandroHerediaCV.pdf');
  }

  Future<Uint8List> _readImage() async {
    final data = await rootBundle.load('assets/images/ale_small.png');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
