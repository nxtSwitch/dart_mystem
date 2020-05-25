import 'dart:io';
import 'dart:async';
import 'dart:convert';

part 'dart_mystem_result.dart';

class MyStem
{
  Completer _lock;
  Process _process;
  Stream<String> _broadcast;

  final _initCompleter = Completer();
  final _arguments = <String>['-c', '--format', 'json', '-e', 'utf-8'];

  MyStem({String workingDirectory})
  {
    _arguments.addAll(['-l', '-s']);

    Process.start('mystem', _arguments, workingDirectory: workingDirectory)
      .then((process) {
        _process = process;
        _broadcast = process.stdout.transform(utf8.decoder).asBroadcastStream();
        _initCompleter.complete();
      }, 
      onError: (_) => _initCompleter.completeError('TODO'));
  }

  Future<dynamic> analyze(String text) async
  {
    await _initCompleter.future;

    final lock = _lock;
    _lock = Completer.sync();

    if (lock != null) await lock.future;

    try {
      _process.stdin.writeln(text);
      return json.decode(await _broadcast.first);
    }
    finally {
      _lock.complete();
    }
  }

  void close()
  {
    _process.kill();
  }
}
