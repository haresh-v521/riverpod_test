import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtaskdemo/launchstate.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchStreamProvider extends StateNotifier<LaunchState> {
  LaunchStreamProvider() : super(LaunchInitialState());

  Stream<AsyncValue<void>> LunchStream() async* {
    String url = "";
    state = const LaunchInitialState();
    sampleStream.listen((event) {
      if (event.value == null) {}
      launc(Uri.parse(event.value.toString()));
      state = LaunchLoadedState(event.value.toString());
    });
  }

  launc(Uri url) async {
    canLaunchUrl(url).then((bool result) {
      print("OK");
      //launchUrl(url);
    }).onError((error, stackTrace) {
      print(stackTrace.toString());
    });
  }
}

late final Stream<AsyncValue<String>> sampleStream =
    Stream.value(null).map((_) {
  return const AsyncValue.data('https://google.com');
});

final provider =
    StateNotifierProvider<LaunchStreamProvider, LaunchState>((ref) {
  return LaunchStreamProvider();
});
