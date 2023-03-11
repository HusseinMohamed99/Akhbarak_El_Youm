import 'package:akhbarak_el_youm/Core/adaptive/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/Core/date_format/date_format.dart';
import 'package:akhbarak_el_youm/Core/model/news.dart';
import 'package:akhbarak_el_youm/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'News-Details';
  const NewsDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;

    return  Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            Assets.imagesPattern,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ).r),
            title: Text(
              'News Title',
              style: GoogleFonts.exo(
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Space(width: 0, height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ).r,
                        child: CachedNetworkImage(
                          imageUrl: news.urlToImage ?? '',
                          fit: BoxFit.fill,
                          height: 200.h,
                          width: double.infinity,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: AdaptiveIndicator(
                              os: getOs(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 24.sp,
                          ),
                        )),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10).r,
                    elevation: 10,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                    child: Padding(
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
                            MyDateUtils.formatDate(news.publishedAt ?? ''),
                            textAlign: TextAlign.end,
                          ),
                          Space(width: 0, height: 10.h),
                          Text(
                            news.description ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchUrl(
                                Uri.parse(news.url ?? ''),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(top: 10).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'View Full Article',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 66, 80, 92),
                                    ),
                                  ),
                                  Space(width: 10.w, height: 0),
                                  Icon(Icons.arrow_right,
                                      size: 24.sp,
                                      color:
                                          const Color.fromARGB(255, 66, 80, 92))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ],
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
