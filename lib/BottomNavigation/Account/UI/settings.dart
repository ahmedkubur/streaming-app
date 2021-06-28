import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../language_cubit.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController downloadsController = TextEditingController();
  TextEditingController qualityController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  LanguageCubit _languageCubit;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  void dispose() {
    downloadsController.dispose();
    qualityController.dispose();
    languageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    downloadsController.text = appLocalization.wifiOnly;
    qualityController.text = 'HD (High Definition) 720p';
    languageController.text = appLocalization.englishText;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(appLocalization.settings),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              buildEntryField(
                context: context,
                controller: qualityController,
                label: appLocalization.videoQuality,
                upperPadding: 120.0,
                items: [
                  PopupMenuItem(
                    child: Text('HD (High Definition) 720p'),
                    value: 'HD (High Definition) 720p',
                  ),
                  PopupMenuItem(
                    child: Text('Full HD 1080p'),
                    value: 'Full HD 1080p',
                  ),
                ],
              ),
              buildEntryField(
                context: context,
                controller: languageController,
                label: appLocalization.preferredAppLanguage,
                upperPadding: 180.0,
                items: [
                  PopupMenuItem(
                    child: Text('English'),
                    value: 'English',
                  ),
                  PopupMenuItem(
                    child: Text('Spanish'),
                    value: 'Spanish',
                  ),
                  PopupMenuItem(
                    child: Text('Portuguese'),
                    value: 'Portuguese',
                  ),
                  PopupMenuItem(
                    child: Text('French'),
                    value: 'French',
                  ),
                  PopupMenuItem(
                    child: Text('Arabic'),
                    value: 'Arabic',
                  ),
                  PopupMenuItem(
                    child: Text('Indonesian'),
                    value: 'Indonesian',
                  ),
                ],
              ),
//            buildEntryField(
//              context: context,
//              controller: downloadsController,
//              label: appLocalization.downloads,
//              upperPadding: 240.0,
//              items: [
//                PopupMenuItem(
//                  child: Text(appLocalization.wifiOnly),
//                  value: appLocalization.wifiOnly,
//                ),
//                PopupMenuItem(
//                  child: Text(appLocalization.mobileData),
//                  value: appLocalization.mobileData,
//                ),
//              ],
//            ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  EntryField buildEntryField({
    BuildContext context,
    TextEditingController controller,
    String label,
    List<PopupMenuItem> items,
    double upperPadding,
  }) {
    return EntryField(
      controller: controller,
      label: label,
      readOnly: true,
      suffixIcon: Icon(
        Icons.keyboard_arrow_down,
        color: mainColor,
      ),
      onTap: () async {
        var prefs = await SharedPreferences.getInstance();
        var result = await showMenu(
          color: textBackgroundColor,
          context: context,
          position: RelativeRect.fromLTRB(100.0, upperPadding, 30.0, 0.0),
          items: items,
        );
        if (result == null) {
          result = controller.text;
        }
        if (result == 'English') {
          prefs.setString('locale', 'en');
          _languageCubit.selectEngLanguage();
        } else if (result == 'Arabic') {
          prefs.setString('locale', 'ar');
          _languageCubit.selectArabicLanguage();
        } else if (result == 'Portuguese') {
          prefs.setString('locale', 'pt');
          _languageCubit.selectPortugueseLanguage();
        } else if (result == 'French') {
          prefs.setString('locale', 'fr');
          _languageCubit.selectFrenchLanguage();
        } else if (result == 'Spanish') {
          prefs.setString('locale', 'es');
          _languageCubit.selectSpanishLanguage();
        } else if (result == 'Indonesian') {
          prefs.setString('locale', 'in');
          _languageCubit.selectIndonesianLanguage();
        }
        controller.text = result.toString();
      },
    );
  }
}
