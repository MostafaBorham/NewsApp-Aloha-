import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key, this.size = 30});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.surface,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
