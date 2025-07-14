import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class AppText extends StatelessWidget {
  AppText(
    this.text, {
    Key? key,
    this.strutStyle,
    this.textAlign,
    this.textDirection ,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    TextStyle? style,
    this.color,
    this.velocity,
    this.figmaLineHeight,
    this.scrollText = false,
  })  : style = (style ?? const TextStyle()).copyWith(color: color),
        super(key: key);

  final String text;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double?
  textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final TextStyle? style;
  final Color? color;
  final double? velocity;
  final bool scrollText;

  final double? figmaLineHeight;

  @override
  Widget build(BuildContext context) {
    return scrollText
        ? TextScroll(
            text,
            mode: TextScrollMode.endless,
            velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
            delayBefore: const Duration(milliseconds: 1000),
            pauseBetween: const Duration(milliseconds: 2000),
            style: style?.copyWith(color: color),
            selectable: true,
            intervalSpaces: 5,
            textAlign: textAlign,
          )
        : Text(
            text,
            style: style?.copyWith(
                color: color,
                height: (figmaLineHeight != null && style?.fontSize != null)
                    ? figmaLineHeight?.fromFigmaHeight(style!.fontSize!)
                    : null),
            key: key,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            semanticsLabel: semanticsLabel,
            softWrap: softWrap,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            textScaleFactor: textScaleFactor,
          );
  }

  ///                              <<<<<  ----    factory constructor   ----  >>>>>
  ///                              con
  const AppText.marquee(
    this.text, {
    this.figmaLineHeight,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.style,
    this.color,
    this.velocity,
    this.scrollText = true,
    super.key,
  });

  ///                              <<<<<  ----    Default Style   ----  >>>>>
  AppText.displayLarge(
    this.text, {
    this.figmaLineHeight,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    this.scrollText = false,
    TextStyle? style,
    FontWeight? fontWeight,
    super.key,
  }) : style = textTheme.displayLarge
            ?.merge(style)
            .copyWith(fontWeight: fontWeight);

  // AppText.displayMedium(
  //   this.text, {
  //   this.scrollText = false,
  //   this.strutStyle,
  //   this.figmaLineHeight,
  //   this.textAlign,
  //   this.textDirection,
  //   this.locale,
  //   this.softWrap,
  //   this.overflow,
  //   this.textScaleFactor,
  //   this.maxLines,
  //   this.semanticsLabel,
  //   this.textWidthBasis,
  //   this.selectionColor,
  //   this.color,
  //   this.velocity,
  //   super.key,
  //   TextStyle? style,
  //   FontWeight? fontWeight,
  // }) : style = textTheme.displayMedium
  //           ?.merge(style)
  //           .copyWith(fontWeight: fontWeight);

  AppText.displaySmall(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.figmaLineHeight,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.displaySmall
            ?.merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.headlineLarge(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.figmaLineHeight,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.headlineLarge
            ?.merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.headlineSmall(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.figmaLineHeight,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.headlineSmall
            ?.merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.headlineMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.figmaLineHeight,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.headlineMedium
            ?.merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.titleLarge(
    this.text, {
    this.scrollText = false,
    this.figmaLineHeight,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.titleLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.titleMedium(
    this.text, {
    this.scrollText = false,
    this.figmaLineHeight,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.titleMedium
            ?.merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.titleSmall(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.figmaLineHeight,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.titleSmall?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.labelLarge(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.figmaLineHeight,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.labelLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.labelSmall(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.figmaLineHeight,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.labelSmall?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.bodyLarge(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.figmaLineHeight,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.bodyLarge?.merge(style).copyWith(fontWeight: fontWeight);

  AppText.bodySmall(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    this.figmaLineHeight,
    TextStyle? style,
    FontWeight? fontWeight,
    super.key,
  }) : style =
            textTheme.bodySmall?.merge(style).copyWith(fontWeight: fontWeight);

  ///                              <<<<<  ----    Custom Definition   ----  >>>>>

  AppText.sumImageText(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.salaryText
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.buttonText(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.figmaLineHeight,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.buttonText.merge(style).copyWith(fontWeight: fontWeight);

  AppText.regularText(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.figmaLineHeight,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.dropDownText.merge(style).copyWith(fontWeight: fontWeight);

  AppText.listTitle(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.figmaLineHeight,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.appBarTitle.merge(style).copyWith(fontWeight: fontWeight);

  AppText.informerText(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.figmaLineHeight,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.informerText
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.ratingText(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.ratingText.merge(style).copyWith(fontWeight: fontWeight);

  AppText.ratingNumber(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.ratingNumber
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  ///            <<< NEW TEXT STYLE >>

  AppText.displayRegular(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.display.regular
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.displayMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.display.medium
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.displaySemiBold(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.display.semiBold
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.headingRegular(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.heading.regular
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.headingMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.heading.medium
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.headingSemiBold(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.heading.semiBold
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.labelRegular(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.labelItem.regular
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.labelMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.labelItem.medium
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.labelSemiBold(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.labelItem.semiBold
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.bodyRegular(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.body.regular
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.bodyMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style =
            textTheme.body.medium.merge(style).copyWith(fontWeight: fontWeight);

  AppText.body(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    required FontWeight? fontWeight,
  }) : style = textTheme.body.merge(style).copyWith(fontWeight: fontWeight);

  AppText.bodySemiBold(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.body.semiBold
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.paragraphRegular(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.paragraph.regular
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.paragraphMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.paragraph.medium
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.paragraph(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    required FontWeight? fontWeight,
  }) : style =
            textTheme.paragraph.merge(style).copyWith(fontWeight: fontWeight);

  AppText.paragraphSemiBold(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.paragraph.semiBold
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.footnoteRegular(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.footnote.regular
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.footnoteMedium(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.footnote.medium
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  AppText.footnote(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    required FontWeight? fontWeight,
  }) : style = textTheme.footnote.merge(style).copyWith(fontWeight: fontWeight);

  AppText.footnoteSemiBold(
    this.text, {
    this.scrollText = false,
    this.strutStyle,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.locale,
    this.softWrap,
    this.figmaLineHeight,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
    this.color,
    this.velocity,
    super.key,
    TextStyle? style,
    FontWeight? fontWeight,
  }) : style = textTheme.footnote.semiBold
            .merge(style)
            .copyWith(fontWeight: fontWeight);

  copyWith({Color? color}) => AppText(
        text,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        selectionColor: selectionColor,
        style: style,
        color:color ??  this.color,
        velocity: velocity,
        figmaLineHeight: figmaLineHeight,
        scrollText: scrollText,
      );
}
