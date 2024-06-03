import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/gradient_icon.dart';

class DetailField extends StatelessWidget {
  const DetailField({
    required this.title,
    required this.child,
    this.leading,
    this.icon,
    super.key,
  });

  final IconData? icon;
  final Widget? leading;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    assert(icon != null || leading != null, 'Icon or leading must be provided');
    assert(
      icon == null || leading == null,
      'Icon and leading cannot be provided at the same time',
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: icon != null
                ? GradientIcon(
                    icon,
                    size: 20,
                  )
                : leading,
          ),
          Expanded(
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 4),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
