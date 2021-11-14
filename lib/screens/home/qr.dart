import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/screens/details/details_qr_screen.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  GlobalKey qrKey = GlobalKey();
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Positioned(
            bottom: 0,
            // left: 20,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                String s = 'off';
                                if (snapshot.data) s = "no";
                                return Text('Flash: ${s}');
                              },
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white.withOpacity(.3),
                  ),
                  alignment: Alignment(0.2, 0.0),
                  child: Icon(
                    helpEn(context)
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black.withOpacity(.87),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData;
        int i = -1;
        if (isNumeric(result.code)) {
          i = int.parse(result.code);
        }
        print(i);
        if (isNumeric(result.code) && i != -1) {
          print("===============================================");
          print(result.code);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => DetailsQrScreen(
                    i,
                  )));
          controller.pauseCamera();
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
