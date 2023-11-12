import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:prova_flutter/app/modules/home/home_store.dart';

import '../../../commons/vibrate/vibrate.dart';
import '../../../commons/widgets/custom_container.dart';
import '../../../commons/widgets/custom_politica_privacidade.dart';
import '../widgets/custom_editable_text_field.dart';
import '../widgets/custom_text_field_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _newTextController = TextEditingController();
  final store = Modular.get<HomeStore>();
  final FocusNode _customTextFieldHomeFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    store.loadTexts();
    _customTextFieldHomeFocus.requestFocus();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _newTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: Observer(
          builder: (context) {
            switch (store.operationState) {
              case TextOperationState.loading:

                return _buildLoading();
              case TextOperationState.success:
                return _buildContent();
              case TextOperationState.error:
                return _buildError();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {

    return Center(child: CircularProgressIndicator());

  }

  Widget _buildContent() {
    _customTextFieldHomeFocus.requestFocus();
    final vibrate = Vibrate();
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: store.texts.length,
              itemBuilder: (context, index) {
                final text = store.texts[index];
                final FocusNode itemFocusNode = FocusNode();

                return Column(
                  children: [
                    ListTile(
                      title: Observer(
                        builder: (_) {
                          return store.editingIndex == index
                              ? CustomEditableTextField(
                            focusNode: itemFocusNode,
                            controller: TextEditingController(text: text),
                            onTap: () {
                              // Lida com o toque se necessário
                            },
                            onSubmitted: (newText) {
                              store.updateText(index, newText);
                              _customTextFieldHomeFocus.requestFocus();
                            },
                            initialText: text,
                          )
                              : Text(
                            text,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              store.startEditing(index, text);
                              itemFocusNode.requestFocus();
                            },
                            child: Container(
                              width: 30,
                              child: Icon(Icons.edit, color: Colors.black),
                            ),
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              store.deleteText(text);

                            },
                            child: Container(
                              width: 30,
                              child: Icon(Icons.cancel, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),

          ),
          SizedBox(height: 10),
          CustomTextFieldHome(
            controller: _newTextController,
            focusNode: _customTextFieldHomeFocus,
            onEditingComplete: () async{
              final trimmedText = _newTextController.text.trim();
              if (trimmedText.isNotEmpty) {
                store.addText(trimmedText);
                _newTextController.clear();
                _customTextFieldHomeFocus.requestFocus();
              }else{
                await vibrate.vibrate();

              }
            //  _customTextFieldHomeFocus.requestFocus();
            },
          ),
          Spacer(),
          CustomPoliticaPrivacidade(),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ocorreu um erro."),
          ElevatedButton(
            onPressed: () {
              store.loadTexts();
            },
            child: Text("Tentar novamente"),
          ),
        ],
      ),
    );
  }
}
