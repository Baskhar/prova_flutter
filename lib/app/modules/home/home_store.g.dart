// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$textsAtom = Atom(name: '_HomeStoreBase.texts', context: context);

  @override
  ObservableList<String> get texts {
    _$textsAtom.reportRead();
    return super.texts;
  }

  @override
  set texts(ObservableList<String> value) {
    _$textsAtom.reportWrite(value, super.texts, () {
      super.texts = value;
    });
  }

  late final _$operationStateAtom =
      Atom(name: '_HomeStoreBase.operationState', context: context);

  @override
  TextOperationState get operationState {
    _$operationStateAtom.reportRead();
    return super.operationState;
  }

  @override
  set operationState(TextOperationState value) {
    _$operationStateAtom.reportWrite(value, super.operationState, () {
      super.operationState = value;
    });
  }

  late final _$editingIndexAtom =
      Atom(name: '_HomeStoreBase.editingIndex', context: context);

  @override
  int get editingIndex {
    _$editingIndexAtom.reportRead();
    return super.editingIndex;
  }

  @override
  set editingIndex(int value) {
    _$editingIndexAtom.reportWrite(value, super.editingIndex, () {
      super.editingIndex = value;
    });
  }

  late final _$editingTextAtom =
      Atom(name: '_HomeStoreBase.editingText', context: context);

  @override
  String get editingText {
    _$editingTextAtom.reportRead();
    return super.editingText;
  }

  @override
  set editingText(String value) {
    _$editingTextAtom.reportWrite(value, super.editingText, () {
      super.editingText = value;
    });
  }

  late final _$loadTextsAsyncAction =
      AsyncAction('_HomeStoreBase.loadTexts', context: context);

  @override
  Future<void> loadTexts() {
    return _$loadTextsAsyncAction.run(() => super.loadTexts());
  }

  late final _$addTextAsyncAction =
      AsyncAction('_HomeStoreBase.addText', context: context);

  @override
  Future<void> addText(String newText) {
    return _$addTextAsyncAction.run(() => super.addText(newText));
  }

  late final _$updateTextAsyncAction =
      AsyncAction('_HomeStoreBase.updateText', context: context);

  @override
  Future<void> updateText(int index, String newText) {
    return _$updateTextAsyncAction.run(() => super.updateText(index, newText));
  }

  late final _$deleteTextAsyncAction =
      AsyncAction('_HomeStoreBase.deleteText', context: context);

  @override
  Future<void> deleteText(String textToDelete) {
    return _$deleteTextAsyncAction.run(() => super.deleteText(textToDelete));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void startEditing(int index, String text) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.startEditing');
    try {
      return super.startEditing(index, text);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEditingTextChanged(String newText) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.onEditingTextChanged');
    try {
      return super.onEditingTextChanged(newText);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
texts: ${texts},
operationState: ${operationState},
editingIndex: ${editingIndex},
editingText: ${editingText}
    ''';
  }
}
