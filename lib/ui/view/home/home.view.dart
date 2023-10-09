import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m4_app_bola_8/data/constants.dart';
import 'package:m4_app_bola_8/ui/components/texts/custom_text.component.dart';
import 'package:m4_app_bola_8/ui/view/home/components/home_background.component.dart';
import 'package:m4_app_bola_8/ui/view/response/response.view.dart';
import 'package:m4_app_bola_8/utils/openai.util.dart';
import 'package:roo_utils/utils/snackbar.util.dart';
import 'package:shake/shake.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final TextEditingController _questionController =
      TextEditingController(text: '');
  late AnimationController _eightAnimation;
  late ShakeDetector _detector;
  bool _isLoadingResponse = false;

  void _getResponse(BuildContext context) {
    String question = _questionController.value.text;
    if (question.length >= 10) {
      setState(() => _isLoadingResponse = true);
      OpenaiUtil.ask(question)
          .then((response) => _goToResponse(context, response))
          .catchError((e) => _onResponseError());
    } else {
      _showValidationMessage();
    }
  }

  void _showValidationMessage() {
    const txt = 'Ingresa una pregunta coherente.';
    showSnackbar(
      context,
      const CustomText(txt, style: TextStyle(color: Colors.white)),
    );
  }

  void _onResponseError() {
    setState(() => _isLoadingResponse = false);
  }

  void _goToResponse(BuildContext context, String response) {
    setState(() => _isLoadingResponse = false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResponseView(response: response)),
    );
  }

  void _onShake() {
    FocusScope.of(context).unfocus();
    _questionController.text = '';
    _eightAnimation.reset();
    _eightAnimation.forward();
  }

  @override
  void initState() {
    super.initState();

    _eightAnimation = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _detector = ShakeDetector.autoStart(
      onPhoneShake: () => _onShake(),
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _detector.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeBackground(
        animation: _eightAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 10, color: Color(0xffe0e5ef))
                  ],
                ),
                child: Column(
                  children: [
                    const SafeArea(child: Text('')),
                    Center(
                      child: Text(
                        'Haz una pregunta',
                        style: GoogleFonts.dancingScript(
                          fontSize: 32,
                          color: kPrimaryTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextFormField(
                        controller: _questionController,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText:
                                'Ingresa aquí tu pregunta', // Texto de ayuda
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      child: _isLoadingResponse
                          ? const SizedBox(
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor)),
                            )
                          : ElevatedButton(
                              onPressed: () => _getResponse(context),
                              child: const CustomText(
                                'Preguntar',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                    const CustomText(
                      'Agita para volver a preguntar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
