// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraPageModel {
  XFile? get picture => throw _privateConstructorUsedError;
  Uint8List? get convertedPic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraPageModelCopyWith<CameraPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraPageModelCopyWith<$Res> {
  factory $CameraPageModelCopyWith(
          CameraPageModel value, $Res Function(CameraPageModel) then) =
      _$CameraPageModelCopyWithImpl<$Res, CameraPageModel>;
  @useResult
  $Res call({XFile? picture, Uint8List? convertedPic});
}

/// @nodoc
class _$CameraPageModelCopyWithImpl<$Res, $Val extends CameraPageModel>
    implements $CameraPageModelCopyWith<$Res> {
  _$CameraPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = freezed,
    Object? convertedPic = freezed,
  }) {
    return _then(_value.copyWith(
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as XFile?,
      convertedPic: freezed == convertedPic
          ? _value.convertedPic
          : convertedPic // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraPageModelImplCopyWith<$Res>
    implements $CameraPageModelCopyWith<$Res> {
  factory _$$CameraPageModelImplCopyWith(_$CameraPageModelImpl value,
          $Res Function(_$CameraPageModelImpl) then) =
      __$$CameraPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({XFile? picture, Uint8List? convertedPic});
}

/// @nodoc
class __$$CameraPageModelImplCopyWithImpl<$Res>
    extends _$CameraPageModelCopyWithImpl<$Res, _$CameraPageModelImpl>
    implements _$$CameraPageModelImplCopyWith<$Res> {
  __$$CameraPageModelImplCopyWithImpl(
      _$CameraPageModelImpl _value, $Res Function(_$CameraPageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = freezed,
    Object? convertedPic = freezed,
  }) {
    return _then(_$CameraPageModelImpl(
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as XFile?,
      convertedPic: freezed == convertedPic
          ? _value.convertedPic
          : convertedPic // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$CameraPageModelImpl implements _CameraPageModel {
  _$CameraPageModelImpl({required this.picture, required this.convertedPic});

  @override
  final XFile? picture;
  @override
  final Uint8List? convertedPic;

  @override
  String toString() {
    return 'CameraPageModel(picture: $picture, convertedPic: $convertedPic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraPageModelImpl &&
            (identical(other.picture, picture) || other.picture == picture) &&
            const DeepCollectionEquality()
                .equals(other.convertedPic, convertedPic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, picture, const DeepCollectionEquality().hash(convertedPic));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraPageModelImplCopyWith<_$CameraPageModelImpl> get copyWith =>
      __$$CameraPageModelImplCopyWithImpl<_$CameraPageModelImpl>(
          this, _$identity);
}

abstract class _CameraPageModel implements CameraPageModel {
  factory _CameraPageModel(
      {required final XFile? picture,
      required final Uint8List? convertedPic}) = _$CameraPageModelImpl;

  @override
  XFile? get picture;
  @override
  Uint8List? get convertedPic;
  @override
  @JsonKey(ignore: true)
  _$$CameraPageModelImplCopyWith<_$CameraPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
