import 'package:akhbarak_el_youm/Core/adaptive/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/indicator.dart';
import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/Core/date_format/date_format.dart';
import 'package:akhbarak_el_youm/Core/model/news.dart';
import 'package:akhbarak_el_youm/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'News-Details';
  const NewsDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String image = 'https://img.freepik.com/free-vector/ancient-egyptian-pharaoh-with-rod-desert-with-pyramids-vector-cartoon-illustration-landscape-with-yellow-sand-dunes-pharaoh-tombs-figure-king-egypt-tumbleweed_107791-3066.jpg?w=1380&t=st=1675042788~exp=1675043388~hmac=d47a769401ed6a63e9a3b47f24653649438172e90ba87869be2e575ed8243999';

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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
            ),
            title:  Text('News Title',style: GoogleFonts.exo(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const Space(width: 0, height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(

                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular( 20),
                          bottomLeft: Radius.circular( 20),

                        ),
                        child: CachedNetworkImage(
                          imageUrl: news.urlToImage ?? '',
                          fit: BoxFit.fill,
                          height: 200,
                          width: double.infinity,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: AdaptiveIndicator(os: getOs())),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 10,
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            news.source!.name ?? '',

                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            news.author ?? '',

                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          Text(
                            news.title ?? '',

                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                           Text(
                          MyDateUtils.formatDate(news.publishedAt ?? ''),
                            textAlign: TextAlign.end,
                          ),
                           Space(width: 0, height: 10),
                           Text(
                            news.description ?? '',
                             style: GoogleFonts.poppins(
                               fontSize: 14
                             ),
                          ),
                          InkWell(
                            onTap: ()
                            {
                              _launchUrl(Uri.parse(news.url??''));
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                   Text('View Full Article',style: GoogleFonts.poppins(
                                    fontSize: 14,
                                     fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 66, 80, 92),
                                  ),),
                                  const Space(width: 10, height: 0),
                                  const Icon(Icons.arrow_right,color: Color.fromARGB(255, 66, 80, 92))
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
