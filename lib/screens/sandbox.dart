import 'package:flutter/material.dart';

class Drink {
  String? name;
  bool? selected;

  Drink(this.name, this.selected);
}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  List<Drink> drinks = [
    Drink('Water', false),
    Drink('Juice', false),
    Drink('Pepsi', false),
    Drink('Ras', false),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Container(
        color: Colors.red,
        child: Column(children: [
          ...drinks
              .map((drink) => DrinkWidget(drinkName: drink.name!))
              .toList(),
          Text('The Order is'),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(drinks
                  .where((element) => element.selected!)
                  .toList()[index]
                  .name!),
            ),
            itemCount: drinks.where((element) => element.selected!).length,
          ))
        ]),
      ),
    ));
  }
}

class DrinkWidget extends StatelessWidget {
  final Drink drink;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.drinkName!),
        Checkbox(
            value: checkState,
            onChanged: ((value) => setState(() {
                  checkState = value!;
                })))
      ],
    );
  }
}
