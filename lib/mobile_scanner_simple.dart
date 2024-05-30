import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerSimple extends StatefulWidget {
  const MobileScannerSimple({super.key});

  @override
  State<MobileScannerSimple> createState() => _MobileScannerSimpleState();
}

class _MobileScannerSimpleState extends State<MobileScannerSimple> {
  String resultScan = '';
  @override
  Widget build(BuildContext context) {
    Stopwatch stopwatch = Stopwatch()..start();
    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Tap to scan"),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MobileScanner(
                          controller: MobileScannerController(
                              detectionSpeed: DetectionSpeed.noDuplicates,
                              returnImage: true),
                          onDetect: (capture) {
                            Stopwatch().start();
                            final List<Barcode> barcodes = capture.barcodes;
                            final Uint8List? image = capture.image;
                            if (barcodes.isNotEmpty) {
                              setState(() {
                                resultScan = barcodes.first.rawValue!;
                              });
                              Navigator.of(context).pop();
                              stopwatch.stop();
                              log('time elapsed ${stopwatch.elapsed}');
                            }
                            if (image != null) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          Text(barcodes.first.rawValue ?? ""),
                                      content: Image(image: MemoryImage(image)),
                                      actions: [
                                        ElevatedButton(
                                            onPressed:
                                                Navigator.of(context).pop,
                                            child: const Text("OK"))
                                      ],
                                    );
                                  });
                            }
                          },
                        )))),
            Text('Result: $resultScan')
          ],
        ),
      ),
    );
  }
}
