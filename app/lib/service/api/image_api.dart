import 'dart:convert';

import 'package:app/components/model/image_model.dart';
import 'package:app/service/api/api_config.dart';
import 'package:app/service/api/api_method.dart';

class ImageApi {

  Future<List<ImageModel>?> fetchImages()async{

    try{

      final response = await ApiMethod().methodGET('photos/?client_id=${ApiConfig.TOKEN}');

      if(response.statusCode == 200){

        List responseData = json.decode(response.body);

        return responseData.map((json) => ImageModel.fromJson(json)).toList();
      }

      print('Response statusCode ${response.statusCode}');

      return null;

    }catch(e){
      print('Error $e');
      return null;
    }
  }
}