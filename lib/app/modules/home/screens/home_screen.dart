import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/home/home_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _newTextController = TextEditingController();
  final FocusNode _newTextFocus = FocusNode();
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.loadTexts();
    _newTextFocus.requestFocus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Observer(
        builder: (context) {
          switch (store.operationState) {
            case TextOperationState.loading:
              return _buildLoading();
            case TextOperationState.success:
              return _buildContent();
            case TextOperationState.error:
              return _buildError();
            default:
              return Container(); // Pode adicionar um fallback aqui
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildContent() {

    return Column(
      children: [
        Container(
          height: 150,
          child: ListView.builder(
            itemCount: store.texts.length,
            itemBuilder: (context, index) {
              final text = store.texts[index];
              return  ListTile(
                title: Observer(
                  builder: (_) {
                    return store.editingIndex == index
                        ? TextField(

                      controller: TextEditingController(text: text),
                      onTap: (){

                      },
                      onSubmitted: (newText) {

                        store.updateText(index, newText);
                        // Future.delayed(Duration.zero, () {
                        //   FocusScope.of(context).requestFocus(_newTextFocus);
                        // });
                      },
                    )
                        : Text(text);
                  },
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        store.startEditing(index, text);
                       // FocusScope.of(context).requestFocus(_newTextFocus);
                        _newTextFocus.requestFocus();
                      },
                      child: Container(
                        width: 30,
                        child: Icon(Icons.edit),
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        store.deleteText(text);
                      },
                      child: Container(
                        width: 30,
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              );

            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child:TextField(
    controller: _newTextController,
    focusNode: _newTextFocus, // atribua o FocusNode aqui
    decoration: InputDecoration(
    hintText: 'Novo Texto',
    ),
    ),
    ),

            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                store.addText(_newTextController.text);
                _newTextController.clear();
              },
            ),
          ],
        ),
      ],
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
              store.loadTexts(); // Tente recarregar os dados em caso de erro
            },
            child: Text("Tentar novamente"),
          ),
        ],
      ),
    );
  }
}

