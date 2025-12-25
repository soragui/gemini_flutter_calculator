import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onUndo;

  const CalculatorAppBar({super.key, required this.onUndo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DragToMoveArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.undo), onPressed: onUndo),
            const Text('Basic'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      elevation: 0,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
