import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/fruit_model.dart';
import '../../../../domain/controllers/fruit_controller.dart';
import '../../../../domain/controllers/user_controller.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text_field.dart';

class CustomFruitForm extends StatelessWidget {
  CustomFruitForm({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _genusController = TextEditingController();
  final _familyController = TextEditingController();
  final _nameController = TextEditingController();
  final _carbohydratesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _fatController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _sugarController = TextEditingController();
  final Rx<Fruit?> _fruitRx = Rx<Fruit?>(null);
  final _controller = FruitController();

  onInit() {
    if (_fruitRx.value != null) {
      _genusController.text = _fruitRx.value!.genus;
      _familyController.text = _fruitRx.value!.family;
      _nameController.text = _fruitRx.value!.name;
      _carbohydratesController.text =
          _fruitRx.value!.nutritions['carbohydrates'].toString();
      _proteinController.text =
          _fruitRx.value!.nutritions['protein'].toString();
      _fatController.text = _fruitRx.value!.nutritions['fat'].toString();
      _caloriesController.text =
          _fruitRx.value!.nutritions['calories'].toString();
      _sugarController.text = _fruitRx.value!.nutritions['sugar'].toString();
    }
  }

  updateModel() {
    _fruitRx.value = Fruit(
      genus: _genusController.text,
      family: _familyController.text,
      name: _nameController.text,
      nutritions: {
        'carbohydrates': double.parse(_carbohydratesController.text),
        'protein': double.parse(_proteinController.text),
        'fat': double.parse(_fatController.text),
        'calories': double.parse(_caloriesController.text),
        'sugar': double.parse(_sugarController.text),
      },
    );
  }

  handlerButtom() async {
    if (_fruitRx.value == null) {
      await _controller.addFruit(
        genus: _genusController.text,
        family: _familyController.text,
        name: _nameController.text,
        nutritions: {
          'carbohydrates': double.parse(_carbohydratesController.text),
          'protein': double.parse(_proteinController.text),
          'fat': double.parse(_fatController.text),
          'calories': double.parse(_caloriesController.text),
          'sugar': double.parse(_sugarController.text),
        },
        createdBy: Get.find<UserController>().user?.userName,
      );
      Get.back();
      showCustomSnackbar(
        title: 'Fruit added',
        message: 'Fruit added successfully',
        type: CustomSnackbarType.success,
      );
    } else {
      await _controller.updateFruit(
        genus: _genusController.text,
        family: _familyController.text,
        name: _nameController.text,
        nutritions: {
          'carbohydrates': double.parse(_carbohydratesController.text),
          'protein': double.parse(_proteinController.text),
          'fat': double.parse(_fatController.text),
          'calories': double.parse(_caloriesController.text),
          'sugar': double.parse(_sugarController.text),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    onInit();
    return Form(
      key: _formKey,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text("Basic Information"),
        WidgetTextField(
          label: "Name",
          controller: _nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
        WidgetTextField(
            label: "Genus",
            controller: _genusController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a genus';
              }
              return null;
            }),
        WidgetTextField(
            label: "Family",
            controller: _familyController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a family';
              }
              return null;
            }),
        const Divider(),
        const Text("Nutritions:"),
        WidgetTextField(
            label: "Carbohydrates",
            controller: _carbohydratesController,
            digitsOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            }),
        WidgetTextField(
            label: "Protein",
            controller: _proteinController,
            digitsOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            }),
        WidgetTextField(
            label: "Fat",
            controller: _fatController,
            digitsOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            }),
        WidgetTextField(
            label: "Calories",
            controller: _caloriesController,
            digitsOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            }),
        WidgetTextField(
            label: "Sugar",
            controller: _sugarController,
            digitsOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            }),
        WidgetButton(
            text: "",
            onPressed: () async {
              final form = _formKey.currentState;
              form!.save();
              if (form.validate()) {
                try {
                  await handlerButtom();
                } catch (e) {
                  showCustomSnackbar(
                      title: "Error",
                      message: e.toString(),
                      type: CustomSnackbarType.error);
                }
              }
            },
            typeMain: true),
      ]),
    );
  }
}
