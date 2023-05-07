import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/model/api/weapon_api.dart';
import 'package:mini_projects_valorant/model/detail_weapon_response.dart';

import 'theme/font_style.dart';

class DetailWeaponScreen extends StatefulWidget {
  final String weaponID;
  const DetailWeaponScreen({
    super.key,
    required this.weaponID,
  });

  @override
  State<DetailWeaponScreen> createState() => _DetailWeaponScreenState();
}

class _DetailWeaponScreenState extends State<DetailWeaponScreen> {
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
            future: WeaponAPI().getDetailWeapon(widget.weaponID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var detailWeapon = snapshot.data;
                var weapon = detailWeapon?.data;

                return SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Color(0xFF0F131F),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 400,
                              child: Hero(
                                tag: weapon!.uuid,
                                child: CachedNetworkImage(
                                  imageUrl: weapon.displayIcon,
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
                                      'Weapon',
                                      style:
                                          valorantStyle.copyWith(fontSize: 12),
                                    ),
                                    Text(
                                      weapon.displayName,
                                      style:
                                          valorantStyle.copyWith(fontSize: 30),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(Icons.favorite_border)),
                                    Text(
                                      weapon.shopData?.category ?? "Melee",
                                      style: poppinsBlackStyle.copyWith(
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            WidgetRowDetailsWeapon(
                              weapon: weapon,
                              title: 'Price',
                              subtitle:
                                  weapon.shopData?.cost.toString() ?? "Free",
                            ),
                            WidgetRowDetailsWeapon(
                              weapon: weapon,
                              title: 'Fire Rate',
                              subtitle:
                                  weapon.weaponStats?.fireRate.toString() ??
                                      "Null",
                            ),
                            WidgetRowDetailsWeapon(
                              weapon: weapon,
                              title: 'Magazine Size',
                              subtitle:
                                  weapon.weaponStats?.magazineSize.toString() ??
                                      "Null",
                            ),
                            WidgetRowDetailsWeapon(
                              weapon: weapon,
                              title: 'Reload Time',
                              subtitle: weapon.weaponStats?.reloadTimeSeconds
                                      .toString() ??
                                  "Null",
                            ),
                            WidgetRowDetailsWeapon(
                              weapon: weapon,
                              title: 'Equip Time',
                              subtitle: weapon.weaponStats?.equipTimeSeconds
                                      .toString() ??
                                  "Null",
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'SKINS',
                              style: poppinsGreyStyle.copyWith(
                                  fontSize: 30, color: Colors.grey),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: weapon.skins.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          width: 200,
                                          child: weapon.skins[index]
                                                      .displayIcon !=
                                                  null
                                              ? Image.network(
                                                  '${weapon.skins[index].displayIcon}')
                                              : const Center(
                                                  child: Text('Data Kosong')),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          weapon.skins[index].displayName,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 70),
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

class WidgetRowDetailsWeapon extends StatelessWidget {
  const WidgetRowDetailsWeapon({
    super.key,
    required this.weapon,
    required this.title,
    required this.subtitle,
  });

  final Data? weapon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: poppinsBlackStyle,
        ),
        Text(
          subtitle,
          style: poppinsBlackStyle.copyWith(fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
