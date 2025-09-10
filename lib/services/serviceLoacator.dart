import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:zero/services/audioPlayerProvider.dart';

setupServiceLocator() async {
  GetIt.instance.registerSingleton<AudioHandler>(await initAudioService());
}