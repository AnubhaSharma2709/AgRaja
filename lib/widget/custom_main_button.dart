import 'package:agraja/utilis/utilis.dart';
import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;

  const MainButton({Key? key,
    required this.child,
    required this.color,
    required this.isLoading,
    required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          fixedSize: Size(screenSize.width * 0.5, screenSize.height * 0.04),
        ),
        onPressed: onPressed,
        child: child);
  }
}
