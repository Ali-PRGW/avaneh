import 'dart:ui';

import 'package:avaneh/common/widgets/button/basic_app_button.dart';
import 'package:avaneh/core/configs/assets/app_images.dart';
import 'package:avaneh/core/configs/assets/app_vectors.dart';
import 'package:avaneh/core/theme/app_colors.dart';
import 'package:avaneh/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:avaneh/presentation/intro/pages/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.chooseMode),
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.15)),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff30393c).withOpacity(0.5),
                            ),
                            child: SvgPicture.asset(
                              AppVectors.moon,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff30393c).withOpacity(0.5),
                            ),
                            child: SvgPicture.asset(
                              AppVectors.sun,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GetStartedPage(),
                      ),
                    );
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
