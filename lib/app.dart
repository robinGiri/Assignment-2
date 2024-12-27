import 'package:assignment_two/cubit/area_of_cirlce_cubit.dart';
import 'package:assignment_two/cubit/area_of_rectangle_cubit.dart';
import 'package:assignment_two/cubit/dashboard_cubit.dart';
import 'package:assignment_two/cubit/simple_interest_cubit.dart';
import 'package:assignment_two/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SimpleInterestCubit()),
          BlocProvider(create: (context) => AreaOfCirlceCubit()),
          BlocProvider(create: (context) => AreaOfRectangleCubit()),
          BlocProvider(
              create: (context) => DashboardCubit(
                    context.read<SimpleInterestCubit>(),
                    context.read<AreaOfCirlceCubit>(),
                    context.read<AreaOfRectangleCubit>(),
                  ))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Bloc Robin',
          home: DashboardView(),
        ));
  }
}
