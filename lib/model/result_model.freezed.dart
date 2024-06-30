// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultModel {
  List<Mat> get lines => throw _privateConstructorUsedError;
  Map<Mat, String> get identifiedImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultModelCopyWith<ResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res, ResultModel>;
  @useResult
  $Res call({List<Mat> lines, Map<Mat, String> identifiedImages});
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res, $Val extends ResultModel>
    implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
    Object? identifiedImages = null,
  }) {
    return _then(_value.copyWith(
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Mat>,
      identifiedImages: null == identifiedImages
          ? _value.identifiedImages
          : identifiedImages // ignore: cast_nullable_to_non_nullable
              as Map<Mat, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResutModelImplCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$$ResutModelImplCopyWith(
          _$ResutModelImpl value, $Res Function(_$ResutModelImpl) then) =
      __$$ResutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Mat> lines, Map<Mat, String> identifiedImages});
}

/// @nodoc
class __$$ResutModelImplCopyWithImpl<$Res>
    extends _$ResultModelCopyWithImpl<$Res, _$ResutModelImpl>
    implements _$$ResutModelImplCopyWith<$Res> {
  __$$ResutModelImplCopyWithImpl(
      _$ResutModelImpl _value, $Res Function(_$ResutModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
    Object? identifiedImages = null,
  }) {
    return _then(_$ResutModelImpl(
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Mat>,
      identifiedImages: null == identifiedImages
          ? _value._identifiedImages
          : identifiedImages // ignore: cast_nullable_to_non_nullable
              as Map<Mat, String>,
    ));
  }
}

/// @nodoc

class _$ResutModelImpl implements _ResutModel {
  _$ResutModelImpl(
      {required final List<Mat> lines,
      required final Map<Mat, String> identifiedImages})
      : _lines = lines,
        _identifiedImages = identifiedImages;

  final List<Mat> _lines;
  @override
  List<Mat> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  final Map<Mat, String> _identifiedImages;
  @override
  Map<Mat, String> get identifiedImages {
    if (_identifiedImages is EqualUnmodifiableMapView) return _identifiedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_identifiedImages);
  }

  @override
  String toString() {
    return 'ResultModel(lines: $lines, identifiedImages: $identifiedImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResutModelImpl &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            const DeepCollectionEquality()
                .equals(other._identifiedImages, _identifiedImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lines),
      const DeepCollectionEquality().hash(_identifiedImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResutModelImplCopyWith<_$ResutModelImpl> get copyWith =>
      __$$ResutModelImplCopyWithImpl<_$ResutModelImpl>(this, _$identity);
}

abstract class _ResutModel implements ResultModel {
  factory _ResutModel(
      {required final List<Mat> lines,
      required final Map<Mat, String> identifiedImages}) = _$ResutModelImpl;

  @override
  List<Mat> get lines;
  @override
  Map<Mat, String> get identifiedImages;
  @override
  @JsonKey(ignore: true)
  _$$ResutModelImplCopyWith<_$ResutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
