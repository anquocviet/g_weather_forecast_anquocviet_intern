// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherModel {
  String get location => throw _privateConstructorUsedError;
  String get localtime => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;
  String get wind => throw _privateConstructorUsedError;
  String get humidity => throw _privateConstructorUsedError;
  String get weather => throw _privateConstructorUsedError;
  String get weatherIcon => throw _privateConstructorUsedError;

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {String location,
      String localtime,
      String temperature,
      String wind,
      String humidity,
      String weather,
      String weatherIcon});
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? localtime = null,
    Object? temperature = null,
    Object? wind = null,
    Object? humidity = null,
    Object? weather = null,
    Object? weatherIcon = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      localtime: null == localtime
          ? _value.localtime
          : localtime // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String,
      weatherIcon: null == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherModelImplCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$WeatherModelImplCopyWith(
          _$WeatherModelImpl value, $Res Function(_$WeatherModelImpl) then) =
      __$$WeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String location,
      String localtime,
      String temperature,
      String wind,
      String humidity,
      String weather,
      String weatherIcon});
}

/// @nodoc
class __$$WeatherModelImplCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$WeatherModelImpl>
    implements _$$WeatherModelImplCopyWith<$Res> {
  __$$WeatherModelImplCopyWithImpl(
      _$WeatherModelImpl _value, $Res Function(_$WeatherModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? localtime = null,
    Object? temperature = null,
    Object? wind = null,
    Object? humidity = null,
    Object? weather = null,
    Object? weatherIcon = null,
  }) {
    return _then(_$WeatherModelImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      localtime: null == localtime
          ? _value.localtime
          : localtime // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String,
      weatherIcon: null == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherModelImpl implements _WeatherModel {
  const _$WeatherModelImpl(
      {required this.location,
      required this.localtime,
      required this.temperature,
      required this.wind,
      required this.humidity,
      required this.weather,
      required this.weatherIcon});

  @override
  final String location;
  @override
  final String localtime;
  @override
  final String temperature;
  @override
  final String wind;
  @override
  final String humidity;
  @override
  final String weather;
  @override
  final String weatherIcon;

  @override
  String toString() {
    return 'WeatherModel(location: $location, localtime: $localtime, temperature: $temperature, wind: $wind, humidity: $humidity, weather: $weather, weatherIcon: $weatherIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.localtime, localtime) ||
                other.localtime == localtime) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, localtime, temperature,
      wind, humidity, weather, weatherIcon);

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      __$$WeatherModelImplCopyWithImpl<_$WeatherModelImpl>(this, _$identity);
}

abstract class _WeatherModel implements WeatherModel {
  const factory _WeatherModel(
      {required final String location,
      required final String localtime,
      required final String temperature,
      required final String wind,
      required final String humidity,
      required final String weather,
      required final String weatherIcon}) = _$WeatherModelImpl;

  @override
  String get location;
  @override
  String get localtime;
  @override
  String get temperature;
  @override
  String get wind;
  @override
  String get humidity;
  @override
  String get weather;
  @override
  String get weatherIcon;

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
