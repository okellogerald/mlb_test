import '../source.dart';

class AppFutureBuilder<T> extends StatelessWidget {
  const AppFutureBuilder(
      {required this.future, required this.onLoadedWidget, Key? key})
      : super(key: key);

  final Future<T> future;
  final Widget Function(T data)  onLoadedWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onLoadedWidget(snapshot.data!);
        }
        if (snapshot.hasError) {
          return Center(
              child: const Text('An error happened while loading data'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
