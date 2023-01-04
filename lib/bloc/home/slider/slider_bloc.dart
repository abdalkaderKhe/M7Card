import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/slider_model.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<GetSlider>(_getSlider);
  }
}

void _getSlider(GetSlider event, Emitter<SliderState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(CategoryWaiting());
  try {
    List<SliderModel> data = await apiProvider.getSlider(url: GET_SLIDER);
    emit(GetSliderSuccess(sliderData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetSliderError(errorMessage: ex.toString()));
    }
  }

}