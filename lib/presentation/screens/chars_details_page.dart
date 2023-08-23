// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lesson_40_rick_and_morty/data/models/charecter_model.dart';
import 'package:lesson_40_rick_and_morty/presentation/theme/app_colors.dart';

class CharsDetailsPage extends StatelessWidget {
  const CharsDetailsPage({super.key, required this.data});
  final MyCharacter data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        data.image ?? '',
                        width: double.infinity,
                        height: 218,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 218,
                        decoration: BoxDecoration(
                          color: Color(0xff0B1E2D).withOpacity(0.65),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 120),
                  Text(
                    data.name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      height: 1.18,
                      letterSpacing: 0.25,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    data.status ?? '',
                    style: const TextStyle(
                      color: Color(0XFF42D048),
                      fontSize: 10,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                      letterSpacing: 1.50,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Главный ', //протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                      letterSpacing: 0.50,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      DataWidget(
                        titile: 'Пол',
                        subTitle: data.gender ?? '',
                      ),
                      Spacer(),
                      DataWidget(
                        titile: 'расса',
                        subTitle: data.species ?? '',
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              DataWidget(
                                titile: 'Место рождения',
                                subTitle: data.origin?.name ?? '',
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              DataWidget(
                                titile: 'Местоположение',
                                subTitle: data.location?.name ?? '',
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                  Divider(
                    height: 5,
                    color: Color(0xFF152A3A),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: const [
                        Text(
                          'Эпизоды',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Все эпизоды',
                          style: TextStyle(
                            color: Color(0xFF5B6975),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.episode?.length,
                    itemBuilder: (context, index) =>
                        Text(data.episode?[index] ?? ''),
                  )
                ],
              ),
            ),
            Positioned(
              top: 138,
              left: MediaQuery.of(context).size.width / 2 - 80,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.darkBgColor,
                child: CircleAvatar(
                  radius: 73,
                  backgroundImage: NetworkImage(data.image ?? ','),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.titile,
    required this.subTitle,
  });

  final String titile;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titile,
          style: TextStyle(
            color: Color(0xFF5B6975),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.33,
            letterSpacing: 0.50,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
