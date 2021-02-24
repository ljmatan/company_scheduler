import 'package:flutter/material.dart';

class ContactCompanyDisplayAppBar extends StatelessWidget {
  final String name;
  final address;

  ContactCompanyDisplayAppBar({@required this.name, @required this.address});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
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
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
