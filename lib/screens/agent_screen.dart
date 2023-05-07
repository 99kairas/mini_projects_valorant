import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/model/api/agent_api.dart';

import 'theme/font_style.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AgentsAPI().getListAgents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var agentData = snapshot.data;
          return RefreshIndicator(
            onRefresh: () async {
              return Future<void>.delayed(const Duration(milliseconds: 300));
            },
            child: ListView.builder(
              itemCount: agentData!.data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var agent = agentData.data[index];

                return agent.isPlayableCharacter as bool
                    ? GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 0.5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    agent.background!),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.grey[300],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        agent.displayName,
                                        style: valorantStyle.copyWith(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CachedNetworkImage(
                                            color: const Color(0xFF0F131F),
                                            imageUrl: agent.role!.displayIcon),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 150,
                                  width: 150,
                                  child: Hero(
                                    tag: agent.uuid,
                                    child: CachedNetworkImage(
                                      imageUrl: agent.fullPortrait!,
                                    ),
                                    // '$urlImage/${agent.uuid}/$fullPortraitPng'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox();
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
