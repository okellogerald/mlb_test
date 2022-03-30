import 'package:mlb_test1/widgets/app_material_button.dart';
import '../source.dart';

class AppFutureBuilder<T> extends StatefulWidget {
  const AppFutureBuilder(
      {required this.future, required this.onLoadedWidget, Key? key})
      : super(key: key);

  final Future<T> future;
  final Widget Function(T data) onLoadedWidget;

  @override
  State<AppFutureBuilder<T>> createState() => _AppFutureBuilderState<T>();
}

class _AppFutureBuilderState<T> extends State<AppFutureBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.onLoadedWidget(snapshot.data!);
        }
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('An error happened while loading data'),
              SizedBox(height: 20.dh),
              AppMaterialButton(
                  child: const Text('Try Again',
                      style: TextStyle(color: AppColors.onPrimary)),
                  isFilled: true,
                  padding: EdgeInsets.symmetric(vertical: 10.dh),
                  margin: EdgeInsets.symmetric(horizontal: 30.dw),
                  onPressed: _redraw)
            ],
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _redraw() => setState(() {});
}
