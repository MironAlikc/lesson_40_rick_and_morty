import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_40_rick_and_morty/data/models/charecter_model.dart';
import 'package:lesson_40_rick_and_morty/data/models/episode_model.dart';
import 'package:lesson_40_rick_and_morty/presentation/blocs/eposode_bloc/eposode_bloc.dart';
import 'package:lesson_40_rick_and_morty/presentation/theme/app_colors.dart';

class CharsDetailsPage extends StatefulWidget {
  const CharsDetailsPage({super.key, required this.data});
  final MyCharacter data;

  @override
  State<CharsDetailsPage> createState() => _CharsDetailsPageState();
}

class _CharsDetailsPageState extends State<CharsDetailsPage> {
  List<EpisodeModel> episodeData = [];

  void getData() {
    for (int i = 0; i < widget.data.episode!.length; i++) {
      BlocProvider.of<EposodeBloc>(context).add(
        GetEpisodeEvent(url: widget.data.episode?[i] ?? ''),
      );
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EposodeBloc>(context).add(
      GetEpisodeEvent(url: widget.data.episode?[0] ?? ''),
    );
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
                        widget.data.image ?? '',
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
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                  Text(
                    widget.data.name ?? '',
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
                    widget.data.status ?? '',
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
                  const Text(
                    'Главный ', //протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                    style: TextStyle(
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
                        subTitle: widget.data.gender ?? '',
                      ),
                      Spacer(),
                      DataWidget(
                        titile: 'расса',
                        subTitle: widget.data.species ?? '',
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
                                subTitle: widget.data.origin?.name ?? '',
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
                                subTitle: widget.data.location?.name ?? '',
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
                  const Divider(
                    height: 5,
                    color: Color(0xFF152A3A),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
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
                  BlocListener<EposodeBloc, EposodeState>(
                    listener: (context, state) {
                      if (state is EposodeSuccess) {
                        episodeData.add(state.model);
                        setState(() {});
                      }
                    },
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: episodeData.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Container(
                              width: 74,
                              height: 74,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.data.image ?? '',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'СЕРИЯ ${episodeData[index].id}',
                                  style: const TextStyle(
                                    color: Color(0xDD22A2BD),
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 1.60,
                                    letterSpacing: 1.50,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${episodeData[index].name}',
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.8700000047683716),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 1.50,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${episodeData[index].created}',
                                  style: const TextStyle(
                                    color: Color(0x996E798C),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                    letterSpacing: 0.25,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                  backgroundImage: NetworkImage(widget.data.image ?? ','),
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
