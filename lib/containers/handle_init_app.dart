import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_maker/models/models.dart';
import 'package:redux/redux.dart';

class HandleInitApp extends StatelessWidget {
  const HandleInitApp({Key key, @required this.builder}) : super(key: key);

  final Function(BuildContext context, _ViewModel vm) builder;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: builder,
    );
  }
}

class _ViewModel {
  _ViewModel({
    @required this.isLoading,
  });

  final bool isLoading;

  static _ViewModel fromStore(Store<AppState> store) {



    return _ViewModel(isLoading: store.state.isLoading);
  }
}
