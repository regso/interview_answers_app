import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_answers_app/config/main_app.dart';
import 'package:interview_answers_app/config/main_init.dart';

final sl = GetIt.instance;

void main() {
  mainInit();
  runApp(const MainApp());
}
