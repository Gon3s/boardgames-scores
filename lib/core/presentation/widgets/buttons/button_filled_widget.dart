import 'package:flutter/material.dart';

import '../../../constants/app_values.dart';
import '../circular_progress_widget.dart';

class ButtonFilledWidget extends StatelessWidget {
  const ButtonFilledWidget({
    super.key,
    required this.text,
    this.onTap,
    this.isDisabled = false,
    this.isLoading = false,
  });

  final String text;
  final void Function()? onTap;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(AppValues.defaultPadding),
        child: isLoading
            ? const CircularProgressWidget()
            : Text(
          text,
          style: TextStyle(
            color: isDisabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
