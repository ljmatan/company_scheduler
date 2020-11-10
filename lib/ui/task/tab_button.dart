import 'package:company_scheduler/ui/task/bloc/tab_control.dart';
import 'package:flutter/material.dart';

class CustomTabButton extends StatelessWidget {
  final int selected, page;
  final String label;

  CustomTabButton({
    @required this.selected,
    @required this.page,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    bool _selected = selected == page;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: _selected ? 0.5 : 0.1,
              color:
                  _selected ? Theme.of(context).primaryColor : Colors.black54,
            ),
          ),
          child: SizedBox(
            height: 44,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: _selected
                      ? Theme.of(context).primaryColor
                      : Colors.black54,
                ),
              ),
            ),
          ),
        ),
        onTap: _selected ? null : () => TabControl.change(page),
      ),
    );
  }
}
