import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final String label;
  final Widget route;

  DashboardButton({
    @required this.label,
    @required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.amber.shade200,
            boxShadow: kElevationToShadow[1],
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Internationalization.dash(label),
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54,
                    ),
                  ),
                  Image.asset(
                    'assets/dash/' + label + '.png',
                    height: 28,
                    fit: BoxFit.fill,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => route),
        ),
      ),
    );
  }
}
