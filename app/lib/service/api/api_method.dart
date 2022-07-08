import 'package:app/service/api/api_config.dart';
import 'package:http/http.dart' as http;

class ApiMethod {

  // GET
  methodGET(url) async {
    print('url: ${Uri.parse(ApiConfig.END_POINT_URL + url)}');

    return await http.get(Uri.parse(ApiConfig.END_POINT_URL + url), headers: ApiConfig().header());
  }
}