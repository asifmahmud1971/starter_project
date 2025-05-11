import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CustomBottomSheet({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: color,
          borderRadius: color != null
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )
              : null),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).copyWith().size.height -
            (MediaQueryData.fromView(View.of(context)).padding.top + 50),
      ),
      child: child,
    );
  }
}

