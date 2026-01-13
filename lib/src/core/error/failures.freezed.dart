// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failures {

 String get message;
/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailuresCopyWith<Failures> get copyWith => _$FailuresCopyWithImpl<Failures>(this as Failures, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failures&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failures(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailuresCopyWith<$Res>  {
  factory $FailuresCopyWith(Failures value, $Res Function(Failures) _then) = _$FailuresCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailuresCopyWithImpl<$Res>
    implements $FailuresCopyWith<$Res> {
  _$FailuresCopyWithImpl(this._self, this._then);

  final Failures _self;
  final $Res Function(Failures) _then;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Failures].
extension FailuresPatterns on Failures {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CacheFailure value)?  cache,TResult Function( ResourceNotFoundFailure value)?  resourceNotFound,TResult Function( SavingNoteFailure value)?  savingNote,TResult Function( NoteDeletionFailure value)?  noteDeletion,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CacheFailure() when cache != null:
return cache(_that);case ResourceNotFoundFailure() when resourceNotFound != null:
return resourceNotFound(_that);case SavingNoteFailure() when savingNote != null:
return savingNote(_that);case NoteDeletionFailure() when noteDeletion != null:
return noteDeletion(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CacheFailure value)  cache,required TResult Function( ResourceNotFoundFailure value)  resourceNotFound,required TResult Function( SavingNoteFailure value)  savingNote,required TResult Function( NoteDeletionFailure value)  noteDeletion,}){
final _that = this;
switch (_that) {
case CacheFailure():
return cache(_that);case ResourceNotFoundFailure():
return resourceNotFound(_that);case SavingNoteFailure():
return savingNote(_that);case NoteDeletionFailure():
return noteDeletion(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CacheFailure value)?  cache,TResult? Function( ResourceNotFoundFailure value)?  resourceNotFound,TResult? Function( SavingNoteFailure value)?  savingNote,TResult? Function( NoteDeletionFailure value)?  noteDeletion,}){
final _that = this;
switch (_that) {
case CacheFailure() when cache != null:
return cache(_that);case ResourceNotFoundFailure() when resourceNotFound != null:
return resourceNotFound(_that);case SavingNoteFailure() when savingNote != null:
return savingNote(_that);case NoteDeletionFailure() when noteDeletion != null:
return noteDeletion(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  cache,TResult Function( String message)?  resourceNotFound,TResult Function( String message)?  savingNote,TResult Function( String message)?  noteDeletion,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CacheFailure() when cache != null:
return cache(_that.message);case ResourceNotFoundFailure() when resourceNotFound != null:
return resourceNotFound(_that.message);case SavingNoteFailure() when savingNote != null:
return savingNote(_that.message);case NoteDeletionFailure() when noteDeletion != null:
return noteDeletion(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  cache,required TResult Function( String message)  resourceNotFound,required TResult Function( String message)  savingNote,required TResult Function( String message)  noteDeletion,}) {final _that = this;
switch (_that) {
case CacheFailure():
return cache(_that.message);case ResourceNotFoundFailure():
return resourceNotFound(_that.message);case SavingNoteFailure():
return savingNote(_that.message);case NoteDeletionFailure():
return noteDeletion(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  cache,TResult? Function( String message)?  resourceNotFound,TResult? Function( String message)?  savingNote,TResult? Function( String message)?  noteDeletion,}) {final _that = this;
switch (_that) {
case CacheFailure() when cache != null:
return cache(_that.message);case ResourceNotFoundFailure() when resourceNotFound != null:
return resourceNotFound(_that.message);case SavingNoteFailure() when savingNote != null:
return savingNote(_that.message);case NoteDeletionFailure() when noteDeletion != null:
return noteDeletion(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CacheFailure implements Failures {
  const CacheFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheFailureCopyWith<CacheFailure> get copyWith => _$CacheFailureCopyWithImpl<CacheFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failures.cache(message: $message)';
}


}

/// @nodoc
abstract mixin class $CacheFailureCopyWith<$Res> implements $FailuresCopyWith<$Res> {
  factory $CacheFailureCopyWith(CacheFailure value, $Res Function(CacheFailure) _then) = _$CacheFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CacheFailureCopyWithImpl<$Res>
    implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(this._self, this._then);

  final CacheFailure _self;
  final $Res Function(CacheFailure) _then;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CacheFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResourceNotFoundFailure implements Failures {
  const ResourceNotFoundFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceNotFoundFailureCopyWith<ResourceNotFoundFailure> get copyWith => _$ResourceNotFoundFailureCopyWithImpl<ResourceNotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceNotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failures.resourceNotFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResourceNotFoundFailureCopyWith<$Res> implements $FailuresCopyWith<$Res> {
  factory $ResourceNotFoundFailureCopyWith(ResourceNotFoundFailure value, $Res Function(ResourceNotFoundFailure) _then) = _$ResourceNotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResourceNotFoundFailureCopyWithImpl<$Res>
    implements $ResourceNotFoundFailureCopyWith<$Res> {
  _$ResourceNotFoundFailureCopyWithImpl(this._self, this._then);

  final ResourceNotFoundFailure _self;
  final $Res Function(ResourceNotFoundFailure) _then;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResourceNotFoundFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SavingNoteFailure implements Failures {
  const SavingNoteFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingNoteFailureCopyWith<SavingNoteFailure> get copyWith => _$SavingNoteFailureCopyWithImpl<SavingNoteFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingNoteFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failures.savingNote(message: $message)';
}


}

/// @nodoc
abstract mixin class $SavingNoteFailureCopyWith<$Res> implements $FailuresCopyWith<$Res> {
  factory $SavingNoteFailureCopyWith(SavingNoteFailure value, $Res Function(SavingNoteFailure) _then) = _$SavingNoteFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SavingNoteFailureCopyWithImpl<$Res>
    implements $SavingNoteFailureCopyWith<$Res> {
  _$SavingNoteFailureCopyWithImpl(this._self, this._then);

  final SavingNoteFailure _self;
  final $Res Function(SavingNoteFailure) _then;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SavingNoteFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoteDeletionFailure implements Failures {
  const NoteDeletionFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteDeletionFailureCopyWith<NoteDeletionFailure> get copyWith => _$NoteDeletionFailureCopyWithImpl<NoteDeletionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteDeletionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failures.noteDeletion(message: $message)';
}


}

/// @nodoc
abstract mixin class $NoteDeletionFailureCopyWith<$Res> implements $FailuresCopyWith<$Res> {
  factory $NoteDeletionFailureCopyWith(NoteDeletionFailure value, $Res Function(NoteDeletionFailure) _then) = _$NoteDeletionFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NoteDeletionFailureCopyWithImpl<$Res>
    implements $NoteDeletionFailureCopyWith<$Res> {
  _$NoteDeletionFailureCopyWithImpl(this._self, this._then);

  final NoteDeletionFailure _self;
  final $Res Function(NoteDeletionFailure) _then;

/// Create a copy of Failures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NoteDeletionFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
