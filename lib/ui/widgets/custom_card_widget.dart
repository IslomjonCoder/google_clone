import 'package:flutter/material.dart';
import 'package:google_clone/models/organic_model.dart';
import 'package:google_clone/utils/colors.dart';
import 'package:google_clone/utils/style.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, required this.model}) : super(key: key);
  OrganicModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formatURL(model.link)),
        SizedBox(height: 12),
        Text(
          model.title,
          style:
              AppStyle.title.copyWith(color: AppColors.c1158D6, fontSize: 18),
        ),
        SizedBox(height: 4),
        Text(
          model.snippet,
          style: AppStyle.body2,
        ),
      ],
    );
  }

  String formatURL(String url) {
    // Remove "https://" from the URL
    String formattedURL = url.replaceAll("https://", "");

    // Replace each "/" with " › "
    formattedURL = formattedURL.replaceAll("/", " › ");

    // Replace "- " with " "
    formattedURL = formattedURL.replaceAll("- ", "");

    // Remove any query parameters
    if (formattedURL.contains("?")) {
      formattedURL = formattedURL.substring(0, formattedURL.indexOf("?"));
    }

    return formattedURL;
  }
}
