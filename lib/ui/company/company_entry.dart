import 'package:company_scheduler/logic/api/models/company_model.dart';
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
          child: SizedBox(
            height: 56,
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: company.account.active
                              ? Colors.black
                              : Colors.red.shade300,
                        ),
                      ),
                      Text(company.address.city),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        company.account.name,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(
                        company.clientType.name,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => CompanyDisplay(company: company),
          );
        },
      ),
    );
  }
}
