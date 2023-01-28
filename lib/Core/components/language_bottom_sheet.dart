// import 'package:akhbarak_el_youm/shared/providers/settings_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class LanguageBottomSheet extends StatefulWidget {
//   const LanguageBottomSheet({super.key});
//
//   @override
//   State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
// }
//
// class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     var settingsProvider = Provider.of<SettingsProvider>(context);
//     return Container(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       decoration: BoxDecoration(
//           color:  settingsProvider.isDarkMode() ? const Color(0xff141922) : Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           )
//       ),
//       height: 200,
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           InkWell(
//               onTap: () {
//                 settingsProvider.changeLanguage('en');
//               },
//               child: settingsProvider.currentLanguage == 'en'
//                   ? getSelectedItem (AppLocalizations.of(context)!.english,)
//                   : getUnselectedItem (AppLocalizations.of(context)!.english,)),
//           const SizedBox(
//             height: 12,
//           ),
//           InkWell(
//               onTap: () {
//                 settingsProvider.changeLanguage('ar');
//               },
//               child: settingsProvider.currentLanguage == 'ar'
//                   ? getSelectedItem(AppLocalizations.of(context)!.arabic,)
//                   : getUnselectedItem(AppLocalizations.of(context)!.arabic,))
//         ],
//       ),
//     );
//   }
//
//   Widget getSelectedItem(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: Theme.of(context)
//               .textTheme
//               .headline4
//               ?.copyWith(color: Theme.of(context).accentColor),
//         ),
//         Icon(
//           FontAwesomeIcons.circleCheck,
//           color: Theme.of(context).accentColor,
//         )
//       ],
//     );
//   }
//
//   Widget getUnselectedItem(String title) {
//     return Text(
//       title,
//       style: Theme.of(context).textTheme.headline4,
//     );
//   }
// }