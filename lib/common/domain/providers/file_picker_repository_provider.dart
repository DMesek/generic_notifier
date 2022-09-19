// ignore_for_file: always_use_package_imports

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/file_picker_repository.dart';

final filePickerRepositoryProvider = Provider<IFilePickerRepository>(
  (ref) => FilePickerRepository(FilePicker.platform),
);
