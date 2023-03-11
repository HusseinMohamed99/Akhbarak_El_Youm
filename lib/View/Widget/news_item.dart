import 'package:akhbarak_el_youm/Core/adaptive/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/navigator.dart';
import 'package:akhbarak_el_youm/Core/date_format/date_format.dart';
import 'package:akhbarak_el_youm/Core/model/news.dart';
import 'package:akhbarak_el_youm/View/NewsDetails/news_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          routeName: NewsDetails.routeName,
          arguments: news,
        );
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18).r,
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: AdaptiveIndicator(
                      os: getOs(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 24.sp,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    news.source!.name ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    news.author ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    news.title ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    MyDateUtils.formatDate(
                      news.publishedAt ?? '',
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
