import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

void getHttp() async{
  try {
    Response response = await Dio().get("https://api.darksky.net/forecast/f6214911400ab8e00c632efca46630df/37.8267,-122.4233");
    print(response);
  } catch (e){
    print(e);
  }
}

@JsonSerializable(nullable: false)
class Currently {
  final String time;
  final String summary;
  final String nearestStormDistance;
  Currently(this.time, this.nearestStormDistance, this.summary);
  
}



