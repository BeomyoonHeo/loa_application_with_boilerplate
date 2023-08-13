import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ViewModelStatus { initial, loading, loaded, error }

class BaseViewModel extends StateNotifier<ViewModelStatus> {
  BaseViewModel() : super(ViewModelStatus.initial);

  @protected
  @mustCallSuper
  void init() {
    state = ViewModelStatus.initial;
  }

  @protected
  @mustCallSuper
  void loading() {
    state = ViewModelStatus.loading;
  }

  @protected
  @mustCallSuper
  void loaded() {
    state = ViewModelStatus.loaded;
  }

  @protected
  @mustCallSuper
  void error() {
    state = ViewModelStatus.error;
  }
}
