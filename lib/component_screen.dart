import 'package:flutter/material.dart';

import 'contacts.dart';

class ComponentScreen extends StatefulWidget {
  ComponentScreen({super.key, required this.showNavBottomBar});

  final bool showNavBottomBar;

  @override
  State<ComponentScreen> createState() => _ComponentScreenState();
}

class _ComponentScreenState extends State<ComponentScreen> {
  var words = <String>[];
  bool isSecondHit = false;
  String ready = '';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.inverseSurface);
    List<String> secreteNumList = secreteNum != null ? secreteNum.split('') : [];
    String result = '';

    for (int i = 0; i < secreteNumList.length; i++) {
      if (!(secreteNumList[i] == ' ' || i == 0)) {
        result = result + secreteNumList[i];
      }
    }
    String str = '';
    for (var i = 0; i < words.length; i++) {
      str = str + words[i];
    }
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.topRight,
                      child: SingleChildScrollView(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          child: TextStyleExample(name: str, style: textTheme.displayMedium!)),
                    ),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topRight,
                        child: TextStyleExample(name: ready, style: textTheme.displaySmall!)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            words.add("√");
                          });
                        },
                        child: TextStyleExample(name: "√", style: textTheme.headlineLarge!),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              words.add("π");
                            });
                          },
                          child: TextStyleExample(name: "π", style: textTheme.headlineLarge!)),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              words.add("^");
                            });
                          },
                          child: TextStyleExample(name: "^", style: textTheme.headlineLarge!)),
                      GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContactScreen()),
                          );
                        },
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                words.add("!");
                              });
                            },
                            child: TextStyleExample(name: "!", style: textTheme.headlineLarge!)),
                      ),
                      //IconButton
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              // Foreground color
                              foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                              // Background color
                              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                            )),
                      )
                    ],
                  ),
                  // Row: 1

                  const SizedBox(
                    height: 10,
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              words.clear();
                            });
                          },
                          child: const Text(
                            'AC',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isSecondHit == false) {
                                words.add('(');
                                isSecondHit = true;
                              } else {
                                words.add(')');
                                isSecondHit = false;
                              }
                            });
                          },
                          child: const Text(
                            '(  )',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('%');
                            });
                          },
                          child: const Text(
                            '%',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() => words.add('÷'));
                          },
                          child: const Text(
                            '÷',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row: 2

                  const SizedBox(
                    height: 10,
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('7');
                            });
                          },
                          child: const Text(
                            '7',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('8');
                            });
                          },
                          child: const Text(
                            '8',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('9');
                            });
                          },
                          child: const Text(
                            '9',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('x');
                            });
                          },
                          child: const Text(
                            'x',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Row: 3

                  const SizedBox(
                    height: 10,
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('4');
                            });
                          },
                          child: const Text(
                            '4',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('5');
                            });
                          },
                          child: const Text(
                            '5',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('6');
                            });
                          },
                          child: const Text(
                            '6',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('-');
                            });
                          },
                          child: const Text(
                            '—',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Row:4

                  const SizedBox(
                    height: 10,
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('1');
                            });
                          },
                          child: const Text(
                            '1',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('2');
                            });
                          },
                          child: const Text(
                            '2',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('3');
                            });
                          },
                          child: const Text(
                            '3',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('+');
                            });
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Row: last

                  const SizedBox(
                    height: 10,
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('0');
                            });
                          },
                          child: const Text(
                            '0',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                          onPressed: () {
                            setState(() {
                              words.add('.');
                            });
                          },
                          child: const Text(
                            '.',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              // Adjust the value to control the button's size
                              // Foreground color
                              foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                              // Background color
                              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                            ),
                            onPressed: () {
                              setState(() {
                                words.removeLast();
                              });
                            },
                            child: Icon(Icons.backspace)),
                      ),
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // Adjust the value to control the button's size
                            // Foreground color
                            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                            // Background color
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          onPressed: () {
                            setState(() {
                              ready = result;
                            });
                          },
                          child: const Text(
                            '=',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}
