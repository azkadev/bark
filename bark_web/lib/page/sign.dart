// ignore_for_file: constant_identifier_names

import "package:bark_web/core/core.dart";
import "package:bark_web/flutter/image_flutter.dart";
import "package:bark_web/language/language.dart";
import "package:bark_web/page/page.dart";
import "package:cool_alert/cool_alert.dart";
import 'package:flutter/material.dart';

import "package:galaxeus_lib_flutter/galaxeus_lib_flutter.dart";
import "package:pinput/pinput.dart";

import "sign_o_auth.dart";

enum SignPageWaitType {
  username,
  code,
  password,
  secret_word,
  code_sign_in,
  code_sign_up,
  password_sign_in,
  password_sign_up,
  secret_word_sign_up,
}

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> with TickerProviderStateMixin {
  final List<String> sign_tabs = [
    "Sign",
    "Verify",
    "Reset Password",
  ];
  late TabController signTabController = TabController(
    length: sign_tabs.length,
    vsync: this,
  );
  final List<String> verify_tabs = [
    "Secret Word",
    "Payment",
    "Face",
  ];
  late TabController verifyTabController = TabController(
    length: verify_tabs.length,
    vsync: this,
  );

  TextEditingController textEditingController = TextEditingController();
  TextEditingController reasonEditingController = TextEditingController();
  TextEditingController keyEditingController = TextEditingController();

  bool is_obscure_text = true;
  SignPageWaitType signPageWaitType = SignPageWaitType.username;
  List<int> code = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: context.width,
            minHeight: context.height,
          ),
          child: autoPageSignBody(),
        ),
      ),
    );
  }

  Widget autoPageSignBody() {
    if (signPageWaitType == SignPageWaitType.code) {
      return codePageSignBody();
    }
    if (signPageWaitType == SignPageWaitType.password) {
      return passwordPageSignBody();
    }
    return pageSignBody();
  }

  Widget passwordPageSignBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  signPageWaitType = SignPageWaitType.username;
                });
              },
              child: const Icon(Icons.arrow_back),
            ),
            const Text(
              "BarkWeb",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.more_horiz_outlined),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 100,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: codeFormField(
                  labelText: "Two Password",
                  hintText: "Password 1235",
                  controller: textEditingController,
                  onChanged: (String data) {},
                ),
              ),
              signButton(
                width: context.width,
                text: "Send Password",
                margin: const EdgeInsets.all(20),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onPressed: () async {
                  ValidationData validationData = validation(
                      data: textEditingController.text,
                      validationDataType: ValidationDataType.password);
                  if (validationData.message != null) {
                    //
                    await CoolAlert.show(
                      context: context,
                      type: CoolAlertType.info,
                      title: "Password",
                      text: validationData.message,
                    );
                    return;
                  }
                  setState(() {
                    textEditingController.clear();
                  });
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget codePageSignBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  signPageWaitType = SignPageWaitType.username;
                });
              },
              child: const Icon(Icons.arrow_back),
            ),
            const Text(
              "BarkWeb",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.more_horiz_outlined),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 100,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: codePinFormField(
                  labelText: "Code",
                  hintText: "12345",
                  controller: textEditingController,
                  onChanged: (String data) {},
                ),
              ),
              signButton(
                width: context.width,
                text: "Send Code",
                margin: const EdgeInsets.all(20),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onPressed: () async {
                  ValidationData validationData = validation(
                      data: textEditingController.text,
                      validationDataType: ValidationDataType.code);
                  if (validationData.message != null) {
                    //
                    await CoolAlert.show(
                      context: context,
                      type: CoolAlertType.info,
                      title: "Code",
                      text: validationData.message,
                    );
                    return;
                  }

                  setState(() {
                    textEditingController.clear();
                    signPageWaitType = SignPageWaitType.password;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget codeFormField({
    String? hintText,
    String? labelText,
    Color color = Colors.white,
    TextEditingController? controller,
    String? Function(String? data)? validator,
    bool isEnable = true,
    void Function()? onPressed,
    void Function(String String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.all(20),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget codePinFormField({
    String? hintText,
    String? labelText,
    Color color = Colors.white,
    TextEditingController? controller,
    String? Function(String? data)? validator,
    bool isEnable = true,
    void Function()? onPressed,
    void Function(String String)? onChanged,
  }) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(153, 153, 153, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      length: 5,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      onChanged: onChanged,
      readOnly: !isEnable,
      controller: controller,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
    );
    // return TextField(
    //   controller: controller,
    //   cursorColor: Colors.black,
    //   style: const TextStyle(
    //     color: Colors.black,
    //   ),
    //   textAlign: TextAlign.center,
    //   onChanged: onChanged,
    //   decoration: InputDecoration(
    //     hintText: hintText,
    //     labelText: labelText,
    //     contentPadding: const EdgeInsets.all(20),
    //     labelStyle: const TextStyle(
    //       color: Colors.black,
    //       fontSize: 14.0,
    //       fontWeight: FontWeight.w400,
    //     ),
    //     hintStyle: const TextStyle(
    //       color: Colors.grey,
    //       fontSize: 14.0,
    //     ),
    //     disabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.grey.shade200,
    //         width: 2,
    //       ),
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.grey.shade200,
    //         width: 2,
    //       ),
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     floatingLabelStyle: const TextStyle(
    //       color: Colors.black,
    //       fontSize: 18.0,
    //     ),
    //     focusedErrorBorder: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.grey.shade200,
    //         width: 1.5,
    //       ),
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     errorBorder: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.grey.shade200,
    //         width: 1.5,
    //       ),
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Color.fromARGB(255, 0, 0, 0),
    //         width: 1.5,
    //       ),
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //   ),
    // );
  }

  Widget pageSignBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ImageFlutter.auto(
                image: null,
                default_image: "assets/icons/ghost.png",
              ).image,
            ),
          ),
        ),
        TabBar(
          indicatorColor: const Color.fromARGB(255, 255, 14, 14),
          controller: signTabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: const Color.fromARGB(255, 252, 252, 252),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(49, 0, 0, 0),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          labelPadding: const EdgeInsets.all(15),
          splashBorderRadius: BorderRadius.circular(15),
          unselectedLabelColor: Colors.grey,
          onTap: (value) {
            setState(() {});
          },
          tabs: sign_tabs.map<Widget>((e) {
            return Text(
              e,
              style: const TextStyle(
                color: Colors.black,
              ),
            );
          }).toList(),
        ),
        autoBody(),
      ],
    );
  }

  Widget autoBody() {
    if (signTabController.index == 1) {
      return verifyBody();
    }
    if (signTabController.index == 2) {
      return resetPasswordBody();
    }
    return signBody();
  }

  Widget signBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        usernameForm(),
        passwordForm(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: signInAndSignUpButton(),
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            List<Widget> children() => [
                  InkWell(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: SignOAuth(
                                  languageApp: LanguageApp(
                                      languageCodeType: LanguageCodeType.id),
                                  signOAuthType: SignOAuthType.google,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageFlutter.auto(
                            image: null,
                            default_image: "assets/icons/chrome.png",
                          ).image,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: SignOAuth(
                                  languageApp: LanguageApp(
                                      languageCodeType: LanguageCodeType.id),
                                  signOAuthType: SignOAuthType.meesagee,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageFlutter.auto(
                            image: null,
                            default_image: "assets/icons/ghost.png",
                          ).image,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: SignOAuth(
                                  languageApp: LanguageApp(
                                      languageCodeType: LanguageCodeType.id),
                                  signOAuthType: SignOAuthType.telegram,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageFlutter.auto(
                            image: null,
                            default_image: "assets/icons/telegram.png",
                          ).image,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: SignOAuth(
                                  languageApp: LanguageApp(
                                      languageCodeType: LanguageCodeType.id),
                                  signOAuthType: SignOAuthType.twitter,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageFlutter.auto(
                            image: null,
                            default_image: "assets/icons/twitter.png",
                          ).image,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: SignOAuth(
                                  languageApp: LanguageApp(
                                      languageCodeType: LanguageCodeType.id),
                                  signOAuthType: SignOAuthType.whatsapp,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ImageFlutter.auto(
                            image: null,
                            default_image: "assets/icons/whatsapp.png",
                          ).image,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                ];
            if (context.width < 300) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: children(),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children(),
            );
          },
        ),
      ],
    );
  }

  Widget verifyBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        usernameForm(
          readOnly: true,
        ),
        passwordForm(
          readOnly: true,
        ),
        TabBar(
          indicatorColor: const Color.fromARGB(255, 255, 14, 14),
          controller: verifyTabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: const Color.fromARGB(255, 252, 252, 252),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(49, 0, 0, 0),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          labelPadding: const EdgeInsets.all(15),
          splashBorderRadius: BorderRadius.circular(15),
          unselectedLabelColor: Colors.grey,
          onTap: (value) {
            setState(() {});
          },
          tabs: verify_tabs.map<Widget>((e) {
            return Text(
              e,
              style: const TextStyle(
                color: Colors.black,
              ),
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: signButton(
            width: context.width,
            text: "Verify",
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            onPressed: () async {
              ValidationData validationDataPassword = validation(
                  data: keyEditingController.text,
                  validationDataType: ValidationDataType.password);

              ValidationData validationData = validation(
                  data: textEditingController.text,
                  validationDataType: ValidationDataType.username);

              if (validationData.message != null) {
                //
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username",
                  text: validationData.message,
                );
                return;
              }
              if (validationDataPassword.message != null) {
                //
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password",
                  text: validationDataPassword.message,
                );
                return;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget resetPasswordBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        usernameForm(),
        Flexible(
          child: reasonForm(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: signButton(
            width: context.width,
            text: "Reset Password",
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            onPressed: () async {
              ValidationData validationData = validation(
                data: textEditingController.text,
                validationDataType: ValidationDataType.username,
              );
              if (validationData.message != null) {
                ///
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username",
                  text: validationData.message,
                );
                return;
              }
              ValidationData validationDataReason = validation(
                data: reasonEditingController.text,
                validationDataType: ValidationDataType.reason,
              );
              if (validationDataReason.message != null) {
                ///
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Reason",
                  text: validationDataReason.message,
                );
                return;
              }

              setState(() {
                textEditingController.clear();
                reasonEditingController.clear();
                signPageWaitType = SignPageWaitType.code;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget signInAndSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: signButton(
            text: "Sign In",
            margin: const EdgeInsets.only(
              left: 10,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
              bottomLeft: Radius.circular(
                20,
              ),
            ),
            onPressed: () async {
              ValidationData validationDataPassword = validation(
                  data: keyEditingController.text,
                  validationDataType: ValidationDataType.password);

              ValidationData validationData = validation(
                  data: textEditingController.text,
                  validationDataType: ValidationDataType.username);
              if (validationData.message != null) {
                //
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username",
                  text: validationData.message,
                );
                return;
              }

              if (validationDataPassword.message != null) {
                //
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password",
                  text: validationDataPassword.message,
                );
                return;
              }

              setState(() {
                textEditingController.clear();
                keyEditingController.clear();
                signPageWaitType = SignPageWaitType.code;
              });
            },
          ),
        ),
        Expanded(
          child: signButton(
            text: "Sign Up",
            margin: const EdgeInsets.only(
              right: 10,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                20,
              ),
              bottomRight: Radius.circular(
                20,
              ),
            ),
            onPressed: () async {
              ValidationData validationDataPassword = validation(
                  data: keyEditingController.text,
                  validationDataType: ValidationDataType.password);

              ValidationData validationData = validation(
                  data: textEditingController.text,
                  validationDataType: ValidationDataType.username);

              if (validationData.message != null) {
                //
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username",
                  text: validationData.message,
                );
                return;
              }
              if (validationDataPassword.message != null) {
                //
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password",
                  text: validationDataPassword.message,
                );
                return;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget usernameForm({
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: textFormField(
        hintText: "username huruf saja",
        labelText: "Username",
        controller: textEditingController,
        readOnly: readOnly,
        validator: (String? data) {
          ValidationData validationData = validation(
              data: data, validationDataType: ValidationDataType.username);
          return validationData.message;
        },
      ),
    );
  }

  Widget reasonForm() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: reasonFormField(
        hintText: "",
        labelText: "Reason",
        controller: reasonEditingController,
        validator: (String? data) {
          ValidationData validationDataReason = validation(
            data: reasonEditingController.text,
            validationDataType: ValidationDataType.reason,
          );

          return validationDataReason.message;
        },
      ),
    );
  }

  Widget passwordForm({bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: keyFormField(
        hintText: "password kamu",
        labelText: "Password",
        is_obscure_text: is_obscure_text,
        controller: keyEditingController,
        readOnly: readOnly,
        validator: (String? data) {
          ValidationData validationData = validation(
              data: data, validationDataType: ValidationDataType.password);
          return validationData.message;
        },
        onPressed: () {
          setState(() {
            is_obscure_text = !is_obscure_text;
          });
        },
      ),
    );
  }

  Widget signButton({
    double? width,
    required EdgeInsets margin,
    required BorderRadius borderRadius,
    required String text,
    required void Function()? onPressed,
  }) {
    return Container(
      width: width,
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }

  Widget reasonFormField({
    String? hintText,
    String? labelText,
    Color color = Colors.white,
    TextEditingController? controller,
    String? Function(String? data)? validator,
  }) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: const TextStyle(
        color: Colors.black,
      ),
      maxLines: 4,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(
          10,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget textFormField({
    String? hintText,
    String? labelText,
    Color color = Colors.white,
    TextEditingController? controller,
    String? Function(String? data)? validator,
    bool readOnly = false,
  }) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      readOnly: readOnly,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.0),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        prefixIcon: const Icon(
          Icons.people,
          color: Colors.black,
          size: 18,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget keyFormField({
    String? hintText,
    String? labelText,
    Color color = Colors.white,
    TextEditingController? controller,
    String? Function(String? data)? validator,
    bool is_obscure_text = true,
    bool readOnly = false,
    void Function()? onPressed,
  }) {
    return TextFormField(
      cursorColor: Colors.black,
      readOnly: readOnly,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: const TextStyle(
        color: Colors.black,
      ),
      obscureText: is_obscure_text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.0),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        suffixIcon: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: const Icon(
            Icons.remove_red_eye,
            color: Colors.black,
            size: 18,
          ),
        ),
        prefixIcon: const Icon(
          Icons.key,
          color: Colors.black,
          size: 18,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
