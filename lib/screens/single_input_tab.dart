import 'package:experimental_basics/brain/standard_deviation_math.dart';
import 'package:experimental_basics/components/typography.dart';
import 'package:experimental_basics/provider_data/single_input_data.dart';
import 'package:experimental_basics/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleInputTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SingleInputData>(builder: (context, singleInputData, ___) {
      StandardDeviationMath sdMath = StandardDeviationMath(
          inputs:
              singleInputData.singleInputEntries.map((e) => e.value).toList(),
          errors:
              singleInputData.singleInputEntries.map((e) => e.error).toList());

      return Column(
        children: [
          Container(
            height: 100,
            color: Colors.white,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.blue,
                      cardChild: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Media: ${sdMath.getAverage().toStringAsExponential(sdMath.getAlgarismosSignificativos())}',
                              style: kResultTextStyle,
                            ),
                            Text(
                              'Desvio Padrao: ${sdMath.getSingleInputStandardDeviation().toStringAsExponential(sdMath.getAlgarismosSignificativos())}',
                              style: kResultTextStyle,
                            ),
                            Text(
                              'Erro: ${sdMath.getAverageError().toStringAsExponential(sdMath.getAlgarismosSignificativos())}',
                              style: kResultTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.lightBlueAccent,
                      cardChild: Center(
                        child: Text(
                          "Grafico da gaussiana vai vir aqui",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   height: 100,
          //   color: Colors.red,
          //   child: Center(
          //       child: Text(
          //           'Media: ${sdMath.getAverage()}, Desvio Padrao: ${sdMath.getSingleInputStandardDeviation()}, Erro: ')),
          // ),
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
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
