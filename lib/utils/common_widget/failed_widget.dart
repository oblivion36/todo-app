import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final num height;
  final VoidCallback? onTap;

  const FailureWidget({super.key, this.height = 500, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                onTap;
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Image.asset(
                "assets/images/failure_view.png",
                width: double.infinity,
                height: height.toDouble(),
              )

              //  SvgPicture.asset(
              //   "assets/icons/empty_view.svg",
              //   width: double.infinity,
              //   height: 500,
              // ),
              )
        ],
      ),
    );
  }
}
