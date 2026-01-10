import 'package:flutter/cupertino.dart';

class ActorRole extends StatelessWidget {
  final String? role;

  const ActorRole({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        role ?? '',
        maxLines: 2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
