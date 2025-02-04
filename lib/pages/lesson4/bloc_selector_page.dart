import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/bloc/bloc_selector_bloc.dart';

class BlocSelectorPage extends StatefulWidget {
  const BlocSelectorPage({super.key});

  @override
  State<BlocSelectorPage> createState() => _BlocSelectorPageState();
}

class _BlocSelectorPageState extends State<BlocSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocSelectorBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(' Bloc Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
              selector: (state) => state.changeState,
              builder: (context, state) {
                return Icon(
                  Icons.favorite,
                  color: state ? Colors.red : Colors.grey,
                  size: 60,
                );
              },
            ),
            BlocBuilder<BlocSelectorBloc, BlocSelectorState>(
                builder: (context, state) {
              return Text(
                state.value.toString(),
                style: TextStyle(fontSize: 10),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    context.read<BlocSelectorBloc>().add(ChangeStateEvent());
                  },
                  child: const Text('Change State'),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<BlocSelectorBloc>().add(ValueEvent());
                  },
                  child: const Text('Add Number'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
