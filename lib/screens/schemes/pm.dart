import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Kisan extends StatelessWidget {
  var LinkText = const TextStyle(color: Colors.teal, fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('పీఎం-కిసాన్ సమ్మాన్ నిధి యోజన'),
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
                            '* భారతీయ జాతీయులైన చిన్న మరియు సన్నకారు రైతులు అర్హులు',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '* రూ. 10000 కంటే తక్కువ నెలవారీ పెన్షన్ పొందుతున్న వారు',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '* ప్రభుత్వ ఉద్యోగి కాకూడదు. ',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ))),
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
                              '* ఇది భారత ప్రభుత్వం నుండి 100% నిధులతో కూడిన కేంద్ర పథకం',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* ఈ పథకం కింద భర్త, భార్య మరియు మైనర్ పిల్లలతో సహా భూమిని కలిగి ఉన్న రైతు కుటుంబాలకు ఏటా రూ. 6,000 మొత్తాన్ని కేంద్రం విడుదల చేస్తుంది.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* ఎలాంటి అవకతవకలు జరగకుండా నేరుగా లబ్ధిదారుల బ్యాంకు ఖాతాలకు నగదు బదిలీ చేయబడుతుంది.',
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
                            '* పేరు యొక్క రుజువు పత్రం',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '* వయస్సు రుజువు పత్రం',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '* కుల ధృవీకరణ పత్రం',
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
                            '* బ్యాంక్ పాస్ బుక్',
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
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
                                  "https://pmkisan.gov.in/RegistrationFormnew.aspx";
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
