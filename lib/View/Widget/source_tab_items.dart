import 'package:akhbarak_el_youm/Core/model/sources.dart';
import 'package:akhbarak_el_youm/Core/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceTab extends StatelessWidget {
  final Source sources;
  final bool isSelected;

  const SourceTab(this.sources, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeApp.lightPrimary,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(20).r,
        color: isSelected ? ThemeApp.lightPrimary : Colors.transparent,
      ),
      child: Text(
        sources.name ?? '',
        style: GoogleFonts.exo(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isSelected ? Colors.white : ThemeApp.lightPrimary,
        ),
      ),
    );
  }
}
