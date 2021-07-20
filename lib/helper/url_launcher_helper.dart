import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();
  static UrlLauncherHelper urlLauncherHelper = UrlLauncherHelper._();
  launchURL(String url, {bool universalLinksOnly}) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  openWebPath() {
    try {
      launchURL('https://pub.dev/packages/url_launcher');
    } on Exception catch (e) {
      print(e);
    }
  }

  makeCall() {
    try {
      launchURL('tel:0595967127');
    } on Exception catch (e) {
      print(e);
    }
  }

  sendSMS() {
    try {
      launchURL('sms:0595967127');
    } on Exception catch (e) {
      print(e);
    }
  }

  sendEmail() {
    try {
      launchURL('mailto:latifa.masri1998@gmail.com');
    } on Exception catch (e) {
      print(e);
    }
  }

  openWhatsupChat() {
    try {
      launchURL('https://wa.me/+972595967127');
    } on Exception catch (e) {
      print(e);
    }
  }

  openInstegramPage() {
    try {
      launchURL(
        'https://www.instagram.com/latifamasri98/',
        universalLinksOnly: true,
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  openFacebookPage() {
    try {
      launchURL(
        'https://www.facebook.com/',
        universalLinksOnly: true,
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  shareContent() {
    Share.share('hello, how are you?');
  }

  // shareImages() {
  //   Share.shareFiles(["C:/Users/hp/Pictures/PSEU-portal-img/meberpage2.PNG"],
  //       text: 'member detailes');
  // }
  shareImages() async {
    try {
      final ByteData bytes = await rootBundle.load('assets/images/image.jpg');
      final Uint8List list = bytes.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      // String filePath = join(tempDir.path, '/image.jpg');
      // File file = File(filePath);

      // final file = await new File('${tempDir.path}/image.jpg').create();
      // file.writeAsBytesSync(list);
      Share.shareFiles(["${tempDir.path}/image.jpg"]);
      // final channel = const MethodChannel('channel:me.albie.share/share');
      // channel.invokeMethod('shareFile', 'image.jpg');
    } catch (e) {
      print('Share error: $e');
    }
  }
}
