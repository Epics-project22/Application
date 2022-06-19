import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Ysr extends StatelessWidget {
  var LinkText = const TextStyle(color: Colors.teal, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('వైఎస్ఆర్ రైతు భరోసా'),
        backgroundColor: Colors.teal[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Card(
                  elevation: 5.0,
                  shadowColor: Colors.teal,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.teal,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: const Text(
                                'అర్హత',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* సాగు భూమిని కలిగి ఉన్న ఏపీ రైతులు. ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* పీఎం-కిసాన్ పథకం కింద నమోదు చేసుకున్న రైతులు కూడా అర్హులే.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* చిన్న ఉపాంత లేదా వ్యవసాయ అద్దెదారులు అర్హులు.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]
                      )
                  )
              ),
              Card(
                  elevation: 5.0,
                  shadowColor: Colors.teal,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.teal,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: const Text(
                                'ప్రయోజనాలు',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* ఈ పథకం రైతులకు వార్షిక ప్రాతిపదికన విత్తే కాలము‌కు ముందు రూ.13,500 ఆర్థిక సహాయం అందించాలని లక్ష్యంగా పెట్టుకుంది.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* 5 ఎకరాల వరకు భూమి ఉన్న రైతులకు మొదటి సంవత్సరంలో రూ.50,000 అందజేస్తారు.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* రాష్ట్ర ప్రభుత్వం కేటాయించిన బడ్జెట్ రూ.5,500 కోట్లు.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]
                      )
                  )
              ),
              Card(
                  elevation: 5.0,
                  shadowColor: Colors.teal,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.teal,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: const Text(
                                'అవసరమైన పత్రాలు',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* నివాస ధృవీకరణ పత్రం',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* ఆధార్ కార్డు',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* పొలం పట్టా',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* ఆదాయ ధృవీకరణ పత్రం',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* పాస్‌పోర్ట్ సైజు ఫోటో',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* బ్యాంక్ పాస్ బుక్',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]
                      )
                  )
              ),
              Center(
                child: ElevatedButton(
                    child:Text("దరఖాస్తు",),
                    style: ElevatedButton.styleFrom(
                        primary:Colors.teal,
                        textStyle: TextStyle(
                            fontSize: 30,
                            )
                    ), // set the background
                    onPressed: () async {
                      var url =
                          "https://ysrrythubharosa.ap.gov.in/RBApp/RB/Phase3Paymentstatus";
                      if (await launch(url)) {
                        await launch(url);
                      } else {
                        throw "Cannot load Url";
                      }
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
