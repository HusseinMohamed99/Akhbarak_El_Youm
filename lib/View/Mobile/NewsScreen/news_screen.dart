import 'package:akhbarak_el_youm/Core/Apis/apis_manager.dart';
import 'package:akhbarak_el_youm/Core/adaptive/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/indicator.dart';
import 'package:akhbarak_el_youm/Core/model/sources_response.dart';
import 'package:akhbarak_el_youm/Core/model/category_model.dart';
import 'package:akhbarak_el_youm/View/Mobile/Widget/category_tabs_widget.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel category;

  NewsScreen(this.category, {super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApisManager.getSources(category.categoryID),
        builder: (buildContext,snapShot)
        {
          if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: AdaptiveIndicator(os: getOs()),);
            }

          if (snapShot.hasError){
            return Center(child: Column(
              children: [
                // Lottie.asset(
                //   'assets/lottie/Aniki Hamster.zip',
                //   width: 500,
                //   fit: BoxFit.fill,
                // ),
                Text('Error Loading Data ${snapShot.error.toString()}'),
              ],
            ),);
          }

          if (snapShot.data!.status =='error') {
            return Center(child: Column(
              children: [
                // Lottie.asset(
                //   'assets/lottie/Aniki Hamster.zip',
                //   width: 500,
                //   fit: BoxFit.fill,
                // ),
                Text('Server Error ${snapShot.data!.message}'),
              ],
            ),);
          }
          var sourcesData = snapShot.data?.sources;
          return CategoryTabsWidget(sourcesData!);
        },
        
      ),
       

      
    );
  }
}
