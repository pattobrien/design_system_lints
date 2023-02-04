import 'package:design_system_lints/design_system_lints.dart';
import 'package:sidecar/test.dart';
import 'package:test/test.dart';

void main() {
  group('description', () {
    setUpRules([TextStyle()]);

    ruleTest('GoogleFonts reference', '''
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '',
        style: GoogleFonts.aBeeZee(),
      ),
    );
  }
}

''', [ExpectedText('GoogleFonts.aBeeZee()')]);
  });
}
