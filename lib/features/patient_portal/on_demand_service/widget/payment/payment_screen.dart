import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPaymentScreen extends StatefulWidget {
  final String initialURl;

  const WebPaymentScreen({super.key, required this.initialURl});

  @override
  State<WebPaymentScreen> createState() => _WebPaymentScreenState();
}

class _WebPaymentScreenState extends State<WebPaymentScreen> {
  WebViewController controller = WebViewController();
  bool isLoading = true;
  @override
  void initState() {
    initController();
    super.initState();
  }

  initController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: ((url) {
            setState(() {
              isLoading = false;
            });
          }),
          onNavigationRequest: (NavigationRequest navigation) async {
            log("URL :: ${navigation.url}");
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialURl));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Scaffold(
        appBar: AppBar(

            centerTitle: false,
            title: Text("Payment"),
        ),
        body: Stack(
            alignment: Alignment.center,
            children: [WebViewWidget(controller: controller)]),);
  }
}
