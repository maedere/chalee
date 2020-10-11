import 'dart:convert';
class EditPassword {
  EditPassword({
    this.result,
  });

  String result;

  factory EditPassword.fromJson(Map<String, dynamic> json) => EditPassword(
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
  };
}