import 'package:trivia_app/core/constants/urls.dart';
import 'package:trivia_app/core/services/api_service.dart';
import 'package:trivia_app/data/models/trivia_model.dart';

class ConvertJsonToTriviaModel {
  ApiService apiService = ApiService();

  Future jsonToTrivia() async {
    try {
      final data = await apiService.getApiData(url);
      // print(data);
      return TriviaModel.fromJson(data);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
