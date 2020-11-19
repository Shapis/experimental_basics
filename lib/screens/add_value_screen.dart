import 'package:experimental_basics/brain/regex_input_formatter.dart';
import 'package:experimental_basics/provider_data/single_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddValueScreen extends StatelessWidget {
  final int tabIndex;

  const AddValueScreen({Key key, @required this.tabIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _amountValidator = RegExInputFormatter.withRegex(
        '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

    final FocusNode myFocusNode = FocusNode();
    String value1;
    String error;
    final value1Controller = TextEditingController();
    final errorController = TextEditingController();
    final value2Controller = TextEditingController();

    return Container(
      color: Color(0XFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Medida',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: myFocusNode,
                    controller: value1Controller,
                    inputFormatters: [_amountValidator],
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      value1 = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Text('+/-'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: errorController,
                    inputFormatters: [_amountValidator],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      error = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                switch (tabIndex) {
                  case 0:
                    {
                      if (value1 != null &&
                          value1 != '' &&
                          error != null &&
                          error != '') {
                        Provider.of<SingleInputData>(context, listen: false)
                            .addEntry(
                          double.parse(value1),
                          double.parse(error),
                        );
                        value1Controller.clear();
                        errorController.clear();
                        errorController.value = TextEditingValue(text: error);
                        myFocusNode.requestFocus();
                      }
                    }
                    break;
                  default:
                }

                //Provider.of
                // Provider.of<TaskData>(context, listen: false)
                //     .addTask(newTaskTitle);
                //Navigator.pop(context);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
