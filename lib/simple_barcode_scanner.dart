import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SimpleBarcodeScan extends StatefulWidget {
  const SimpleBarcodeScan({Key? key}) : super(key: key);

  @override
  State<SimpleBarcodeScan> createState() => _SimpleBarcodeScanState();
}

class _SimpleBarcodeScanState extends State<SimpleBarcodeScan> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              },
              child: const Text('Open Scanner'),
            ),
            Text('Barcode Result: $result'),
          ],
        ),
      ),
    );
  }
}
