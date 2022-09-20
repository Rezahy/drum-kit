import 'package:flutter/material.dart';

import '../constants.dart';

class DrumButton extends StatefulWidget {
  const DrumButton(
      {Key? key,
      required this.drumKeyName,
      required this.drumKeyImageSource,
      required this.onPressed})
      : super(key: key);
  final String drumKeyName;
  final String drumKeyImageSource;
  final Future Function() onPressed;

  @override
  State<DrumButton> createState() => _DrumButtonState();
}

class _DrumButtonState extends State<DrumButton> {
  bool isDrumButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isDrumButtonPressed = true;
        });
        widget.onPressed();

        await Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            isDrumButtonPressed = false;
          });
        });
      },
      child: Opacity(
        opacity: !isDrumButtonPressed ? 1 : 0.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: drumButtonBorderColor,
                      width: drumButtonBorderWidth),
                  boxShadow: !isDrumButtonPressed
                      ? []
                      : [
                          BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 4,
                              color: const Color(0xFFDBEDF3).withOpacity(0.5)),
                        ]),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(widget.drumKeyImageSource),
                ),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Text(
                widget.drumKeyName.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: const Color(0xFFDA0463),
                    fontSize: 26,
                    shadows: [
                      const Shadow(
                        color: Color(0xFFDBEDF3),
                        offset: Offset(1.7, 0),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
