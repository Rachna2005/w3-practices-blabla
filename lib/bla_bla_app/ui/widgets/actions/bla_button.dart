import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final ButtonType type;
  final VoidCallback onTap;
  const BlaButton({
    super.key,
    this.icon,
    required this.text,
    this.type = ButtonType.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(backgroundColor: BlaColors.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: Colors.white),
                SizedBox(width: 5),
              ],
              Text(text, style: TextStyle(color: Colors.white, height: 1.1)),
            ],
          ),
        );
      case ButtonType.secondary:
        return OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              if (icon != null) Icon(icon, size: 20, color: BlaColors.primary),
              SizedBox(width: 5),
              Text(
                text,
                style: BlaTextStyles.label.copyWith(color: BlaColors.primary),
              ),
            ],
          ),
        );
    }
  }
}
