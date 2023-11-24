import 'package:amplitude_flutter/amplitude.dart';
import 'package:injectable/injectable.dart';
import 'package:rep_chain_mobile/features/monitoring/services/fast_analytics_service.dart';

@Singleton(as: FastAnalyticsService)
class AmplitudeAnalyticsService extends FastAnalyticsService {
  final Amplitude amplitude = Amplitude.getInstance();

  @override
  void logEvent(String eventName, {Map<String, dynamic>? eventProperties}) {
    amplitude.logEvent(eventName, eventProperties: eventProperties);
  }

  @override
  Future<void> initialize() async {
    String? apiKey = const String.fromEnvironment('AMPLITUDE_API_KEY');

    if (apiKey != '') {
      await amplitude.init(const String.fromEnvironment('AMPLITUDE_API_KEY'));
    }
  }
}
