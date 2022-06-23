import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_split_project/components/inputData.dart';
import 'package:lets_split_project/components/percentButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './components/section_title.dart';
import './components/custom_percent_data.dart';

import './kConstants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? billAmount = 0;
  double chosenPercent = 0;
  late int? numberOfPeople;

  TextEditingController _peopleController = TextEditingController(text: '1');
  TextEditingController _billController = TextEditingController();
  TextEditingController _customPercentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      numberOfPeople = int.tryParse(_peopleController.text);
    });
  }

  void updateBillAmount(value) {
    setState(() {
      billAmount = double.tryParse(value) ?? 0;
    });
    print(billAmount);
  }

  String individualTotalTip() {
    return (chosenPercent / 100 * billAmount! / numberOfPeople!)
        .toStringAsFixed(2);
  }

  String individualTotal() {
    if (billAmount == null) {
      return 0.toStringAsFixed(2);
    } else {
      return (billAmount! * (1 + chosenPercent / 100) / numberOfPeople!)
          .toStringAsFixed(2);
    }
  }

  Map<String, bool> percentActive = {
    '5%': false,
    '10%': false,
    '15%': false,
    '25%': false,
    '50%': false,
  };

  void makeAllInactive() => percentActive = {
        '5%': false,
        '10%': false,
        '15%': false,
        '25%': false,
        '50%': false,
      };

  void activatePercent(String selectedPercent) {
    makeAllInactive();
    percentActive[selectedPercent] = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: Colors.cyan[900]),
        textTheme: const TextTheme(
          titleSmall: kInputTitle,
        ),
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFFC4E4E7),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('images/logo.svg'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kSpaceBetweenSections,
                                SectionTitle(
                                  title: 'Bill',
                                  style: kInputTitle,
                                ),
                                kSectionTitleAndContentSpace,
                                InputData(
                                  controller: _billController,
                                  onChange: (value) => updateBillAmount(value),
                                  icon: FontAwesomeIcons.dollarSign,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  restrictionsForInput: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[-, ]')),
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d{0,2}'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    kSpaceBetweenSections,
                                    SectionTitle(
                                      title: 'Select Tip %',
                                      style: kInputTitle,
                                    ),
                                    PercentButton(
                                      width: 147,
                                      height: 47,
                                      backgroundColor: percentActive['5%']
                                              as bool
                                          ? kActivePercentButtonBackgroundColor
                                          : kInactivePercentButtonBackgroundColor,
                                      textColor: percentActive['5%'] as bool
                                          ? Color(0xFF003E46)
                                          : null,
                                      title: '5%',
                                      updatePercent: () {
                                        double percent = 5;
                                        setState(() {
                                          _customPercentController.clear();
                                          activatePercent('5%');
                                          chosenPercent = percent;
                                          print(chosenPercent);
                                        });
                                      },
                                    ),
                                    PercentButton(
                                      width: 147,
                                      height: 47,
                                      backgroundColor: percentActive['15%']
                                              as bool
                                          ? kActivePercentButtonBackgroundColor
                                          : kInactivePercentButtonBackgroundColor,
                                      textColor: percentActive['15%'] as bool
                                          ? Color(0xFF003E46)
                                          : null,
                                      title: '15%',
                                      updatePercent: () {
                                        double percent = 15;
                                        setState(() {
                                          _customPercentController.clear();
                                          activatePercent('15%');
                                          chosenPercent = percent;
                                          print(chosenPercent);
                                        });
                                      },
                                    ),
                                    PercentButton(
                                      width: 147,
                                      height: 47,
                                      backgroundColor: percentActive['50%']
                                              as bool
                                          ? kActivePercentButtonBackgroundColor
                                          : kInactivePercentButtonBackgroundColor,
                                      textColor: percentActive['50%'] as bool
                                          ? Color(0xFF003E46)
                                          : null,
                                      title: '50%',
                                      updatePercent: () {
                                        double percent = 50;
                                        setState(() {
                                          _customPercentController.clear();
                                          activatePercent('50%');
                                          chosenPercent = percent;
                                          print(chosenPercent);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    PercentButton(
                                      width: 147,
                                      height: 47,
                                      backgroundColor: percentActive['10%']
                                              as bool
                                          ? kActivePercentButtonBackgroundColor
                                          : kInactivePercentButtonBackgroundColor,
                                      textColor: percentActive['10%'] as bool
                                          ? Color(0xFF003E46)
                                          : null,
                                      title: '10%',
                                      updatePercent: () {
                                        double percent = 10;
                                        setState(() {
                                          _customPercentController.clear();
                                          activatePercent('10%');
                                          chosenPercent = percent;
                                          print(chosenPercent);
                                        });
                                      },
                                    ),
                                    PercentButton(
                                      width: 147,
                                      height: 47,
                                      backgroundColor: percentActive['25%']
                                              as bool
                                          ? kActivePercentButtonBackgroundColor
                                          : kInactivePercentButtonBackgroundColor,
                                      textColor: percentActive['25%'] as bool
                                          ? Color(0xFF003E46)
                                          : Colors.white,
                                      title: '25%',
                                      updatePercent: () {
                                        double percent = 25;
                                        setState(() {
                                          _customPercentController.clear();
                                          activatePercent('25%');
                                          chosenPercent = percent;
                                          print(chosenPercent);
                                        });
                                      },
                                    ),
                                    CustomPercentData(
                                      width: 147,
                                      height: 47,
                                      customInputController:
                                          _customPercentController,
                                      onChanged: (value) {
                                        double percent =
                                            double.tryParse(value) ?? 0;
                                        setState(() {
                                          chosenPercent = percent;
                                          print(chosenPercent);
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          makeAllInactive();
                                          _customPercentController.clear();
                                        });
                                      },
                                      hintTitle: 'Custom',
                                      keyboardType: TextInputType.number,
                                      restrictions: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'(^\d*\.?\d{0,2})')),
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[-, ]')),
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'^\.')),
                                        // FilteringTextInputFormatter.deny(
                                        //     RegExp(r'\.{2,}')),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kSpaceBetweenSections,
                                SectionTitle(
                                  title: 'Number of people',
                                  style: kInputTitle,
                                ),
                                kSectionTitleAndContentSpace,
                                InputData(
                                  controller: _peopleController,
                                  onChange: (value) {
                                    setState(() {
                                      numberOfPeople =
                                          int.tryParse(value!) ?? 1;
                                    });
                                  },
                                  icon: Icons.person,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: false,
                                    signed: false,
                                  ),
                                  restrictionsForInput: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[-,. ]')),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'^[0]')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF00474A),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            height: 255.0,
                            width: 326.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Tip Amount',
                                          style: TextStyle(
                                            color: Color(0xFFF1FFFF),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'SpaceMono',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          '/ person',
                                          style: TextStyle(
                                            color: Color(0xFF7DA2AA),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'SpaceMono',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '\$${individualTotalTip()}',
                                          style: const TextStyle(
                                            color: Color(0xFF28C4AE),
                                            fontSize: 24,
                                            fontFamily: 'SpaceMono',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                              color: Color(0xFFF1FFFF),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'SpaceMono',
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            '/ person',
                                            style: TextStyle(
                                              color: Color(0xFF7DA2AA),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'SpaceMono',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '\$${individualTotal()}',
                                            style: const TextStyle(
                                              color: Color(0xFF28C4AE),
                                              fontSize: 24,
                                              fontFamily: 'SpaceMono',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.resolveWith(
                                      (states) => const EdgeInsets.symmetric(
                                          horizontal: 105, vertical: 8),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) => const Color(0xFF25C2AD),
                                    ),
                                  ),
                                  onPressed: () {
                                    //Reset initial State.
                                    setState(() {
                                      billAmount = 0;
                                      numberOfPeople = 1;
                                      chosenPercent = 0;
                                      _peopleController.text = '1';
                                      _billController.clear();
                                      _customPercentController.clear();
                                      makeAllInactive();
                                    });
                                  },
                                  child: Text(
                                    'Reset'.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'SpaceMono',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF004847),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
