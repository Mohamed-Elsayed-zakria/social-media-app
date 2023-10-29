import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../data/repository/search_screen_api.dart';
import '../../data/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController getSearchResultController = TextEditingController();

RxString getSearchResult = ''.obs;
String? barcodeScanRes;

Future<List<SearchModel>> getDataFuture() {
  return SearchScreenApi().getDataFuture();
}

Future<void> scanQr() async {
  FlutterBarcodeScanner.scanBarcode(
    "#E65100",
    "cancel",
    false,
    ScanMode.QR,
  ).then((value) {
    barcodeScanRes = value;
    if (barcodeScanRes != null && barcodeScanRes != "-1") {
      getSearchResultController.clear();
      getSearchResultController.text = barcodeScanRes!;
      getSearchResult.value = barcodeScanRes!;
    }
  });
}
