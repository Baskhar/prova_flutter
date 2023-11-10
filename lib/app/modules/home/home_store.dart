import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/data/repository/text_repository.dart';

part 'home_store.g.dart';

enum TextOperationState { loading, success, error }

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final TextRepository _repository;

  _HomeStoreBase(this._repository);

  @observable
  ObservableList<String> texts = ObservableList<String>();

  @observable
  TextOperationState operationState = TextOperationState.success;

  // Adicionando os novos estados para edição
  @observable
  int editingIndex = -1;

  @observable
  String editingText = '';

  @action
  Future<void> loadTexts() async {
    try {
      operationState = TextOperationState.loading;
      texts = ObservableList<String>.of(await _repository.getAllTexts());
      operationState = TextOperationState.success;
    } catch (e) {
      print("Error loading texts: $e");
      operationState = TextOperationState.error;
    }
  }

  @action
  Future<void> addText(String newText) async {
    try {
      operationState = TextOperationState.loading;
      await _repository.addText(newText);
      texts = ObservableList<String>.of(await _repository.getAllTexts());
      operationState = TextOperationState.success;
    } catch (e) {
      print("Error adding text: $e");
      operationState = TextOperationState.error;
    }
  }

  @action
  Future<void> updateText(int index, String newText) async {
    try {
      operationState = TextOperationState.loading;
      texts[index] = newText;
      await _repository.updateText(texts.toList());
      operationState = TextOperationState.success;
      // Resetando os estados de edição após a conclusão
      editingIndex = -1;
      editingText = '';
    } catch (e) {
      print("Error updating text: $e");
      operationState = TextOperationState.error;
    }
  }

  @action
  Future<void> deleteText(String textToDelete) async {
    try {
      operationState = TextOperationState.loading;
      texts.remove(textToDelete);
      await _repository.deleteText(textToDelete);
      operationState = TextOperationState.success;
    } catch (e) {
      print("Error deleting text: $e");
      operationState = TextOperationState.error;
    }
  }

  // Métodos para manipulação do estado de edição
  @action
  void startEditing(int index, String text) {
    editingIndex = index;
    editingText = text;
  }

  @action
  void onEditingTextChanged(String newText) {
    editingText = newText;
  }
}
