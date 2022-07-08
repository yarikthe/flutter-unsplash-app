import 'package:http/http.dart' as http;

class ApiMethod {

  static const String END_POINT_URL = 'http://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

    header() => {
    "Content-type": "application/json",
    "Accept": "application/json",
  };

  // GET
  methodGET() async {
    print('url: ${Uri.parse(END_POINT_URL)}');

    return await http.get(Uri.parse(END_POINT_URL), headers: header());
  }
}