import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/model/api/maps_api.dart';

import 'theme/font_style.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MapsAPI().getListMaps(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var mapsData = snapshot.data;

          return ListView.builder(
            itemCount: mapsData!.data.length,
            itemBuilder: (context, index) {
              var maps = mapsData.data[index];

              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        spreadRadius: 0.5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(maps.splash),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Center(
                      child: Text(
                        maps.displayName,
                        style: valorantStyle.copyWith(
                            fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
