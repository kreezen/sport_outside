import 'package:image_picker/image_picker.dart';

class CameraService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage(ImageSource source) {
    return _picker.pickImage(source: source);
  }

  Future<LostDataResponse> getLostData() {
    return _picker.retrieveLostData();
  }
}
