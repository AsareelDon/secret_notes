// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateNoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateNoteState()';
}


}

/// @nodoc
class $CreateNoteStateCopyWith<$Res>  {
$CreateNoteStateCopyWith(CreateNoteState _, $Res Function(CreateNoteState) __);
}


/// Adds pattern-matching-related methods to [CreateNoteState].
extension CreateNoteStatePatterns on CreateNoteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialNotes value)?  initialNotes,TResult Function( _LoadingNotes value)?  loadingNotes,TResult Function( _ErrorOnCreateNotes value)?  errorOnCreateNotes,TResult Function( _SuccessOnCreateNotes value)?  successOnCreateNotes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialNotes() when initialNotes != null:
return initialNotes(_that);case _LoadingNotes() when loadingNotes != null:
return loadingNotes(_that);case _ErrorOnCreateNotes() when errorOnCreateNotes != null:
return errorOnCreateNotes(_that);case _SuccessOnCreateNotes() when successOnCreateNotes != null:
return successOnCreateNotes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialNotes value)  initialNotes,required TResult Function( _LoadingNotes value)  loadingNotes,required TResult Function( _ErrorOnCreateNotes value)  errorOnCreateNotes,required TResult Function( _SuccessOnCreateNotes value)  successOnCreateNotes,}){
final _that = this;
switch (_that) {
case _InitialNotes():
return initialNotes(_that);case _LoadingNotes():
return loadingNotes(_that);case _ErrorOnCreateNotes():
return errorOnCreateNotes(_that);case _SuccessOnCreateNotes():
return successOnCreateNotes(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialNotes value)?  initialNotes,TResult? Function( _LoadingNotes value)?  loadingNotes,TResult? Function( _ErrorOnCreateNotes value)?  errorOnCreateNotes,TResult? Function( _SuccessOnCreateNotes value)?  successOnCreateNotes,}){
final _that = this;
switch (_that) {
case _InitialNotes() when initialNotes != null:
return initialNotes(_that);case _LoadingNotes() when loadingNotes != null:
return loadingNotes(_that);case _ErrorOnCreateNotes() when errorOnCreateNotes != null:
return errorOnCreateNotes(_that);case _SuccessOnCreateNotes() when successOnCreateNotes != null:
return successOnCreateNotes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialNotes,TResult Function()?  loadingNotes,TResult Function( Failures savingNoteFailure)?  errorOnCreateNotes,TResult Function( bool isSuccess)?  successOnCreateNotes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialNotes() when initialNotes != null:
return initialNotes();case _LoadingNotes() when loadingNotes != null:
return loadingNotes();case _ErrorOnCreateNotes() when errorOnCreateNotes != null:
return errorOnCreateNotes(_that.savingNoteFailure);case _SuccessOnCreateNotes() when successOnCreateNotes != null:
return successOnCreateNotes(_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialNotes,required TResult Function()  loadingNotes,required TResult Function( Failures savingNoteFailure)  errorOnCreateNotes,required TResult Function( bool isSuccess)  successOnCreateNotes,}) {final _that = this;
switch (_that) {
case _InitialNotes():
return initialNotes();case _LoadingNotes():
return loadingNotes();case _ErrorOnCreateNotes():
return errorOnCreateNotes(_that.savingNoteFailure);case _SuccessOnCreateNotes():
return successOnCreateNotes(_that.isSuccess);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialNotes,TResult? Function()?  loadingNotes,TResult? Function( Failures savingNoteFailure)?  errorOnCreateNotes,TResult? Function( bool isSuccess)?  successOnCreateNotes,}) {final _that = this;
switch (_that) {
case _InitialNotes() when initialNotes != null:
return initialNotes();case _LoadingNotes() when loadingNotes != null:
return loadingNotes();case _ErrorOnCreateNotes() when errorOnCreateNotes != null:
return errorOnCreateNotes(_that.savingNoteFailure);case _SuccessOnCreateNotes() when successOnCreateNotes != null:
return successOnCreateNotes(_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _InitialNotes extends CreateNoteState {
  const _InitialNotes(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateNoteState.initialNotes()';
}


}




/// @nodoc


class _LoadingNotes extends CreateNoteState {
  const _LoadingNotes(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateNoteState.loadingNotes()';
}


}




/// @nodoc


class _ErrorOnCreateNotes extends CreateNoteState {
  const _ErrorOnCreateNotes({required this.savingNoteFailure}): super._();
  

 final  Failures savingNoteFailure;

/// Create a copy of CreateNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorOnCreateNotesCopyWith<_ErrorOnCreateNotes> get copyWith => __$ErrorOnCreateNotesCopyWithImpl<_ErrorOnCreateNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorOnCreateNotes&&(identical(other.savingNoteFailure, savingNoteFailure) || other.savingNoteFailure == savingNoteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,savingNoteFailure);

@override
String toString() {
  return 'CreateNoteState.errorOnCreateNotes(savingNoteFailure: $savingNoteFailure)';
}


}

/// @nodoc
abstract mixin class _$ErrorOnCreateNotesCopyWith<$Res> implements $CreateNoteStateCopyWith<$Res> {
  factory _$ErrorOnCreateNotesCopyWith(_ErrorOnCreateNotes value, $Res Function(_ErrorOnCreateNotes) _then) = __$ErrorOnCreateNotesCopyWithImpl;
@useResult
$Res call({
 Failures savingNoteFailure
});


$FailuresCopyWith<$Res> get savingNoteFailure;

}
/// @nodoc
class __$ErrorOnCreateNotesCopyWithImpl<$Res>
    implements _$ErrorOnCreateNotesCopyWith<$Res> {
  __$ErrorOnCreateNotesCopyWithImpl(this._self, this._then);

  final _ErrorOnCreateNotes _self;
  final $Res Function(_ErrorOnCreateNotes) _then;

/// Create a copy of CreateNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? savingNoteFailure = null,}) {
  return _then(_ErrorOnCreateNotes(
savingNoteFailure: null == savingNoteFailure ? _self.savingNoteFailure : savingNoteFailure // ignore: cast_nullable_to_non_nullable
as Failures,
  ));
}

/// Create a copy of CreateNoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailuresCopyWith<$Res> get savingNoteFailure {
  
  return $FailuresCopyWith<$Res>(_self.savingNoteFailure, (value) {
    return _then(_self.copyWith(savingNoteFailure: value));
  });
}
}

/// @nodoc


class _SuccessOnCreateNotes extends CreateNoteState {
  const _SuccessOnCreateNotes({required this.isSuccess}): super._();
  

 final  bool isSuccess;

/// Create a copy of CreateNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessOnCreateNotesCopyWith<_SuccessOnCreateNotes> get copyWith => __$SuccessOnCreateNotesCopyWithImpl<_SuccessOnCreateNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessOnCreateNotes&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isSuccess);

@override
String toString() {
  return 'CreateNoteState.successOnCreateNotes(isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$SuccessOnCreateNotesCopyWith<$Res> implements $CreateNoteStateCopyWith<$Res> {
  factory _$SuccessOnCreateNotesCopyWith(_SuccessOnCreateNotes value, $Res Function(_SuccessOnCreateNotes) _then) = __$SuccessOnCreateNotesCopyWithImpl;
@useResult
$Res call({
 bool isSuccess
});




}
/// @nodoc
class __$SuccessOnCreateNotesCopyWithImpl<$Res>
    implements _$SuccessOnCreateNotesCopyWith<$Res> {
  __$SuccessOnCreateNotesCopyWithImpl(this._self, this._then);

  final _SuccessOnCreateNotes _self;
  final $Res Function(_SuccessOnCreateNotes) _then;

/// Create a copy of CreateNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isSuccess = null,}) {
  return _then(_SuccessOnCreateNotes(
isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
