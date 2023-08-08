import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_40_rick_and_morty/presentation/theme/app_colors.dart';
import 'package:lesson_40_rick_and_morty/resources/resources.dart';

class CharectersPage extends StatelessWidget {
  const CharectersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 50,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.search),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.filter),
                  onPressed: () {},
                ),
                hintText: 'Найти персонажа',
                hintStyle: const TextStyle(
                  color: Color(0XFF5B6975),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                  letterSpacing: 0.44,
                ),
                fillColor: AppColors.darkTextFillColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.darkTextFillColor,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
