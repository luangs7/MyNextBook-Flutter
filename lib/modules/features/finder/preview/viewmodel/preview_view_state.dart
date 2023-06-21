import 'package:mynextbook/common/base/view_state.dart';

class PreviewViewState {
  final ViewState state;

  PreviewViewState({required this.state});

  PreviewViewState copyWith({bool? loading, ViewState? state}) {
    return PreviewViewState(state: state ?? this.state);
  }

  static PreviewViewState init() {
    return PreviewViewState(state: ViewState.loading());
  }
}
