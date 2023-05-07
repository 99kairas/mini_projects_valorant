import 'package:dio/dio.dart';
import 'package:mini_projects_valorant/constant/api_url.dart';
import 'package:mini_projects_valorant/model/list_agent_response.dart';

class AgentsAPI {
  Future<ListAgentsResponse> getListAgents() async {
    try {
      final response = await Dio().get('$url/agents');

      return ListAgentsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to Get Agents $e');
    }
  }
}
