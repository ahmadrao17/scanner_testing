import 'package:flutter/material.dart';
import 'package:scanner_testing/barcode_scan2.dart';
import 'package:scanner_testing/barcode_scanner_scanbot.dart';
import 'package:scanner_testing/mobile_scanner_simple.dart';
import 'package:scanner_testing/scan_scanner.dart';
import 'package:scanner_testing/simple_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';
  String barcode = 'Tap  to scan';
  String resultScan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SimpleBarcodeScan())),
              child: const Text('Simple barcode Scanner'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MobileScannerSimple())),
              child: const Text('MobileScanner'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BarcodeScan2())),
              child: const Text('Barcode Scan 2'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ScanScanner())),
              child: const Text('Scan Scanner'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BarcodeScannerScanBot())),
              child: const Text('Scanbot Barcode Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
