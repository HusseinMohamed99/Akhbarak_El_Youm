import 'package:akhbarak_el_youm/Core/Apis/apis_manager.dart';
import 'package:akhbarak_el_youm/Core/adaptive/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/Core/model/news_response.dart';
import 'package:akhbarak_el_youm/Core/model/sources.dart';
import 'package:akhbarak_el_youm/View/Widget/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsList extends StatelessWidget {
  final Source source;

  const NewsList(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApisManager.getNews(sourceID: source.id ?? ''),
      builder: (buildContext, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: AdaptiveIndicator(
              os: getOs(),
            ),
          );
        }

        if (snapShot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Error Loading Data ${snapShot.error.toString()}',
                ),
              ],
            ),
          );
        }

        if (snapShot.data!.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(
                  'Server Error ${snapShot.data!.message}',
                ),
              ],
            ),
          );
        }

        var newsList = snapShot.data?.newsList;
        return ListView.separated(
          itemBuilder: (_, index) {
            return NewsItem(
              newsList![index],
            );
          },
          itemCount: newsList?.length ?? 0,
          separatorBuilder: (_, index) {
            return Space(
              width: 0,
              height: 20.h,
            );
          },
        );
      },
    );
  }
}
