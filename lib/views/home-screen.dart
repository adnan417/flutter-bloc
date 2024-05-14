import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connect_bloc/bloc/internet_bloc.dart';
import 'package:internet_connect_bloc/bloc/internet_event.dart';
import 'package:internet_connect_bloc/bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text('Connected');
            } else if (state is InternetLostState) {
              return const Text('Disconnected');
            } else {
              return const Text('Loading');
            }
          },
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Internet Come')));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Internet Gone')));
            }
          },
        ),
      ),
    );
  }
}
