import 'package:experimental_basics/provider_data/single_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleInputTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SingleInputData>(builder: (context, singleInputData, ___) {
      return Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: Center(child: Text(singleInputData.getSum().toString())),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: singleInputData.getLength(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      final tempVariable =
                          singleInputData.singleInputEntries[index];
                      singleInputData.removeEntry(index);
                      final snackBar = SnackBar(
                        content: Text(
                            'Removido: ${tempVariable.value} +/- ${tempVariable.error}'),
                        action: SnackBarAction(
                          label: 'Desfazer',
                          onPressed: () {
                            singleInputData.insertEntry(index, tempVariable);
                          },
                        ),
                      );
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    background: Container(
                      color: Colors.red,
                      child: Align(
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.5),
                          child: Icon(
                            Icons.cancel,
                            size: 28,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: Align(
                        child: Padding(
                          padding: EdgeInsets.only(right: 6.5),
                          child: Icon(
                            Icons.cancel,
                            size: 28,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    key: Key(UniqueKey().toString()),
                    child: Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 40.0),
                        title: Text(singleInputData
                            .singleInputEntries[index].value
                            .toString()),
                        subtitle: Text('+/- ' +
                            singleInputData.singleInputEntries[index].error
                                .toString()),
                        onTap: () {
                          //singleInputData.removeEntry(index);
                          //print(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
