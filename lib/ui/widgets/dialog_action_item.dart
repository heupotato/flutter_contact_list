import 'package:flutter/material.dart';

class DialogActionItem{
  final String buttonTitle;
  final Function action;
  DialogActionItem({required this.buttonTitle, required this.action});
}

class ActionDialog extends StatelessWidget {
  final String dialogTitle;
  final String ? description;
  final List<DialogActionItem> actions;
  const ActionDialog._(this.dialogTitle, this.description, this.actions);

  static void show({required BuildContext context, required String dialogTitle,
    String ? description, required List<DialogActionItem> actions}){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ActionDialog._(dialogTitle, description, actions)
    );
  }

  static void confirm({required BuildContext context, required String title,
    String ? description, required Function onConfirm}){
    final DialogActionItem confirmAction =
    DialogActionItem(buttonTitle: title, action: onConfirm);
    final DialogActionItem cancel =
    DialogActionItem(buttonTitle: "Cancel", action:() {});
    show(
        context: context,
        dialogTitle: title,
        description: description,
        actions: [confirmAction, cancel]);
  }

  //unnecessary yet
  static void info({required BuildContext context, required String title,
    String ? description, required Function onConfirm}){
    final DialogActionItem confirmAction =
    DialogActionItem(buttonTitle: title, action: onConfirm);
    show(
        context: context,
        dialogTitle: title,
        actions: [confirmAction]);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = actions.map((e) => TextButton(
        onPressed: (){
          e.action();
          Navigator.pop(context);
        },
        child: Text(e.buttonTitle))
    ).toList();

    return WillPopScope(
        child: AlertDialog(
          title: Text(dialogTitle),
          content: Text(description!),
          actions: buttons,
        ),
        onWillPop: () => Future.value(false)
    );
  }
}