import 'package:dio/dio.dart';
import 'package:mini_projects_valorant/constant/api_url.dart';
import 'package:mini_projects_valorant/model/detail_agents_response.dart';
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

  Future<DetailAgentsResponse> getDetailAgents(String agentID) async {
    try {
      final response = await Dio().get('$url/agents/$agentID');

      return DetailAgentsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to Get Detail Agent $e');
    }
  }
}
