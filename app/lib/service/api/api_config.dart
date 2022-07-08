class ApiConfig {

  static const String TOKEN = 'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
  static const String END_POINT_URL = 'http://api.unsplash.com/';

  header() => {
        "Content-type": "application/json",
        "Accept": "application/json",
  };
}
