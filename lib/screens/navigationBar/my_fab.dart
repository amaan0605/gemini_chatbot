import 'package:flutter/material.dart';

FloatingActionButton myFloatingActionButton({required Function()? onTap}) {
  return FloatingActionButton.extended(
    onPressed: onTap,
    label: const Text("Let's gooooo"),
    isExtended: true,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    icon: const Icon(Icons.search_rounded),
  );
}
