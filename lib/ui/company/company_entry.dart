import 'package:company_scheduler/logic/api/company/company_model.dart';
import 'package:company_scheduler/ui/company/company_display/company_display.dart';
import 'package:flutter/material.dart';

class CompanyEntry extends StatelessWidget {
  final Company company;

  CompanyEntry({@required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.1,
                color: Colors.black54,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      company.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(company.address.city),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CompanyDisplay(company: company),
          ));
        },
      ),
    );
  }
}
