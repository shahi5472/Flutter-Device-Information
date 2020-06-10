import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String deviceInformation = 'Device Information';

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo;
  IosDeviceInfo iosInfo;

  fetchDeviceInfoAndroid() async {
    androidInfo = await deviceInfo.androidInfo;
    setState(() {
      deviceInformation = "Device: " +
          androidInfo.device +
          "\nManufacturer: " +
          androidInfo.manufacturer +
          "\nProduct: " +
          androidInfo.product +
          "\nAndroid Id: " +
          androidInfo.androidId +
          "\nBrand: " +
          androidInfo.brand +
          "\nProduct: " +
          androidInfo.product +
          "\nVersion: " +
          androidInfo.version.sdkInt.toString();
    });
  }

  fetchDeviceInfoIphone() async {
    iosInfo = await deviceInfo.iosInfo;
    setState(() {
      deviceInformation =  deviceInformation = "Device: " +
          iosInfo.name +
          "\nManufacturer: " +
          iosInfo.utsname.version +
          "\nProduct: " +
          iosInfo.model +
          "\nIphone Id: " +
          iosInfo.identifierForVendor +
          "\nBrand: " +
          iosInfo.localizedModel +
          "\nProduct: " +
          iosInfo.systemName +
          "\nVersion: " +
          iosInfo.systemVersion;
    });
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      fetchDeviceInfoAndroid();
      //deviceInformation += "\nAndroid \n";
    }
    if (Platform.isIOS) {
      fetchDeviceInfoIphone();
      //deviceInformation += "\nIphone \n";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Device Information'),
        ),
        body: Center(
          child: Container(
            child: Text(deviceInformation),
          ),
        ),
      ),
    );
  }
}
