// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:reusability/common/domain/either_failure_or.dart';

import '../entitites/failure.dart';

class FilePickerRepository implements IFilePickerRepository {
  final FilePicker _filePicker;

  const FilePickerRepository(this._filePicker);

  @override
  EitherFailureOr<FilePickerResult?> pickFiles({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    bool allowCompression = true,
    bool allowMultiple = false,
  }) async {
    try {
      FilePickerResult? result = await _filePicker.pickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        allowCompression: allowCompression,
        allowMultiple: allowMultiple,
      );
      return Right(result);
    } catch (error, stackTrace) {
      String title = 'File picker error';
      if (error is PlatformException && error.message != null) {
        title = error.message ?? '';
      }
      return Left(Failure.generic(title: title, error: error, stackTrace: stackTrace));
    }
  }

  @override
  EitherFailureOr<bool?> clearTemporaryFiles() async => Right(await _filePicker.clearTemporaryFiles());
}

abstract class IFilePickerRepository {
  EitherFailureOr<FilePickerResult?> pickFiles({
    FileType type = FileType.any,
    List<String> allowedExtensions,
    bool allowCompression = true,
    bool allowMultiple = false,
  });

  EitherFailureOr<bool?> clearTemporaryFiles();
}
