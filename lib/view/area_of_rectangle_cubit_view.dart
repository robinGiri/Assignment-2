import 'package:assignment_two/cubit/area_of_rectangle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfRectangleCubitView extends StatelessWidget {
  const AreaOfRectangleCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController lengthController = TextEditingController();
    final TextEditingController widthController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rectangle Area Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AreaOfRectangleCubit, RectangleAreaState>(
        listener: (context, state) {
          if (state is RectangleAreaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: lengthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Length',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: widthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Width',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    double length = double.tryParse(lengthController.text) ?? 0;
                    double width = double.tryParse(widthController.text) ?? 0;

                    context
                        .read<AreaOfRectangleCubit>()
                        .calculateRectangleArea(length, width);
                  },
                  child: const Text(
                    'Calculate Rectangle Area',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 80),
                if (state is RectangleAreaCalculating)
                  const Center(child: CircularProgressIndicator()),
                if (state is RectangleAreaCalculated)
                  Center(
                    child: Text(
                      'Area: ${state.area}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                if (state is RectangleAreaInitial)
                  Center(
                    child: const Text(
                      'Area: 0',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
