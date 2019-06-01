import 'package:foodie_maker/redux/action/app_actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, InitAppAction>(_init),
]);

bool _init(bool isLoaing, InitAppAction action) {
  return true;
}
