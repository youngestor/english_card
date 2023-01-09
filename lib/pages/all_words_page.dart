import 'package:english_card/models/english_today.dart';
import 'package:english_card/values/app_assets.dart';
import 'package:english_card/values/app_colors.dart';
import 'package:english_card/values/app_styles.dart';
import 'package:flutter/material.dart';

class AllWordsPage extends StatelessWidget {
  final List<EnglishToday> words;
  const AllWordsPage({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          title: Text(
            'English today',
            style: AppStyles.h3.copyWith(
              color: AppColors.textColor,
              fontSize: 36,
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.leftArrow),
          ),
        ),
        body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? AppColors.primaryColor
                    : AppColors.secondColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  words[index].noun!,
                  style: index % 2 == 0
                      ? AppStyles.h4
                      : AppStyles.h4.copyWith(color: AppColors.textColor),
                ),
                subtitle: Text(words[index].quote ??
                    'Think of all the beauty still left around you and be happy.'),
                leading: Icon(
                  Icons.favorite,
                  color: words[index].isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            );
          },
        ));
  }
}
