import 'package:flutter/material.dart';

class Bheema extends StatelessWidget {
  var LinkText = const TextStyle(color: Colors.teal, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('వైయస్సార్ పంటల బీమా'),
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
                              '* దరఖాస్తుదారు తప్పనిసరిగా ఆంధ్రప్రదేశ్‌లో శాశ్వత నివాసి అయి ఉండాలి.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* దరఖాస్తుదారు తప్పనిసరిగా తెల్ల రేషన్ కార్డు కలిగి ఉండాలి.',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
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
                              '* ఈ పథకం ద్వారా ఆంధ్రప్రదేశ్‌లోని దాదాపు 1.14 కోట్ల మంది రైతులు లబ్ధి పొందనున్నారు.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* పథకం బీమా కవరేజీ ద్వారా రూ. 1.5 లక్షల నుంచి రూ. 5 లక్షల వరకు లబ్ధిదారుని కుటుంబ సభ్యుల బ్యాంకు ఖాతాలో జమ చేయబడుతుంది.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '* లబ్ధిదారునికి ప్రత్యేక గుర్తింపు సంఖ్య మరియు పాలసీ నంబర్‌తో కూడిన గుర్తింపు కార్డు అందించబడుతుంది.',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
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
                              '* తెల్ల రేషన్ కార్డు',
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
                              '* నివాస ధృవీకరణ పత్రం',
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
                            const Text(
                              '*** లబ్ధిదారులైన రైతులు సమీపంలోని రైతు భరోసా కేంద్రాలను సందర్శించి వారి స్థితిని మరియు వైయస్సార్ ఉచిత పంటల బీమా పథకం యొక్క లబ్ధిదారుల జాబితాను తనిఖీ చేయవచ్చు..',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        ));
  }
}
