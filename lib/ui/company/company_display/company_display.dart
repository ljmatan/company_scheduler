import 'package:company_scheduler/logic/api/models/company_model.dart';
import 'package:company_scheduler/ui/company/company_display/appbar.dart';
import 'package:company_scheduler/ui/company/company_display/info_entry/info_entry.dart';
import 'package:company_scheduler/ui/shared/bloc/copied.dart';
import 'package:company_scheduler/ui/shared/button_row/button_row.dart';
import 'package:flutter/material.dart';

class CompanyDisplay extends StatefulWidget {
  final Company company;

  CompanyDisplay({@required this.company});

  @override
  State<StatefulWidget> createState() {
    return _CompanyDisplayState();
  }
}

class _CompanyDisplayState extends State<CompanyDisplay> {
  @override
  void initState() {
    super.initState();
    Copied.init();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            CompanyDisplayAppBar(
              name: widget.company.name,
              address: widget.company.address.street +
                  ' ' +
                  widget.company.address.houseno +
                  '/' +
                  widget.company.address.flatno +
                  ', ' +
                  widget.company.address.city,
            ),
            InfoEntry(
              icon: Icons.contact_phone,
              label: 'Phone Number',
              phone1: widget.company.address.phone1 ?? '',
              phone2: widget.company.address.phone2 ?? '',
              mobile1: widget.company.address.mobile1 ?? '',
              mobile2: widget.company.address.mobile2 ?? '',
            ),
            InfoEntry(
              icon: Icons.contact_mail,
              label: 'Email',
              email1: widget.company.address.email1 ?? '',
              email2: widget.company.address.email2 ?? '',
            ),
            InfoEntry(
              icon: Icons.chrome_reader_mode,
              label: 'Other',
              clientType: widget.company.clientType.name ?? '',
            ),
            const SizedBox(height: 90),
          ],
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ButtonRow(
            houseNumber: widget.company.address.phone1 == ''
                ? null
                : widget.company.address.phone1,
            phoneNumber: widget.company.address.mobile1 == ''
                ? null
                : widget.company.address.mobile1,
            email: widget.company.address.email1 == ''
                ? null
                : widget.company.address.email1,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    Copied.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
