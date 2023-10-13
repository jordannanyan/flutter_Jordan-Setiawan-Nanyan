import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/themecolor.dart';
import 'package:flutter_application_1/theme/themetext.dart';

class AboutUsScreen extends StatelessWidget {
  final List<String> dataPadang;
  final List<String> dataDeskripsi;
  const AboutUsScreen(
      {super.key, required this.dataPadang, required this.dataDeskripsi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'About Us',
          style: TextStyles.textHeader,
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Kami adalah bisnis restoran masakan padang terbaik di seluruh Indonesia. Dengan kualitas bahan terutama dan cara memasak yang penuh dengan perasaan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 22,
        ),
        Container(
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: dataPadang.length,
            itemBuilder: ((context, index) {
              return Container(
                height: 800,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorLightGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.food_bank,
                        size: 24,
                      ),
                      Text(
                        dataPadang[index],
                        style: TextStyles.textSubHeader,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        dataDeskripsi[index],
                        textAlign: TextAlign.center,
                        style: TextStyles.textRegular,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
