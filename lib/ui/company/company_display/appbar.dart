import 'package:company_scheduler/logic/api/company/company_model.dart';
import 'package:flutter/material.dart';

class CompanyDisplayAppBar extends StatelessWidget {
  final String name;
  final Address address;

  CompanyDisplayAppBar({@required this.name, @required this.address});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: address.street != null && address.street != '' ||
                    address.city != null && address.city != ''
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        (address.street == null || address.street == ''
                                ? ''
                                : address.street + ' ') +
                            (address.houseno == null || address.houseno == ''
                                ? ''
                                : address.houseno) +
                            (address.flatno == null || address.flatno == ''
                                ? ''
                                : '/' + address.flatno + ', ') +
                            (address.city == null || address.city == ''
                                ? ''
                                : address.city),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                : Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
