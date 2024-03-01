import 'package:flutter/services.dart';
import 'package:interview_answers_app/config/constants.dart';

class LocalSubjectIconDataSource {
  Future<Map<int, String>> getIconBySubjectIdMap() async {
    return {
      1: await getIconByName('subjects_flutter'),
      2: await getIconByName('subjects_dart'),
      3: await getIconByName('subjects_general'),
      4: await getIconByName('subjects_hr'),
    };
  }

  Future<String> getIconByName(String name) async {
    return await rootBundle.loadString('${Constants.assetIconsPath}$name.svg');
  }
}
