import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m4_app_bola_8/data/constants.dart';
import 'package:m4_app_bola_8/ui/components/texts/custom_text.component.dart';
import 'package:m4_app_bola_8/ui/view/home/components/home_background.component.dart';
import 'package:m4_app_bola_8/ui/view/response/response.view.dart';
import 'package:m4_app_bola_8/utils/openai.util.dart';
import 'package:roo_utils/utils/snackbar.util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final TextEditingController _questionController = TextEditingController(text: '');
  late AnimationController _eightAnimation;
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
    showSnackbar(
      context,
      const CustomText(
        'La pregunta debe ser coherente y tener al menos 10 caracteres.',
        style: TextStyle(color: Colors.white),
      ),
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

  @override
  void initState() {
    super.initState();

    _eightAnimation = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
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
              const SafeArea(child: Text('')),
              Center(
                child: Text(
                  'Haz una pregunta',
                  style: GoogleFonts.dancingScript(fontSize: 32, color: kPrimaryTextColor),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _questionController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Ingresa aquí tu pregunta', // Texto de ayuda
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: _isLoadingResponse
                    ? const SizedBox(
                        child: Center(child: CircularProgressIndicator(color: kPrimaryColor)),
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
              TextButton(
                onPressed: () async {
                  _eightAnimation.reset();
                  _eightAnimation.forward();
                },
                child: const CustomText(
                  'Refrescar',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
