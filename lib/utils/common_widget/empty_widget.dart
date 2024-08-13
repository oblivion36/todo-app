import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  final num height;
  const EmptyWidget({super.key, this.height = 500});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/addNote');
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SvgPicture.asset(
              "assets/icons/empty_view.svg",
              width: double.infinity,
              height: height.toDouble(),
            ),
          )
        ],
      ),
    );
  }
}
