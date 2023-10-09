import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:m4_app_bola_8/data/constants.dart';
import 'package:m4_app_bola_8/ui/view/response/components/response_background.component.dart';

class ResponseView extends StatefulWidget {
  final String response;
  const ResponseView({super.key, required this.response});

  @override
  State<ResponseView> createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Respuesta'),
  //     ),
  //     body: Center(
  //       child: Text(widget.response),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Respuesta'),
      ),
      body: ResponseBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                      color: const Color(0xFFDDEEFF),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.response,
                              textStyle: const TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 10000),
                          displayFullTextOnTap: false,
                          stopPauseOnTap: false,
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
