import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:zapit_2dgame/game/space_game.dart';

import '../../constants/constants.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<SpaceGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    required this.currentSizex,
    required this.currentSizey,
  });

  final String spritePath;
  final double currentSizex;
  final double currentSizey;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(spritePath);
    size = Vector2(currentSizex, currentSizey);

    anchor = Anchor.center;
    // add(CircleHitbox());
  }
}

class ObstacleRock extends Obstacle {
  ObstacleRock()
      : super(
          spritePath: 'rock.png',
          currentSizex: obstacleSizex * 0.9,
          currentSizey: obstacleSizey * 0.45,
        );
}

class ObstacleMountain extends Obstacle {
  ObstacleMountain()
      : super(
          spritePath: 'mountain.png',
          currentSizex: obstacleSizex * 1.6,
          currentSizey: obstacleSizey,
        );
}

class ObstacleStone extends Obstacle {
  ObstacleStone()
      : super(
          spritePath: 'stone.png',
          currentSizex: obstacleSizex * 0.4,
          currentSizey: obstacleSizey * 0.4,
        );
}
