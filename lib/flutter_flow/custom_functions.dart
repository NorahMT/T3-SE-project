import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? newCustomFunction(String? password) {
  // require a letter, a number and a minimmum length of 8 for password
  if (password == null || password.isEmpty) {
    return false;
  }
  final hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
  final hasNumber = password.contains(RegExp(r'[0-9]'));
  final hasMinLength = password.length >= 8;
  return hasLetter && hasNumber && hasMinLength;
}
