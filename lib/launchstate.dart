abstract class LaunchState {
  const LaunchState();
}

class LaunchInitialState extends LaunchState {
  const LaunchInitialState();
}

class LaunchLoadedState extends LaunchState {
  final String link;

  LaunchLoadedState(this.link);
}

class LaunchErrorState extends LaunchState {
  LaunchErrorState(Type launchUrlException);
}
