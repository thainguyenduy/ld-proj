import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:isolate';

import 'package:rxdart/rxdart.dart';

import '../../td_error.dart' as client_error;
import '../platform.dart';
import 'json_bindings.dart';
import 'receive_isolate_data.dart';
import 'receive_isolate_endpoint.dart';

class PlatformImpl implements Platform {
  ffi.Pointer? _client;
  Isolate? _receiveIsolate;
  final ReceivePort _ingoingPort = ReceivePort();
  final PublishSubject<Event> _eventsSubject = PublishSubject<Event>();

  @override
  Future<void> initialize() async {
    if (_client != null) {
      throw client_error.TdError('Client already initiated!');
    }

    _client = JsonBindings().createClient();
    _ingoingPort.listen((Object? message) {
      if (message is Event) {
        _eventsSubject.add(message);
      } else if (message == killed) {
        JsonBindings().destroy(_client!);
        _client = null;
      }
    });

    _receiveIsolate = await Isolate.spawn(
      receiveIsolateEntryPoint,
      ReceiveIsolateData(
        isolateToMainPort: _ingoingPort.sendPort,
        clientAddress: _client!.address,
      ),
    );
    _receiveIsolate!.addOnExitListener(_ingoingPort.sendPort, response: killed);
  }

  @override
  Stream<Event> get events => _eventsSubject;

  @override
  Map<String, dynamic> execute({required Map<String, dynamic> function}) {
    assert(_client != null);
    return JsonBindings().execute(
      _client!,
      json.encode(function),
    );
  }

  @override
  void send({required Map<String, dynamic> function}) {
    assert(_client != null);
    JsonBindings().send(_client!, json.encode(function));
  }

  @override
  void destroy() {
    _receiveIsolate?.kill(priority: Isolate.immediate);
    _receiveIsolate = null;
    _eventsSubject.close();
  }

  static int killed = 1;
}
