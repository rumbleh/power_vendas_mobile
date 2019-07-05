import 'dart:async';

class NavigationDrawerBloc {
//  final navigationController = StreamController();
  final List<int> _historico = [0];

  final widgetController = StreamController<int>.broadcast();

  get setFragmentoAtivo => widgetController.sink.add;
  get FragmentoAtivo => widgetController.stream;

  void Navegar(int id) {
    print("Navegar: " + _historico.toString());
    if (_historico.last != id) {
      _historico.add(id);
      widgetController.sink.add(_historico.last);
    }
  }

  bool goBack() {
    if (_historico.length < 2){
      return false;
    }
    _historico.removeLast();
    widgetController.sink.add(_historico.last);
    return true;
  }

  void dispose() {
    widgetController.close();
  }
}

final bloc = NavigationDrawerBloc();