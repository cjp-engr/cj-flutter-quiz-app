import 'package:flutter/material.dart';
import '../screens/questions_answers_screen.dart';

class Options extends StatefulWidget {
  final List wrongRightList;
  final OptionSelectedCallback onOptionsSelected;
  final int selectedPosition;
  final int index;
  //List finalWrongrightlist = [];
  const Options({
    Key? key,
    required this.wrongRightList,
    required this.onOptionsSelected,
    required this.selectedPosition,
    required this.index,
  }) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selectedIndex = 99;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.wrongRightList[widget.index].length,
        itemBuilder: (context, position) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: CheckboxListTile(
              checkColor: Colors.blueGrey[800],
              activeColor: Colors.blueGrey[100],
              selectedTileColor: Colors.blueGrey[800],
              selected: selectedIndex == position,
              title: Text(
                '${widget.wrongRightList[widget.index].elementAt(position)}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              value: selectedIndex == position,
              onChanged: (bool? newValue) {
                widget.onOptionsSelected(
                    widget.wrongRightList[widget.index].elementAt(position));
                setState(
                  () {
                    selectedIndex = position;
                    // widget.selectedPosition = position;
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
