import 'dart:math';
import 'package:flutter/material.dart';

class BMIcaculator {
  final int weight;
  final double height;
  double _bmi;

  BMIcaculator({this.height, this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 40)
      return "Béo phì mức độ 3";
    else if (_bmi >= 35)
      return "Béo phì mức độ 2";
    else if (_bmi >= 30)
      return "Béo phì mức độ 1";
    else if (_bmi >= 25)
      return 'Mập';
    else if (_bmi >= 18.5)
      return 'Bình thường';
    else if (_bmi >= 16)
      return "Thiếu cân";
    else if (_bmi >= 15)
      return "Thiếu cân đáng quan ngại";
    else
      return "Thiếu cân trầm trọng";
  }

  Color getColorText() {
    if (_bmi >= 40)
      return Colors.red;
    else if (_bmi >= 35)
      return Colors.redAccent;
    else if (_bmi >= 30)
      return Colors.orange;
    else if (_bmi >= 25)
      return Colors.yellow;
    else if (_bmi >= 18.5)
      return Color(0xFF22E67B);
    else if (_bmi >= 16)
      return Colors.lightBlue;
    else if (_bmi >= 15)
      return Colors.blueAccent;
    else
      return Colors.blue;
  }

  String getComment() {
    if (_bmi >= 40)
      return "Thôi cạn lời luôn, chào con lợn, ăn ít lại và trở về với thế giới loài người đi";
    else if (_bmi >= 35)
      return "Dừng lại và quay đầu đi, ăn ít lại, và tập thể dục nhiều hơn, vài bước nữa thành lợn rồi đấy";
    else if (_bmi >= 30)
      return 'BMI của bạn cao vl, chắc bạn đéo thể nào ngừng ăn nhỉ, muốn dáng ngon thì ăn ít lại ';
    else if (_bmi >= 25)
      return 'hơi béo rồi đấy tích cực tập thể dục đi, mập thêm xíu nữa là đéo ổn đâu ';
    else if (_bmi >= 18.5)
      return 'BMI của bạn ở mức tốt, bạn có một cuộc sống healthy vcl, tiếp tục phát huy nhé';
    else if (_bmi >= 16)
      return "hơi ốm rồi đó ba ăn nhiều dô nha, để ốm nữa là ghê lắm";
    else if (_bmi >= 15)
      return "Dừng lại và quay xe đi, ăn nhiều dô, để ốm nữa trông chả khác gì con nghiện ";
    else
      return "BMI của bạn thấp vcl ý, chắc bạn trông đ khác gì con nghiện luôn, ăn nhiều lên cho giống người nhé";
  }
}
