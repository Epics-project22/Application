import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Soil extends StatelessWidget {
  var LinkText = const TextStyle(color: Colors.teal, fontSize: 30);

  Soil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('సాయిల్ హెల్త్ కార్డు '),
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
                                  'లక్ష్యాలు',
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
                                '* 14 కోట్ల మంది రైతులకు ఈ పథకం వర్తిస్తుంది.',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '* దేశంలోని అన్ని ప్రాంతాల్లో ఈ పథకం అమలవుతోంది.',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '* ఈ కార్డు రైతులకు నేల గురించి మరియు సాగు చేయగల సరైన పంట గురించి మార్గనిర్దేశం చేస్తుంది.',
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
                                '* నేల ఆరోగ్యాన్ని తెలుసుకోవచ్చు.',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '* మట్టి యొక్క క్రియాత్మక లక్షణాలను మనం తెలుసుకోవచ్చు.',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '* మట్టిలో ఉండే నీటిశాతం, పోషకాల గురించి తెలుసుకోవచ్చు.',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '* మట్టి లోపాలను మెరుగుపరిచే చర్యలను మనం తెలుసుకోవచ్చు.',
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
                      child: Text(
                        "దరఖాస్తు",
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          textStyle: TextStyle(
                            fontSize: 30,
                          )), // set the background
                      onPressed: () async {
                        var url =
                            "https://soilhealth6.dac.gov.in/PRegUserInternal/PRegUserInternal";
                        if (await launch(url)) {
                          await launch(url);
                        } else {
                          throw "Cannot load Url";
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
