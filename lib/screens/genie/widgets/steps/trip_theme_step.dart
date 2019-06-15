import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';

class TripThemeStep extends StatefulWidget {
  final VoidCallback incrementStep;
  final setThemes;

  TripThemeStep({
    this.incrementStep,
    this.setThemes,
  });

  @override
  _TripThemeStepState createState() => _TripThemeStepState();
}

class _TripThemeStepState extends State<TripThemeStep> {
  Map<String, Map<String, String>> themes = {
    'nature': {'image': 'images/nature.png', 'label': "Nature"},
    'culinary': {'image': 'images/culinary.png', 'label': "Culinary"},
    'sightseeing': {'image': 'images/sightseeing.png', 'label': "Sightseeing"},
    'romantic': {'image': 'images/romantic.png', 'label': "Romantic"},
    'historical': {'image': 'images/historical.png', 'label': "Historical"},
    'shopping': {'image': 'images/shopping.png', 'label': "Shopping"},
  };

  Map<String, bool> selectedThemes = {
    'nature': false,
    'culinary': false,
    'sightseeing': false,
    'romantic': false,
    'historical': false,
    'shopping': false,
  };

  void toggleTheme(String theme) {
    setState(() {
      selectedThemes[theme] = !(selectedThemes[theme]);
    });
  }

  Map<String, String> getThemeInfo(String value) {
    return themes[value];
  }

  bool isThemeSelected(String value) {
    return selectedThemes[value];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pick a trip experience that interests you",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TripThemeCard(
                value: "nature",
                toggleTheme: toggleTheme,
                getThemeInfo: getThemeInfo,
                isThemeSelected: isThemeSelected,
              ),
              TripThemeCard(
                value: "culinary",
                toggleTheme: toggleTheme,
                getThemeInfo: getThemeInfo,
                isThemeSelected: isThemeSelected,
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TripThemeCard(
                value: "sightseeing",
                toggleTheme: toggleTheme,
                getThemeInfo: getThemeInfo,
                isThemeSelected: isThemeSelected,
              ),
              TripThemeCard(
                value: "romantic",
                toggleTheme: toggleTheme,
                getThemeInfo: getThemeInfo,
                isThemeSelected: isThemeSelected,
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TripThemeCard(
                value: "historical",
                toggleTheme: toggleTheme,
                getThemeInfo: getThemeInfo,
                isThemeSelected: isThemeSelected,
              ),
              TripThemeCard(
                value: "shopping",
                toggleTheme: toggleTheme,
                getThemeInfo: getThemeInfo,
                isThemeSelected: isThemeSelected,
              ),
            ],
          ),
          SizedBox(height: 80),
          Center(
            child: MagicButton(
              text: "     Next     ",
              callback: () {
                widget.incrementStep();
                widget.setThemes(selectedThemes);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TripThemeCard extends StatelessWidget {
  final String value;
  final toggleTheme;
  final getThemeInfo;
  final isThemeSelected;

  TripThemeCard({
    @required this.value,
    @required this.toggleTheme,
    @required this.getThemeInfo,
    @required this.isThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> themeInfo = this.getThemeInfo(value);
    bool isThemeSelected = this.isThemeSelected(value);

    return GestureDetector(
      onTap: () => this.toggleTheme(this.value),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 160,
                height: 80,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: isThemeSelected
                            ? Colors.blue.withOpacity(0.8)
                            : Colors.black.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: Offset(
                          0,
                          -9,
                        ),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(themeInfo['image']),
                      fit: BoxFit.fill,
                    )),
              ),
              Visibility(
                visible: isThemeSelected,
                child: Container(
                  width: 160,
                  height: 80,
                  color: Colors.blue.withOpacity(0.4),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            themeInfo['label'],
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: isThemeSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
