# TimeBar Table

The TimeBar Table Flutter package is designed to facilitate the creation of time-based bar charts with ease. It allows you to represent data that spans across specific time intervals, making it ideal for various applications, such as scheduling, event timelines, and more. This package offers customizable components for efficient data visualization within your Flutter application.

## Features

- **Time-Based Visualization:** Easily represent data along a time axis with adjustable intervals.

- **Customization:** Tailor the appearance of your time bars, intervals, and more to suit your application's aesthetic.

- **Flexible Data Presentation:** Display various data elements simultaneously, enabling rich and informative timelines.

## Installation

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  timebar_table: ^0.0.1
```

Then, run flutter pub get to install the package.

## Usage
```dart
import 'package:flutter/material.dart';
import 'package:timebar_table/timebar_table.dart';

final DateTime tableStartTime = DateTime(2023, 9, 30, 8, 0);
final DateTime tableEndTime = DateTime(2023, 9, 30, 16, 0);
const Duration timeInterval = Duration(minutes: 30);
const double intervalWidth = 50.0;

// Define your data using a map where the keys are widgets and the values are lists of BarData.
final Map<Widget, List<BarData?>?> tableDataMap = {
  // Define your data here
};

final Widget emptyDataWidget = Container(
  width: intervalWidth,
  // Customize your empty data representation
);

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('TimeBarTable Example'),
      ),
      body: TimeBarTable(
        tableStartTime: tableStartTime,
        tableEndTime: tableEndTime,
        timeInterval: timeInterval,
        intervalWidth: intervalWidth,
        tableDataList: tableDataMap,
        emptyDataWidget: emptyDataWidget,
      ),
    ),
  ));
}
```

## Documentation

For detailed usage and customization options, consult the [API documentation](https://pub.dev/documentation/timebar_table/latest/).

## Example

To see how the package can be customized and integrated into your Flutter application, check out the included example.

## Contributions

Contributions are welcome! If you encounter any issues, have feature suggestions, or would like to contribute, please feel free to open an [issue](https://github.com/mihirrawal1399/timebar_table/issues) or submit a [pull request](https://github.com/mihirrawal1399/timebar_table/pulls).

## License
This package is released under the [MIT License](https://pub.dev/packages/timebar_table/license), allowing you to use, modify, and distribute it as needed.

## Author
Developed by [Mihir Rawal] - Contact me at [mihirrawal1399@gmail.com] for inquiries and support.