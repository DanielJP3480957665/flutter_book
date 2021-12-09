import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  //メンバ変数
  String? title;
  String? author;
  bool isLoading = false;

  //startloading method

  //endloading method

  //book_add バリデーションんチェック
  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  //本の追加
  Future addBook() async {
    //バリデーションチェック
    if (title == null) {
      throw 'タイトルが入力されていません';
    }
    if (author == null) {
      throw '著者が入力されていません';
    }

    //本追加処理
    final doc = FirebaseFirestore.instance.collection('Books').doc();

    await doc.set({
      'title': title,
      'author': author,
    });
  } //addBook

} //AddBookModel
