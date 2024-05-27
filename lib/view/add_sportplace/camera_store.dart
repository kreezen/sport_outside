import 'package:image_picker/image_picker.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/data/datasource/camera/camera_service.dart';

class CameraStore {
  final CameraService _cameraService = CameraService();
  final imageFiles = AsyncSignal<List<XFile>>(AsyncData([]));
  final imageError = Signal<Exception?>(null);

  CamereStore() {
    _handleLostData();
  }

  void cameraImage() async {
    final imageFile = await _cameraService.pickImage(ImageSource.camera);
    if (imageFile != null) {
      var oldList = imageFiles.value.value ?? [];
      imageFiles.value = AsyncData([...oldList, imageFile]);
    }
  }

  void galleryImage() async {
    final imageFile = await _cameraService.pickImage(ImageSource.gallery);
    if (imageFile != null) {
      var oldList = imageFiles.value.value ?? [];
      imageFiles.value = AsyncData([...oldList, imageFile]);
    }
  }

  void deleteImg(int index) async {
    var rList = imageFiles.value.value ?? [];
    rList.removeAt(index);
    imageFiles.value = AsyncData([...rList]);
  }

  void _handleLostData() async {
    final LostDataResponse response = await _cameraService.getLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      imageFiles.value = AsyncData([...imageFiles.value.value ?? [], ...files]);
    } else {
      imageError.value = response.exception;
    }
  }
}
