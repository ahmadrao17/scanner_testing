import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:flutter/material.dart';

class BarcodeScannerScanBot extends StatefulWidget {
  const BarcodeScannerScanBot({super.key});

  @override
  State<BarcodeScannerScanBot> createState() => _BarcodeScannerScanBotState();
}

class _BarcodeScannerScanBotState extends State<BarcodeScannerScanBot> {
  @override
  void initState() {
    var config = ScanbotSdkConfig(licenseKey: "", loggingEnabled: true);

    ScanbotBarcodeSdk.initScanbotSdk(config);
    super.initState();
  }

  BarcodeItem? scannedBarcode;

  Future<void> _barcodeScanner() async {
    var config = BarcodeScannerConfiguration(
        barcodeFormats: BarcodeFormat.values,
        topBarBackgroundColor: Colors.blueAccent,
        finderTextHint: "Please align a barcode in the frame to scan it",
        cancelButtonTitle: "Cancel",
        flashButtonHidden: false);
    var result = await ScanbotBarcodeSdk.startBarcodeScanner(config);
    setState(() {
      scannedBarcode = result.barcodeItems.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            scannedBarcode != null
                ? Text(
                    'Scanned Barcode: ${scannedBarcode?.barcodeFormat?.name} : ${scannedBarcode!.text}')
                : const Text("Hello Scanbot"),
            ElevatedButton(
              onPressed: _barcodeScanner,
              child: const Text('Open Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
