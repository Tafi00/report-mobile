import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPressd;
  final double circular,paddingAllValue;
  const ElevatedBtn({Key? key, required this.child, required this.onPressed, required this.circular, required this.paddingAllValue,this.onLongPressd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(paddingAllValue),
          child: child,
        ),
        Positioned.fill(
          child: ElevatedButton(
            onLongPress: onLongPressd,
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black12, backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(circular))),
              elevation: 0,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.all(0),
            ),
            child: null,
          ),
        ),
      ],
    );
  }
}
