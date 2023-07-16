import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galaxeus_lib_flutter/galaxeus_lib_flutter.dart';

class FloatingBarWidgetData {
  final Widget icon;
  final Widget text;
  FloatingBarWidgetData({
    required this.icon,
    required this.text,
  });
}

class FloatingBarWidgetContainerData {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;

  final Clip clipBehavior;
  const FloatingBarWidgetContainerData(
      {this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.width,
      this.height,
      this.constraints,
      this.margin,
      this.transform,
      this.transformAlignment,
      this.clipBehavior = Clip.none});
}

class FloatingBarWidget extends StatelessWidget {
  final PageController? pageController;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final List<FloatingBarWidgetData> bottomBars;
  final int activeIndex;
  final FloatingBarWidgetContainerData activeContainer;
  final FloatingBarWidgetContainerData inActiveContainer;
  final FutureOr<void> Function(int index, BuildContext context) onTap;
  const FloatingBarWidget({
    super.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.pageController,
    required this.activeIndex,
    required this.activeContainer,
    required this.inActiveContainer,
    required this.bottomBars,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin ?? const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Container(
        alignment: alignment,
        padding: padding,
        color: color,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        transform: transform,
        transformAlignment: transformAlignment,
        decoration: decoration ??
            const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(49, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, -0.5), // changes position of shadow
                ),
                BoxShadow(
                  color: Color.fromARGB(49, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 0.5), // changes position of shadow
                ),
              ],
            ),
        clipBehavior: Clip.antiAlias,
        child: Visibility(
          visible: (context.width > 300),
          replacement: PageView.builder(
            controller: pageController,
            itemCount: bottomBars.length,
            itemBuilder: (context, index) {
              return item(
                key: Key("page_floating_botom_bar_${index}"),
                index: index,
                context: context,
                canTap: true,
              );
            },
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var index = 0; index < bottomBars.length; index++) ...[
                Expanded(
                  child: item(
                    key: Key("row_floating_botom_bar_${index}"),
                    index: index,
                    context: context,
                    canTap: true,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget item({
    Key? key,
    required int index,
    required BuildContext context,
    required bool canTap,
  }) {
    FloatingBarWidgetContainerData floatingBarWidgetContainerData =
        (index == activeIndex) ? activeContainer : inActiveContainer;
    return Container(
      key: key,
      alignment: floatingBarWidgetContainerData.alignment,
      padding: floatingBarWidgetContainerData.padding,
      color: floatingBarWidgetContainerData.color,
      foregroundDecoration: floatingBarWidgetContainerData.foregroundDecoration,
      width: floatingBarWidgetContainerData.width,
      height: floatingBarWidgetContainerData.height,
      constraints: floatingBarWidgetContainerData.constraints,
      transform: floatingBarWidgetContainerData.transform,
      transformAlignment: floatingBarWidgetContainerData.transformAlignment,
      margin: floatingBarWidgetContainerData.margin,
      decoration: floatingBarWidgetContainerData.decoration,
      clipBehavior: floatingBarWidgetContainerData.clipBehavior,
      child: Visibility(
        visible: canTap,
        replacement: itemData(
          key: Key("floating_bar_item_${index}"),
          index: index,
        ),
        child: MaterialButton(
          onPressed: () async {
            await onTap(
              index,
              context,
            );
          },
          child: itemData(
            key: Key("floating_bar_item_${index}"),
            index: index,
          ),
        ),
      ),
    );
  }

  Widget itemData({
    Key? key,
    required int index,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        bottomBars[index].icon,
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: bottomBars[index].text,
          ),
        ),
      ],
    );
  }
}
