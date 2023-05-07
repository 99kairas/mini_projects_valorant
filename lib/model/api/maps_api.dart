import 'package:dio/dio.dart';
import 'package:mini_projects_valorant/constant/api_url.dart';
import 'package:mini_projects_valorant/model/list_maps_response.dart';

class MapsAPI {
  Future<ListMapsResponse> getListMaps() async {
    try {
      final response = await Dio().get('$url/maps');

      return ListMapsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to Get Maps $e');
    }
  }
}
