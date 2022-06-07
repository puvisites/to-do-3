import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/src/components/index.dart';

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

class PageHomePage extends StatefulWidget {
  const PageHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _StateHomePage createState() => _StateHomePage();
}

class _StateHomePage extends State<PageHomePage> {
  var datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border(
                left: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                top: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                right: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
                bottom: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                    color: Color(0xFF000000)),
              ),
            ),
            child: Stack(
              children: [
                SafeArea(
                  left: false,
                  top: true,
                  right: false,
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          top: 24,
                        ),
                        child: Text(r'''Your Task''',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: const Color(0xFF30A283),
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                fontStyle: FontStyle.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            textAlign: TextAlign.left,
                            textDirection: TextDirection.ltr,
                            maxLines: 1),
                      ),
                      FutureBuilder(
                          future: TetaCMS.instance.auth.user.get,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final user = snapshot.data as Map<String, dynamic>?;
                            final data = <String, dynamic>{
                              'isLogged': user?.keys.isNotEmpty,
                              'uid': user?['uid'],
                              'name': user?['name'],
                              'email': user?['email'],
                              'locale': user?['locale'],
                              'provider': user?['provider'],
                            };
                            datasets['Teta Auth User'] = [
                              if (data != null) data,
                            ];
                            const index = 0;
                            return StreamBuilder(
                                stream:
                                    TetaCMS.instance.realtime.streamCollection(
                                  '629f8acc63fecc9b750cdb25',
                                  filters: [
                                    Filter('_vis', 'public'),
                                  ],
                                ),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  final list = snapshot.data as List<dynamic>?;
                                  datasets['Cms stream'] =
                                      list ?? const <dynamic>[];
                                  const index = 0;

                                  return SizedBox(
                                    width: double.maxFinite,
                                    height: 800,
                                    child: Builder(
                                      builder: (context) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: this
                                                      .datasets['Cms stream']
                                                      .length >
                                                  0
                                              ? this
                                                  .datasets['Cms stream']
                                                  .length
                                              : 0,
                                          itemBuilder: (context, index) {
                                            return PageTask(
                                              name: datasets['Cms stream']
                                                      ?[index]?['name'] ??
                                                  '',
                                              id: datasets['Cms stream']?[index]
                                                      ?['_id'] ??
                                                  '',
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                });
                          }),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageCreateTask(),
                              ),
                            );
                          },
                          onDoubleTap: () async {},
                          onLongPress: () async {},
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 32,
                              bottom: 56,
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 16,
                              right: 16,
                              bottom: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF30A283),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                                bottomLeft: Radius.circular(32),
                              ),
                              border: Border(
                                left: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                    color: Color(0xFF000000)),
                                top: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                    color: Color(0xFF000000)),
                                right: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                    color: Color(0xFF000000)),
                                bottom: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                    color: Color(0xFF000000)),
                              ),
                            ),
                            child: Icon(
                              MdiIcons.fromString('plus'),
                              size: 32,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
