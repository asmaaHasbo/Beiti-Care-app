// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/view/asmaa_api/api_consumer.dart';
import 'package:beiti_care/view/asmaa_api/api_endpoints.dart';
import 'package:beiti_care/view/asmaa_profile_model/profile_model.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
part 'asmaa_profile_state.dart';

class AsmaaProfileCubit extends Cubit<AsmaaProfileState> {
  AsmaaProfileCubit(this.api) : super(AsmaaProfileInitial());

  ApiConsumer api;

  final String? id = getIt<PreferencesRepository>().getString('idUser');

  getUserProfileData() async {
    try {
      print(id);
      emit(GetUserDataLoadingState());
      final response = await api.get(
        AsmaaApiEndpoints.getProfileDataEndPoint(id),
      );
      print(response);
      getIt<PreferencesRepository>()
          .setString('userName', UserProfileModel.fromJson(response).userName!);
      
    
      print('asmaa Response is : $response');
      print('success');
      emit(GetUserDataSuccessState(
          userProfileModel: UserProfileModel.fromJson(response)));
    } on ServerException catch (e) {
      print(e.errorModel.errorMessage);
      emit(GetUserDataFailureState(errorMsg: e.errorModel.errorMessage));
    }
  }

  //-------------------- update profile data --------------

  updateUserProfileData(
      {String? userName, String? email, int? phone, XFile? imageFile}) async {
    try {
   MultipartFile? compressedImage;
      if (imageFile != null) {
        String extension = path.extension(imageFile.path).toLowerCase();
        print('Original file extension: $extension');

        // الحصول على المجلد المؤقت
        final tempDir = await getTemporaryDirectory();
        final compressedFileName =
            '${path.basenameWithoutExtension(imageFile.path)}_compressed.jpg';
        final compressedPath = '${tempDir.path}/$compressedFileName';

        final compressedFile = await FlutterImageCompress.compressAndGetFile(
          imageFile.path,
          compressedPath,
          quality: 70,
          format: CompressFormat.jpeg,
        );

        if (compressedFile != null) {
          print('Compressed file path: ${compressedFile.path}');
          print('Compressed file size: ${await compressedFile.length()} bytes');
          compressedImage = await MultipartFile.fromFile(
            compressedFile.path,
            filename: path.basename(compressedFile.path),
            contentType: DioMediaType('image', 'jpeg'),
          );


        } else {
          emit(UpdateUserProfileFailureState(
              errorMsg: 'Failed to compress image'));
          return;
        }
        
      }

      final data = {
        if (userName != null && userName.isNotEmpty) 'userName': userName,
        if (email != null && email.isNotEmpty) 'email': email,
        if (phone != null) 'phone': phone,
        if (compressedImage != null) 'image': compressedImage,
      };

      final response = await api.patch(
        AsmaaApiEndpoints.updateProfileDataEndPoint(id),
        data: data,
        isFormData: true,
      );

    print('Response received: ${response.data}');

   if (response.data['message'] == 'User updated successfully' &&
        response.data.containsKey('updatedUser')) {
      print('Emitting UpdateUserProfileSuccessState with userProfileModel: ${response.data['updatedUser']}');
      final newImageUrl = response.data['updatedUser']['image'];
      if (newImageUrl != null) {
        // تفريغ التخزين المؤقت للصورة القديمة
        await CachedNetworkImage.evictFromCache(newImageUrl);
        await getIt<PreferencesRepository>()
            .setString('asmaaProfileImage', newImageUrl);
      }
      emit(UpdateUserProfileSuccessState(
          userProfileModel: UserProfileModel.fromJson(response.data)));
      await getUserProfileData();
      } else {
        print('Invalid response format: ${response.data}');
        emit(UpdateUserProfileFailureState(
            errorMsg: 'Invalid response format: ${response.data}'));
      }
    } on ServerException catch (e) {
      print(e.errorModel.errorMessage);
      emit(UpdateUserProfileFailureState(errorMsg: e.errorModel.errorMessage));
    } catch (e) {
      print('Asmaa Unexpected error: $e');
      emit(UpdateUserProfileFailureState(
          errorMsg: 'Asmaa Unexpected error: $e'));
    }
  }
}
