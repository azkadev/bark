import 'package:bark_web/language/extension/sign.dart';
import 'package:bark_web/language/language.dart';
import 'package:bark_web/page/page.dart';
import 'package:flutter/material.dart';
import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:galaxeus_lib_flutter/galaxeus_lib_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum SignOAuthType {
  google,
  meesagee,
  telegram,
  twitter,
  whatsapp,
}

class SignOAuth extends StatefulWidget {
  final LanguageApp languageApp;
  final SignOAuthType signOAuthType;
  const SignOAuth({
    super.key,
    required this.languageApp,
    required this.signOAuthType,
  });

  @override
  State<SignOAuth> createState() => _SignOAuthState();
}

class _SignOAuthState extends State<SignOAuth> {
  String loading_text = "";
  bool is_loading = true;

  bool is_error = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) async {
      await task();
    });
  }

  Future<void> task() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      is_loading = false;
      loading_text = "Initialized";
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading_text = "Start Connect App Message...";
    });
    await Future.delayed(const Duration(seconds: 2));
    if (widget.signOAuthType == SignOAuthType.meesagee) {
      try {
        await get(Uri.parse("http://localhost:9000"));
      } catch (e) {
        print(e);
        setState(() {
          is_error = true;
        });
        return;
      }
    }
    setState(() {
      loading_text = "Get Socmed Automation Start...";
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading_text = "Starting New Thread Automation Socmed...";
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading_text = "Succes login ${widget.signOAuthType.name}...";
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading_text = "Termikasi sudah mau menunggu...";
    });
    await Future.delayed(const Duration(seconds: 10));
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    await Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return const HomePage();
      },
    ));
    return;
  }

  Future<void> reset() async {
    setState(() {
      is_loading = false;
      is_error = false;
      loading_text = "";
      loading_text = "Initialized";
    });
    return await task();
  }

  @override
  Widget build(BuildContext context) {
    print(context.width);
    if (is_error) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Tidak Bisa Menemukan",
                              style: context.titleSmall,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: MaterialButton(
                              onPressed: () async {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                }
                              },
                              minWidth: 0,
                              child: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.languageApp
                                .sign_with_msg_error_not_found_app_or_server(),
                            style: context.titleSmall,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.green),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: MaterialButton(
                              onPressed: () async {
                                await reset();
                              },
                              child: Center(
                                child: Text(
                                  'Try Again',
                                  style: context.titleSmall,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.green),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: MaterialButton(
                              onPressed: () async {
                                if (dart.isWeb) {
                                  await launchUrl(
                                    Uri.parse("http://localhost:9000"),
                                    webViewConfiguration:
                                        const WebViewConfiguration(headers: {
                                      "client_app_unique_id": "sa",
                                    }),
                                  );
                                } else if (dart.isAndroid) {
                                  try {
                                    await launchUrl(
                                      Uri.parse("http://localhost:9000"),
                                      mode: LaunchMode.inAppWebView,
                                      webViewConfiguration:
                                          const WebViewConfiguration(headers: {
                                        "client_app_unique_id": "sa",
                                      }),
                                    );
                                  } catch (e) {
                                    await launchUrl(
                                      Uri.parse("http://localhost:9000"),
                                      webViewConfiguration:
                                          const WebViewConfiguration(headers: {
                                        "client_app_unique_id": "sa",
                                      }),
                                    );
                                  }
                                } else {
                                  await launchUrl(
                                    Uri.parse("http://localhost:9000"),
                                    webViewConfiguration:
                                        const WebViewConfiguration(headers: {
                                      "client_app_unique_id": "sa",
                                    }),
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Download App',
                                  style: context.titleSmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
    if (is_loading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 0,
                minWidth: 0,
                maxHeight: 100,
                maxWidth: 100,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.all(10),
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(10),
            child: Text(
              loading_text,
              style: context.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
