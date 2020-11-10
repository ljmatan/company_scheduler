import 'package:flutter/material.dart';

class TaskEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[2],
            color: Colors.white,
          ),
          child: SizedBox(
            height: 56,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 6, color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('97%'),
                        Text('Jan 8 - 4:05 AM'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () => null,
      ),
    );
  }
}
