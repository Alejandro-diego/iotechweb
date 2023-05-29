import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';

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

    page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
      brush: PdfSolidBrush(
        PdfColor(65, 104, 205),
      ),
    );

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 12);

    final DateFormat format = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br');
    final String invoiceNumber =
        'Data: ${format.format(DateTime.now())}';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings
    const String address = '''Bill To: \r\n\r\nAbraham Swearegin, 
        \r\n\r\nUnited States, California, San Mateo, 
        \r\n\r\n9920 BridgePointe Parkway, \r\n\r\n9365550136''';

    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
      page: page,
      bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
          contentSize.width + 30, pageSize.height - 120),
    );

    PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(
            30, 120, pageSize.width - (30), pageSize.height - 120))!;

    //Generate PDF grid.

    //Save the PDF document
    final List<int> bytes = document.saveSync();
    //Dispose the document.
    document.dispose();
    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'cv.pdf');
  }

  
}
