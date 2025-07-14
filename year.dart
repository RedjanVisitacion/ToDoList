import 'dart:io';

void main() {
  final year = DateTime.now().year;
  final readme = '''
# REDJAN'S FIRST FLUTTER PRACTICE

> **DISCLAIMER:**  
> This Flutter app is for educational purposes only.

## Features
- Counter using \`setState()\`
- Material 3 design
- Debug banner removed

&copy; Redjan Visitacion $year. All rights reserved.
''';

  File('README.md').writeAsStringSync(readme);
}
