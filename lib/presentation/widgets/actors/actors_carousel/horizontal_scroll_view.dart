import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/presentation/widgets/actors/actors_carousel/actor_profile_image.dart';
import 'package:cinemotion/presentation/widgets/actors/actors_carousel/actor_role.dart';
import 'package:flutter/cupertino.dart';

class HorizontalScrollView extends StatelessWidget {
  final List<Actor> actors;

  const HorizontalScrollView({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: actors.length,
      itemBuilder: _buildItem,
    );
  }

  Widget? _buildItem(BuildContext context, int index) {
    final actor = actors[index];
    return Container(
      padding: EdgeInsets.all(10),
      width: 135,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildActorCard(actor),
      ),
    );
  }
}

// Inner Methods
List<Widget> _buildActorCard(Actor actor) => [
  ActorProfileImage(imagePath: actor.profilePath),
  SizedBox(height: 5),
  Text(actor.name, maxLines: 2),
  SizedBox(height: 10),
  ActorRole(role: actor.role),
];
