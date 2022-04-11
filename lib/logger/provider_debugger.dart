import 'package:filterable_logger/filterable_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef FL = FilterableLogger;

class ProviderDebugger implements ProviderObserver {
  ProviderDebugger({Object? tag}) {
    if (tag == null) {
      _tags = null;
    } else {
      _tags = <Object>[tag];
    }
  }

  late List<Object>? _tags;

  @override
  void didAddProvider(ProviderBase<dynamic> provider, Object? value,
      ProviderContainer container) {
    FL.info('<${provider.runtimeType}[${identityHashCode(provider)}]> add',
        tags: _tags);
  }

  @override
  void didDisposeProvider(
      ProviderBase<dynamic> provider, ProviderContainer container) {
    FL.info('<${provider.runtimeType}[${identityHashCode(provider)}]> disposed',
        tags: _tags);
  }

  @override
  void didUpdateProvider(ProviderBase<dynamic> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    FL.info('<${provider.runtimeType}[${identityHashCode(provider)}]> updated',
        tags: _tags);
  }

  @override
  void providerDidFail(ProviderBase<dynamic> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    FL.info('<${provider.runtimeType}[${identityHashCode(provider)}]> failed',
        tags: _tags);
  }
}
