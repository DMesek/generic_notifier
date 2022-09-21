import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/either_failure_or.dart';
import 'package:reusability/common/domain/entities/failure.dart';

final filePickerRepositoryProvider = Provider<FilePickerRepository>(
  (ref) => FilePickerRepositoryImpl(FilePicker.platform),
);

abstract class FilePickerRepository {
  EitherFailureOr<FilePickerResult?> pickFiles({
    FileType type = FileType.any,
    List<String> allowedExtensions,
    bool allowCompression = true,
    bool allowMultiple = false,
  });
  EitherFailureOr<bool?> clearTemporaryFiles();
}

class FilePickerRepositoryImpl implements FilePickerRepository {
  final FilePicker _filePicker;

  const FilePickerRepositoryImpl(this._filePicker);

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
      if (error is PlatformException && error.code == 'read_external_storage_denied') {
        return Left(Failure.permissionDenied(error: error, stackTrace: stackTrace));
      }
      return Left(Failure.generic(title: 'File picker error', error: error, stackTrace: stackTrace));
    }
  }

  @override
  EitherFailureOr<bool?> clearTemporaryFiles() async => Right(await _filePicker.clearTemporaryFiles());
}
