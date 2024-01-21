import 'package:flutter/material.dart';

import '../../../constants/app_values.dart';

class ButtonFilledWidget extends StatelessWidget {
  const ButtonFilledWidget({
    super.key,
    required this.text,
    this.onTap,
    required this.isDisabled,
  });

  final String text;
  final void Function()? onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(AppValues.defaultPadding),
        child: Text(
          text,
          style: TextStyle(
            color: isDisabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
