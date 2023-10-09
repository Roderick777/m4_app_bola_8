import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Esta clase se encuentra destinada a establecer las comunicaciones con la api de openai
class OpenaiUtil {
  /// Este método permite realizar una pregunta a la api de openai a través del parámetro "question"
  static Future<String> ask(String question) async {
    OpenAI.apiKey = dotenv.env['OPEN_AI_API_KEY'] as String;

    final OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: question,
      temperature: 0.7,
      maxTokens: 500,
    );

    return completion.choices[0].text;
  }
}
