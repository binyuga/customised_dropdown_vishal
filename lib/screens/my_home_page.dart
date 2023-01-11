import 'package:flutter/material.dart';

import '../widgets/vishal_drop_down/vishal_drop_down_button.dart';
import '../widgets/vishal_drop_down/vishal_drop_down_element.dart';
import '../widgets/vishal_drop_down/vishal_drop_down_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: VishalDropDownButton(
                      showDropDownIcon: false,
                      overlayWidth: MediaQuery.of(context).size.width / 4.0,
                      orientation: OverlayOrientation.rightBottom,
                      overlayHeight: 400,
                      leading: const Icon(
                        Icons.menu,
                        size: 20,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: Colors.lightGreenAccent, width: 3)),
                      children: [
                        VishalDropDownSection(children: [
                          VishalDropDownElement(
                            center: Column(
                              children: const [
                                Icon(
                                  Icons.settings,
                                  size: 50,
                                ),
                                Text('Settings')
                              ],
                            ),
                            onClick: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Settings')));
                            },
                          ),
                          VishalDropDownElement(
                            center: Column(
                              children: const [
                                Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.cyan,
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(color: Colors.cyan),
                                )
                              ],
                            ),
                            onClick: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('My profile')));
                            },
                          ),
                          VishalDropDownElement(
                            center: Column(
                              children: const [
                                Icon(
                                  Icons.notifications,
                                  size: 50,
                                  color: Colors.brown,
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(color: Colors.brown),
                                )
                              ],
                            ),
                            onClick: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('notifications')));
                            },
                          ),
                        ]),
                        VishalDropDownElement(
                          center: Column(
                            children: const [
                              Icon(
                                Icons.logout,
                                size: 50,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                          onClick: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('notifications')));
                          },
                        ),
                      ]),
                ),
                SizedBox(
                  height: 80,
                ),
                VishalDropDownButton(
                    overlayWidth: MediaQuery.of(context).size.width / 2.0,
                    orientation: OverlayOrientation.rightBottom,
                    overlayHeight: 200,
                    leading: const Text(
                      'See Profile',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                            color: Colors.lightGreenAccent, width: 3)),
                    children: [
                      VishalDropDownSection(
                          header: "This is header 1",
                          children: [
                            VishalDropDownElement(
                              leadingIcon: const Icon(Icons.settings),
                              center: const Text(
                                "Settings",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onClick: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Settings')));
                              },
                            ),
                            VishalDropDownElement(
                              leadingIcon: const Icon(Icons.person),
                              center: const Text(
                                "My profile",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onClick: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('My profile')));
                              },
                            ),
                            VishalDropDownElement(
                              leadingIcon: const Icon(Icons.notifications),
                              center: const Text(
                                "Notifications",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onClick: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('notifications')));
                              },
                            ),
                          ]),
                      VishalDropDownSection(header: "About Device", children: [
                        VishalDropDownElement(
                          center: const Text(
                            "See the company Documentation",
                            style: TextStyle(fontSize: 10),
                          ),
                          onClick: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('see documentation')));
                          },
                        ),
                        VishalDropDownElement(
                          center: const Text(
                            "View the terms and Conditions",
                            style: TextStyle(fontSize: 10),
                          ),
                          onClick: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Terms and Conditions')));
                          },
                        ),
                      ]),
                    ]),
                SizedBox(
                  height: 80,
                ),
                VishalDropDownButton(
                  overlayHeight: 250,
                  orientation: OverlayOrientation.leftBottom,
                  overlayWidth: MediaQuery.of(context).size.width / 2.0,
                  children: [
                    VishalDropDownSection(header: "My ones", children: [
                      VishalDropDownElement(
                        leadingIcon: const Icon(Icons.add),
                        center: const Text(
                          "first",
                          style: TextStyle(color: Colors.blue),
                        ),
                        trailingIcon: Row(
                          children: const [
                            Icon(Icons.add_chart_sharp),
                            Icon(Icons.add_chart_sharp),
                          ],
                        ),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('first')));
                        },
                      ),
                      VishalDropDownElement(
                        leadingIcon: const Icon(Icons.radar_outlined),
                        center: const Text("second"),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('second')));
                        },
                      ),
                      VishalDropDownElement(
                        leadingIcon:
                            const Icon(Icons.access_time_filled_outlined),
                        center: const Text("third"),
                        trailingIcon: Row(
                          children: const [
                            Icon(Icons.g_translate_outlined),
                          ],
                        ),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('third')));
                        },
                      ),
                    ]),
                    VishalDropDownElement(
                      center: const Text("fourth"),
                      onClick: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('fourth')));
                      },
                    ),
                    VishalDropDownSection(children: [
                      VishalDropDownElement(
                        center: const Text("fifth"),
                        trailingIcon: Row(
                          children: const [
                            Text('text'),
                            Icon(Icons.add_chart_sharp),
                          ],
                        ),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('fifth')));
                        },
                      ),
                      VishalDropDownElement(
                        leadingIcon: const Icon(Icons.pageview),
                        center: const Text("sixth"),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('sixth')));
                        },
                      ),
                    ]),
                    VishalDropDownElement(
                      center: const Text("Hello select this"),
                      onClick: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Hello select this')));
                      },
                    ),
                    VishalDropDownElement(
                        center: const Icon(Icons.join_full_outlined),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('icon is tapped')));
                        }),
                    VishalDropDownElement(
                        center: const Text("Vishal"),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Vishal')));
                        }),
                    VishalDropDownElement(
                        leadingIcon: const Icon(Icons.add),
                        center: const Text("Prachi"),
                        onClick: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Prachi')));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
