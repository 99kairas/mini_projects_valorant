import 'package:dio/dio.dart';
import 'package:mini_projects_valorant/constant/api_url.dart';
import 'package:mini_projects_valorant/model/detail_weapon_response.dart';
import 'package:mini_projects_valorant/model/list_weapon_response.dart';

class WeaponAPI {
  Future<ListWeaponResponse> getListWeapon() async {
    try {
      final response = await Dio().get('$url/weapons');

      return ListWeaponResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to Get Weapons $e');
    }
  }

  Future<DetailWeaponResponse> getDetailWeapon(String weaponID) async {
    try {
      final response = await Dio().get('$url/weapons/$weaponID');

      return DetailWeaponResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to Get Detail Weapons $e');
    }
  }
}
