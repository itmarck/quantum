import 'package:quantum/core/data.dart';
import 'package:quantum/core/process.dart';

class Trace {
  Process _process;
  List<int> _instructions;
  Status _status;
  int _break;

  final int quantum = 4;

  String get process => '$_process';
  String get advance => '${_instructions.first}-${_instructions.last}';
  String get status => StatusName[_status];
  String get idBreak => _break != null ? '($_break)' : '';
  bool get isEmpty => _instructions == null;

  Trace();
  Trace.withBreak(this._process, this._status, this._break) {
    initialize();
  }

  Trace.withoutBreak(this._process, this._status) {
    initialize();
  }

  Trace.initial(this._process, this._status) {
    _instructions = List();
    for (var i = 0; i < _process.cpu * quantum; i++) _instructions.add(i);
  }

  void initialize() {
    _instructions = List();
    int n = _process.stage * quantum;
    for (int i = n - quantum; i < n; i++) _instructions.add(i);
  }

  @override
  String toString() {
    return isEmpty
        ? ' Tiempo muerto'
        : ' $_process $advance ${StatusName[_status]}$idBreak';
  }
}
