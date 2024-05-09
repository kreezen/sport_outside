import 'package:flutter/material.dart';
import 'package:sportoutside/domain/entities/basketball_sportplace.dart';
import 'package:sportoutside/domain/entities/skaten_sportplace.dart';
import 'package:sportoutside/domain/entities/soccer_sportplace.dart';
import 'package:sportoutside/domain/entities/sportplace.dart';
import 'package:sportoutside/domain/entities/tabletennis_sportplace.dart';

class SportPlaceIconWidget extends StatelessWidget {
  final SportPlace sportPlace;
  final double size;
  const SportPlaceIconWidget(
      {Key? key, required this.sportPlace, required this.size})
      : super(key: key);

  IconData getIcon() {
    if (sportPlace is TabletennisSportPlace) {
      return Icons.sports_cricket_outlined;
    }
    if (sportPlace is SkatenSportPlace) {
      return Icons.sports_motorsports;
    }

    if (sportPlace is CalisthenicSportPlace) {
      return Icons.sports_gymnastics_outlined;
    }

    if (sportPlace is BasketballSportPlace) {
      return Icons.sports_basketball_outlined;
    }

    if (sportPlace is SoccerSportPlace) {
      return Icons.sports_soccer_outlined;
    }

    return Icons.sports_football_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(getIcon(), size: size);
  }
}

class CalisthenicSportPlace {}
