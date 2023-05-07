import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/model/api/weapon_api.dart';

import 'theme/font_style.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({super.key});

  @override
  State<WeaponScreen> createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WeaponAPI().getListWeapon(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var weaponData = snapshot.data;

          return ListView.builder(
            itemCount: weaponData!.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var weapon = weaponData.data[index];

              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 0.5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weapon.displayName,
                                style: valorantStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                weapon.shopData?.category ?? "",
                                style: poppinsGreyStyle,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          height: 120,
                          width: 120,
                          child: Hero(
                            tag: weapon.uuid,
                            child: CachedNetworkImage(
                              imageUrl: weapon.displayIcon,
                            ),
                          ),
                        ),
                      ],
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
