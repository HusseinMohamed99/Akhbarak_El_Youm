import 'package:akhbarak_el_youm/Core/components/size_box.dart';
import 'package:akhbarak_el_youm/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String routeName = 'Settings-Screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
      return Stack(
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
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     Text('Language', style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                        // AppLocalizations.of(context)!.language,
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .subtitle2!
                        //     .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                    const SizedBox(
                      height: 8,
                    ),
                    Card(
                      color:
                          Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            //  showLanguageBottomSheet();
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.globe,
                                  size: 50,
                                  color: Colors.black,
                                ),
                              ),
                              const Space(width: 10, height: 0),
                              const Text('English'
                                  // settingsProvider.currentLanguage == 'en'
                                  //     ? AppLocalizations.of(context)!.english
                                  //     : AppLocalizations.of(context)!.arabic,
                                  // style: settingsProvider.currentLanguage == 'en'
                                  //     ? Theme.of(context).textTheme.headline6
                                  //     : Theme.of(context).textTheme.headline6!.copyWith(
                                  //   fontSize: 20,
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                  ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_circle_down_sharp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'GitHub',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Card(
                      color:  Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Share.share('''*Akhbarak_El_Youm*\n
You can develop it from my GitHub https://github.com/HusseinMohamed99''');
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.github,
                                  size: 50,
                                  color: Colors.black,
                                ),
                              ),
                              const Space(width: 10, height: 0),
                              Text(
                                'GitHub',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_circle_down_sharp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Space(width: 0, height: 24),
                    Text(
                      'WebSite',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Space(width: 0, height: 8),
                    Card(
                      color:  Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Share.share('''*My Portfolio*\n
You can connect with me from my Portfolio https://zaap.bio/HusseinMohamed''');
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                              const Space(width: 10, height: 0),
                              Text(
                                'My Portfolio',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_circle_down_sharp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }



  // void showLanguageBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (buildContext) {
  //         return const LanguageBottomSheet();
  //       });
  // }
}
