import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class appInfo extends StatefulWidget {
  const appInfo({Key? key}) : super(key: key);

  @override
  State<appInfo> createState() => _appInfoState();
}

class _appInfoState extends State<appInfo> {
  late PackageInfo _packageInfo;

  @override
  void initState() {
    super.initState();
    _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown',
    );
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  final Uri _url = Uri.parse('https://ajulkjose.in');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Calculator",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            // ignore: unnecessary_null_comparison
            _packageInfo != null
                ? Text(
                    "Version ${_packageInfo.version}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                : const CircularProgressIndicator(), // Show a loader until package info is fetched
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Developed by ",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                GestureDetector(
                  onTap: _launchUrl,
                  child: Text(
                    "Ajul K Jose",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
