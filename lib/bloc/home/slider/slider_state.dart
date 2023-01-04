part of 'slider_bloc.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}


class GetSliderError extends SliderState {
  final String errorMessage;
  GetSliderError({
    required this.errorMessage,
  });
}

class CategoryWaiting extends SliderState {}

class GetSliderSuccess extends SliderState {
  final List<SliderModel> sliderData;
  GetSliderSuccess({required this.sliderData});
}
