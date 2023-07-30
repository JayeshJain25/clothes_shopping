import 'package:clothes_shopping/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText({super.key, required this.text, this.maxLines = 3});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
        text: widget.text,
        style: GoogleFonts.workSans(
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          color: AppColors.bodyColor,
        ));
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: RichText(
            text: textSpan,
            maxLines: isExpanded ? 15 : widget.maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (!isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Text(
                    'Read more',
                    style: TextStyle(color: AppColors.goldColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation(35 / 360),
                    child: Container(
                      margin: const EdgeInsets.only(top: 3),
                      child: Icon(
                        Icons.arrow_circle_up_outlined,
                        color: AppColors.goldColor,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        if (isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Text(
                    'Read less',
                    style: TextStyle(color: AppColors.goldColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation(-35 / 360),
                    child: Container(
                      margin: const EdgeInsets.only(top: 3),
                      child: Icon(
                        Icons.arrow_circle_down_outlined,
                        color: AppColors.goldColor,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
