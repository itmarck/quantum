import 'package:quantum/core/quantum.dart';
import 'package:quantum/core/trace.dart';

class Output {
  List<Quantum> _quantums = [];

  List<Quantum> get quantums => _quantums;
  List<Trace> get traces => null;

  Output();

  void addQuantum(Quantum quantum) {
    _quantums.add(quantum);
  }

  @override
  String toString() {
    String string = '';
    _quantums.forEach((quantum) {
      string += quantum.toString() + '\n';
    });
    return string;
  }
}
