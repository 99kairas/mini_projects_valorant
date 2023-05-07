import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/model/api/agent_api.dart';

import 'theme/font_style.dart';

class DetailAgentScreen extends StatefulWidget {
  final String agentID;
  const DetailAgentScreen({
    super.key,
    required this.agentID,
  });

  @override
  State<DetailAgentScreen> createState() => _DetailAgentScreenState();
}

class _DetailAgentScreenState extends State<DetailAgentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F131F),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: AgentsAPI().getDetailAgents(widget.agentID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var detailAgent = snapshot.data;
                var agent = detailAgent!.data;

                return SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: Color(0xFF0F131F),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: -30,
                        child: SizedBox(
                          height: 400,
                          child: CachedNetworkImage(
                            imageUrl: agent.background,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 400,
                              child: Hero(
                                tag: agent.uuid,
                                child: CachedNetworkImage(
                                  imageUrl: agent.fullPortrait,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(color: Colors.grey, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Agent',
                                      style: valorantStyle.copyWith(),
                                    ),
                                    Text(
                                      agent.displayName,
                                      style:
                                          valorantStyle.copyWith(fontSize: 30),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CachedNetworkImage(
                                        imageUrl: agent.role.displayIcon,
                                        color: const Color(0xFF0F131F),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      agent.role.displayName,
                                      style:
                                          blackTextStyle.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              agent.description,
                              style: poppinsBlackStyle.copyWith(fontSize: 15),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'ABILITIES',
                              style: poppinsGreyStyle.copyWith(
                                  fontSize: 30, color: Colors.grey),
                            ),
                            Container(
                              height: 150,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ListView.builder(
                                itemCount: agent.abilities.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      agent.abilities[index].displayIcon != null
                                          ? Expanded(
                                              child: SizedBox(
                                                width: 120,
                                                child: CachedNetworkImage(
                                                  color:
                                                      const Color(0xFF0F131F),
                                                  imageUrl:
                                                      '${agent.abilities[index].displayIcon}',
                                                ),
                                              ),
                                            )
                                          : const Expanded(
                                              child: Center(
                                                  child: Text('Data Kosong'))),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            '${agent.abilities[index].displayName}',
                                            textAlign: TextAlign.center,
                                            style: valorantStyle.copyWith(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
