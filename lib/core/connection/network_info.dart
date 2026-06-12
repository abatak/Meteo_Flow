import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_info.g.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl
    extends NetworkInfo {
  final InternetConnectionChecker
  connectionChecker;

  NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected =>
      connectionChecker.hasConnection;
}

//* Riverpod provider
@riverpod
InternetConnectionChecker
internetConnectionChecker(Ref ref) {
  return InternetConnectionChecker
      .instance;
}

@riverpod
NetworkInfo networkInfo(Ref ref) {
  final connectionChecker = ref.watch(
    internetConnectionCheckerProvider,
  );
  return NetworkInfoImpl(
    connectionChecker:
        connectionChecker,
  );
}
