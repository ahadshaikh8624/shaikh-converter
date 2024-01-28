import 'dart:io';

void main() {
  print("\n Welcome To Shaikh's Unit Converter Console App \n");
  convertUnits();
}

void convertUnits() {
  List listOfMeasurements = ["Length", "Temperature", "Area", "Weight", "Time"];
  Map mapOfQuantitiesAndUnits = {
    "Length": [
      "1- Meters to Kilometers",
      "2- Kilometers to Meters",
      "3- Feet to Inches",
      "4- Inches to Feet",
      "5- Centimeters to Meters",
      "6- Meter to Centimeter"
    ],
    "Temperature": ["1- Fahrenheit to Celsius", "2- Celcius to Fahrenheit"],
    "Area": [
      "1- Square Miles to Square Yards",
      "2- Square Yards to Square Miles",
      "3- Square Yards to Square Feet",
      "4- Square Feet to Square Yards"
    ],
    "Weight": [
      "1- Kilograms to Grams",
      "2- Grams to Kilograms",
      "3- Pounds to Kilograms",
      "4- Kilograms to Tons",
      "5- Tons to Kilograms"
    ],
    "Time": [
      "1- Seconds to Minutes",
      "2- Minutes to Seconds",
      "3- Minutes to Hours",
      "4- Seconds to Hours",
      "5- Milliseconds to Minutes",
      "6- Milliseconds to Hours"
    ]
  };

  while (true) {
    print(
        """Please enter respective number of Quantity, whose unit you want to convert:
    1- Length
    2- Temperature
    3- Area
    4- Weight
    5- Time""");

    String? userInputToSelectQuantity = stdin.readLineSync() ?? "";

    if (userInputToSelectQuantity.isEmpty) {
      print("You did not enter anything. Exiting.");
      break;
    }

    int number = int.tryParse(userInputToSelectQuantity) ?? 0;

    if (number < 1 || number > listOfMeasurements.length) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    String mapKey = listOfMeasurements[number - 1];
    List subList = mapOfQuantitiesAndUnits[mapKey] ?? [];

    for (int i = 0; i < subList.length; i++) {
      print(subList[i]);
    }

    print("Please enter respective number for conversion:");
    String? userInputToSelectUnits = stdin.readLineSync() ?? "";

    if (userInputToSelectUnits.isEmpty) {
      print("You did not enter anything. Exiting.");
      break;
    }

    int indexNumberOfSublist = int.tryParse(userInputToSelectUnits) ?? 0;

    if (indexNumberOfSublist < 1 || indexNumberOfSublist > subList.length) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    if (userInputToSelectUnits.isNotEmpty) {
      int indexNumberOfSublist = int.parse(userInputToSelectUnits);

      if (mapKey == "Length") {
        if (indexNumberOfSublist == 1) {
          print("Enter value in Meter to convert in Kilometer:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double meters = double.parse(userInputToGiveValue);
          var result = metersToKm(meters);
          print("$userInputToGiveValue m = $result km");

        } else if (indexNumberOfSublist == 2) {
          print("Enter value in Kilometer to convert in Meter:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double kms = double.parse(userInputToGiveValue);
          var result = kmToMeters(kms);
          print("$userInputToGiveValue km = $result m");

        } else if (indexNumberOfSublist == 3) {
          print("Enter value in Foot to convert in Inch:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double fts = double.parse(userInputToGiveValue);
          var result = ftToInches(fts);
          print("$userInputToGiveValue ft = $result in");

        } else if (indexNumberOfSublist == 4) {
          print("Enter value in Inch to convert in Feet:");
          
          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double inches = double.parse(userInputToGiveValue);
          var result = inchesToFt(inches);
          print("$userInputToGiveValue in = $result ft");

        } else if (indexNumberOfSublist == 5) {
          print("Enter value in Centimeter to convert in Meter:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double cm = double.parse(userInputToGiveValue);
          var result = centimeterToMeter(cm);
          print("$userInputToGiveValue cm = $result m");

        } else if (indexNumberOfSublist == 6) {
          print("Enter value in Kilometer to convert in Meter:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double m = double.parse(userInputToGiveValue);
          var result = meterToCentimeter(m);
          print("$userInputToGiveValue m = $result cm");

        } else {
          print("Invalid input.");
        }
      } else if (mapKey == "Temperature") {
        if (indexNumberOfSublist == 1) {
          print("Enter value in Fahrenheit to convert in Celsius:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double fahrenheit = double.parse(userInputToGiveValue);
          var result = fahrenheitToCelsius(fahrenheit);
          print("$userInputToGiveValue F = $result C");

        } else if (indexNumberOfSublist == 2) {
          print("Enter value in Celsius to convert in Fahrenheit:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double celsius = double.parse(userInputToGiveValue);
          var result = celsiusToFahrenheit(celsius);
          print("$userInputToGiveValue C = $result F");

        } else {
          print("Invalid input.");
        }
      } else if (mapKey == "Area") {

        if (indexNumberOfSublist == 1) {
          print("Enter value in Square Mile to convert in Square Yard:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double sqMiles = double.parse(userInputToGiveValue);
          var result = sqMilesToSqYards(sqMiles);
          print("$userInputToGiveValue Square Mile = $result Square Yard");

        } else if (indexNumberOfSublist == 2) {
          print("Enter value in Square Yard to convert in Square Mile:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double sqYards = double.parse(userInputToGiveValue);
          var result = sqYardsToSqMiles(sqYards);
          print("$userInputToGiveValue Square Yard = $result Square Mile");

        } else if (indexNumberOfSublist == 3) {
          print("Enter value in Square Yard to convert in Square Foot:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double sqYard = double.parse(userInputToGiveValue);
          var result = sqYardsToSqFt(sqYard);
          print("$userInputToGiveValue Square Yard = $result Square Foot");

        } else if (indexNumberOfSublist == 4) {
          print("Enter value in Square Foot to convert in Square Yard:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double sqFts = double.parse(userInputToGiveValue);
          var result = sqFtsToSqYards(sqFts);
          print("$userInputToGiveValue Square Foot = $result Square Yard");

        } else {
          print("Invalid input.");
        }
      } else if (mapKey == "Weight") {
        if (indexNumberOfSublist == 1) {
          print("Enter value in Kilogram to convert in Gram:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double kg = double.parse(userInputToGiveValue);
          var result = kgToGram(kg);
          print("$userInputToGiveValue kg = $result g");

        } else if (indexNumberOfSublist == 2) {
          print("Enter value in Gram to convert in Kilogram:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double gram = double.parse(userInputToGiveValue);
          var result = gramToKg(gram);
          print("$userInputToGiveValue g = $result kg");

        } else if (indexNumberOfSublist == 3) {
          print("Enter value in Pound to convert in Kilogram:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double lb = double.parse(userInputToGiveValue);
          var result = lbToKg(lb);
          print("$userInputToGiveValue lb = $result kg");

        } else if (indexNumberOfSublist == 4) {
          print("Enter value in Kilogram to convert in Ton:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double kg = double.parse(userInputToGiveValue);
          var result = kgToTon(kg);
          print("$userInputToGiveValue kg = $result t");

        } else if (indexNumberOfSublist == 5) {
          print("Enter value in Kilogram to convert in Ton:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double ton = double.parse(userInputToGiveValue);
          var result = tonToKg(ton);
          print("$userInputToGiveValue t = $result kg");

        } else {
          print("Invalid input.");
        }
      } else if (mapKey == "Time") {
        if (indexNumberOfSublist == 1) {
          print("Enter value in Seconds to convert in Minutes:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double sec = double.parse(userInputToGiveValue);
          var result = secToMin(sec);
          print("$userInputToGiveValue s = $result min");

        } else if (indexNumberOfSublist == 2) {
          print("Enter value in Minutes to convert in Seconds:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double min = double.parse(userInputToGiveValue);
          var result = minToSec(min);
          print("$userInputToGiveValue min = $result sec");

        } else if (indexNumberOfSublist == 3) {
          print("Enter value in Minutes to convert in Hours:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double min = double.parse(userInputToGiveValue);
          var result = minToHour(min);
          print("$userInputToGiveValue min = $result h");

        } else if (indexNumberOfSublist == 4) {
          print("Enter value in Seconds to convert in Hours:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double sec = double.parse(userInputToGiveValue);
          var result = secToHours(sec);
          print("$userInputToGiveValue sec = $result h");

        } else if (indexNumberOfSublist == 5) {
          print("Enter value in Millisceonds to convert in Minutes:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double mSec = double.parse(userInputToGiveValue);
          var result = mSecToMin(mSec);
          print("$userInputToGiveValue ms = $result min");
        } else if (indexNumberOfSublist == 6) {
          print("Enter value in Millisceonds to convert in Hours:");

          String userInputToGiveValue = stdin.readLineSync() ?? "";
          double mSec = double.parse(userInputToGiveValue);
          var result = mSecToHour(mSec);
          print("$userInputToGiveValue ms = $result h");

        } else {
          print("Invalid input.");
        }
      } else {
        print("Default");
      }
    } else {
      print("You did not enter anything.");
    }

    print("Do you want to continue? (Enter respective number: 1-Yes, 2-No)");
    String? userInputToContinue = stdin.readLineSync() ?? "";

    if (userInputToContinue.isEmpty || userInputToContinue != '1') {
      print(
          "Thank you for using the Noor's Unit Converter Console Application. Exiting!!");
      break;
    }
  }
}

double metersToKm(double meters) {
  return meters / 1000; // 1 km = 1000 m
}

double kmToMeters(double kms) {
  return kms * 1000; // 1 km = 1000 m
}

double ftToInches(double fts) {
  return fts * 12; // 1 ft = 12 in
}

double inchesToFt(double inches) {
  return inches / 12; // 1 ft = 12 in
}

double centimeterToMeter(double cm) {
  return cm / 100; // 1 m = 100 cm
}

double meterToCentimeter(double m) {
  return m * 100; // 1 m = 100 cm
}

// For Temperature Conversions

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

// Area Conversions

double sqMilesToSqYards(double sqMiles) {
  return sqMiles * 3097600.0; // 1 square mile = 3,097,600 square yards
}

double sqYardsToSqMiles(double sqYards) {
  return sqYards / 3097600.0; // 1 square mile = 3,097,600 square yards
}

double sqYardsToSqFt(double sqYard) {
  return sqYard * 9; // 1 square yard = 9 square fts
}

double sqFtsToSqYards(double sqFts) {
  return sqFts / 9; // 1 square yard = 9 square fts
}

// Weight Conversions

double kgToGram(double kg) {
  return kg * 1000; // 1 kg = 1000 g
}

double gramToKg(double gram) {
  return gram / 1000; // 1 kg = 1000 g
}

double lbToKg(double lb) {
  return lb * 0.453592; // 1 lb = 0.453592 kg
}

double kgToTon(double kg) {
  return kg / 1000; // 1 ton = 1000 kg
}

double tonToKg(double ton) {
  return ton * 1000; // 1 ton = 1000 kg
}

// Time Conversions

double secToMin(double sec) {
  return sec / 60; // 1 min = 60 sec
}

double minToSec(double min) {
  return min * 60; // 1 min = 60 sec
}

double minToHour(double min) {
  return min / 60; // 1 hr = 60 min
}

double secToHours(double sec) {
  return sec / 3600; // 1 hr = 3600 sec
}

double mSecToMin(double mSec) {
  return mSec / 60000; // 1 min = 60000 milliseconds
}

double mSecToHour(double mSec) {
  return mSec / 3600000; // 1 Hour = 3600000 Milliseconds
}
