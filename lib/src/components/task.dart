import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:myapp/auth/auth_state.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:auth_buttons/auth_buttons.dart';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:collection/collection.dart';
import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:latlng/latlng.dart';
import 'package:badges/badges.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:teta_cms/teta_cms.dart';
import 'package:webviewx/webviewx.dart';

class PageTask extends StatefulWidget {
  const PageTask({
    Key? key,
    this.name = '''love''',
    this.id = '''629f8caf63fecc9b750cde6a''',
  }) : super(key: key);

  final String name;
  final String id;

  @override
  _StateTask createState() => _StateTask();
}

class _StateTask extends State<PageTask> {
  var datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 16,
        right: 24,
      ),
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
                width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
            top: BorderSide(
                width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
            right: BorderSide(
                width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
            bottom: BorderSide(
                width: 0, style: BorderStyle.none, color: Color(0xFF000000)),
          ),
        ),
        child: Card(
          elevation: 10,
          color: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Text('''${widget.name}''',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      maxLines: 4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
