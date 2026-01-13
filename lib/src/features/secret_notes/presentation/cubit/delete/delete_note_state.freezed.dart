// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteNoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteNoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteNoteState()';
}


}

/// @nodoc
class $DeleteNoteStateCopyWith<$Res>  {
$DeleteNoteStateCopyWith(DeleteNoteState _, $Res Function(DeleteNoteState) __);
}


/// Adds pattern-matching-related methods to [DeleteNoteState].
extension DeleteNoteStatePatterns on DeleteNoteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialDelete value)?  initialDelete,TResult Function( _LoadingDeletion value)?  loadingDeletion,TResult Function( _SuccessOnDeleteNotes value)?  successOnDeleteNotes,TResult Function( _ErrorOnDeleteNotes value)?  errorOnDeleteNotes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialDelete() when initialDelete != null:
return initialDelete(_that);case _LoadingDeletion() when loadingDeletion != null:
return loadingDeletion(_that);case _SuccessOnDeleteNotes() when successOnDeleteNotes != null:
return successOnDeleteNotes(_that);case _ErrorOnDeleteNotes() when errorOnDeleteNotes != null:
return errorOnDeleteNotes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialDelete value)  initialDelete,required TResult Function( _LoadingDeletion value)  loadingDeletion,required TResult Function( _SuccessOnDeleteNotes value)  successOnDeleteNotes,required TResult Function( _ErrorOnDeleteNotes value)  errorOnDeleteNotes,}){
final _that = this;
switch (_that) {
case _InitialDelete():
return initialDelete(_that);case _LoadingDeletion():
return loadingDeletion(_that);case _SuccessOnDeleteNotes():
return successOnDeleteNotes(_that);case _ErrorOnDeleteNotes():
return errorOnDeleteNotes(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialDelete value)?  initialDelete,TResult? Function( _LoadingDeletion value)?  loadingDeletion,TResult? Function( _SuccessOnDeleteNotes value)?  successOnDeleteNotes,TResult? Function( _ErrorOnDeleteNotes value)?  errorOnDeleteNotes,}){
final _that = this;
switch (_that) {
case _InitialDelete() when initialDelete != null:
return initialDelete(_that);case _LoadingDeletion() when loadingDeletion != null:
return loadingDeletion(_that);case _SuccessOnDeleteNotes() when successOnDeleteNotes != null:
return successOnDeleteNotes(_that);case _ErrorOnDeleteNotes() when errorOnDeleteNotes != null:
return errorOnDeleteNotes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialDelete,TResult Function()?  loadingDeletion,TResult Function( bool isSuccess)?  successOnDeleteNotes,TResult Function( Failures deleteFailure)?  errorOnDeleteNotes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialDelete() when initialDelete != null:
return initialDelete();case _LoadingDeletion() when loadingDeletion != null:
return loadingDeletion();case _SuccessOnDeleteNotes() when successOnDeleteNotes != null:
return successOnDeleteNotes(_that.isSuccess);case _ErrorOnDeleteNotes() when errorOnDeleteNotes != null:
return errorOnDeleteNotes(_that.deleteFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialDelete,required TResult Function()  loadingDeletion,required TResult Function( bool isSuccess)  successOnDeleteNotes,required TResult Function( Failures deleteFailure)  errorOnDeleteNotes,}) {final _that = this;
switch (_that) {
case _InitialDelete():
return initialDelete();case _LoadingDeletion():
return loadingDeletion();case _SuccessOnDeleteNotes():
return successOnDeleteNotes(_that.isSuccess);case _ErrorOnDeleteNotes():
return errorOnDeleteNotes(_that.deleteFailure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialDelete,TResult? Function()?  loadingDeletion,TResult? Function( bool isSuccess)?  successOnDeleteNotes,TResult? Function( Failures deleteFailure)?  errorOnDeleteNotes,}) {final _that = this;
switch (_that) {
case _InitialDelete() when initialDelete != null:
return initialDelete();case _LoadingDeletion() when loadingDeletion != null:
return loadingDeletion();case _SuccessOnDeleteNotes() when successOnDeleteNotes != null:
return successOnDeleteNotes(_that.isSuccess);case _ErrorOnDeleteNotes() when errorOnDeleteNotes != null:
return errorOnDeleteNotes(_that.deleteFailure);case _:
  return null;

}
}

}

/// @nodoc


class _InitialDelete extends DeleteNoteState {
  const _InitialDelete(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialDelete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteNoteState.initialDelete()';
}


}




/// @nodoc


class _LoadingDeletion extends DeleteNoteState {
  const _LoadingDeletion(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingDeletion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteNoteState.loadingDeletion()';
}


}




/// @nodoc


class _SuccessOnDeleteNotes extends DeleteNoteState {
  const _SuccessOnDeleteNotes({required this.isSuccess}): super._();
  

 final  bool isSuccess;

/// Create a copy of DeleteNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessOnDeleteNotesCopyWith<_SuccessOnDeleteNotes> get copyWith => __$SuccessOnDeleteNotesCopyWithImpl<_SuccessOnDeleteNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessOnDeleteNotes&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isSuccess);

@override
String toString() {
  return 'DeleteNoteState.successOnDeleteNotes(isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$SuccessOnDeleteNotesCopyWith<$Res> implements $DeleteNoteStateCopyWith<$Res> {
  factory _$SuccessOnDeleteNotesCopyWith(_SuccessOnDeleteNotes value, $Res Function(_SuccessOnDeleteNotes) _then) = __$SuccessOnDeleteNotesCopyWithImpl;
@useResult
$Res call({
 bool isSuccess
});




}
/// @nodoc
class __$SuccessOnDeleteNotesCopyWithImpl<$Res>
    implements _$SuccessOnDeleteNotesCopyWith<$Res> {
  __$SuccessOnDeleteNotesCopyWithImpl(this._self, this._then);

  final _SuccessOnDeleteNotes _self;
  final $Res Function(_SuccessOnDeleteNotes) _then;

/// Create a copy of DeleteNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,}) {
  return _then(_SuccessOnDeleteNotes(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ErrorOnDeleteNotes extends DeleteNoteState {
  const _ErrorOnDeleteNotes({required this.deleteFailure}): super._();
  

 final  Failures deleteFailure;

/// Create a copy of DeleteNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorOnDeleteNotesCopyWith<_ErrorOnDeleteNotes> get copyWith => __$ErrorOnDeleteNotesCopyWithImpl<_ErrorOnDeleteNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorOnDeleteNotes&&(identical(other.deleteFailure, deleteFailure) || other.deleteFailure == deleteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,deleteFailure);

@override
String toString() {
  return 'DeleteNoteState.errorOnDeleteNotes(deleteFailure: $deleteFailure)';
}


}

/// @nodoc
abstract mixin class _$ErrorOnDeleteNotesCopyWith<$Res> implements $DeleteNoteStateCopyWith<$Res> {
  factory _$ErrorOnDeleteNotesCopyWith(_ErrorOnDeleteNotes value, $Res Function(_ErrorOnDeleteNotes) _then) = __$ErrorOnDeleteNotesCopyWithImpl;
@useResult
$Res call({
 Failures deleteFailure
});


$FailuresCopyWith<$Res> get deleteFailure;

}
/// @nodoc
class __$ErrorOnDeleteNotesCopyWithImpl<$Res>
    implements _$ErrorOnDeleteNotesCopyWith<$Res> {
  __$ErrorOnDeleteNotesCopyWithImpl(this._self, this._then);

  final _ErrorOnDeleteNotes _self;
  final $Res Function(_ErrorOnDeleteNotes) _then;

/// Create a copy of DeleteNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deleteFailure = null,}) {
  return _then(_ErrorOnDeleteNotes(
deleteFailure: null == deleteFailure ? _self.deleteFailure : deleteFailure // ignore: cast_nullable_to_non_nullable
as Failures,
  ));
}

/// Create a copy of DeleteNoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailuresCopyWith<$Res> get deleteFailure {
  
  return $FailuresCopyWith<$Res>(_self.deleteFailure, (value) {
    return _then(_self.copyWith(deleteFailure: value));
  });
}
}

// dart format on
