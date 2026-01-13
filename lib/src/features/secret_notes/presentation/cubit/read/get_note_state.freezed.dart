// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetNoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetNoteState()';
}


}

/// @nodoc
class $GetNoteStateCopyWith<$Res>  {
$GetNoteStateCopyWith(GetNoteState _, $Res Function(GetNoteState) __);
}


/// Adds pattern-matching-related methods to [GetNoteState].
extension GetNoteStatePatterns on GetNoteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetInitialNotes value)?  initialNotes,TResult Function( _LoadingNotes value)?  loadingNotes,TResult Function( _SuccessOnFetchNotes value)?  successOnFetchNotes,TResult Function( _ErrorOnFetchNotes value)?  errorOnFetchNotes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetInitialNotes() when initialNotes != null:
return initialNotes(_that);case _LoadingNotes() when loadingNotes != null:
return loadingNotes(_that);case _SuccessOnFetchNotes() when successOnFetchNotes != null:
return successOnFetchNotes(_that);case _ErrorOnFetchNotes() when errorOnFetchNotes != null:
return errorOnFetchNotes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetInitialNotes value)  initialNotes,required TResult Function( _LoadingNotes value)  loadingNotes,required TResult Function( _SuccessOnFetchNotes value)  successOnFetchNotes,required TResult Function( _ErrorOnFetchNotes value)  errorOnFetchNotes,}){
final _that = this;
switch (_that) {
case _GetInitialNotes():
return initialNotes(_that);case _LoadingNotes():
return loadingNotes(_that);case _SuccessOnFetchNotes():
return successOnFetchNotes(_that);case _ErrorOnFetchNotes():
return errorOnFetchNotes(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetInitialNotes value)?  initialNotes,TResult? Function( _LoadingNotes value)?  loadingNotes,TResult? Function( _SuccessOnFetchNotes value)?  successOnFetchNotes,TResult? Function( _ErrorOnFetchNotes value)?  errorOnFetchNotes,}){
final _that = this;
switch (_that) {
case _GetInitialNotes() when initialNotes != null:
return initialNotes(_that);case _LoadingNotes() when loadingNotes != null:
return loadingNotes(_that);case _SuccessOnFetchNotes() when successOnFetchNotes != null:
return successOnFetchNotes(_that);case _ErrorOnFetchNotes() when errorOnFetchNotes != null:
return errorOnFetchNotes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialNotes,TResult Function()?  loadingNotes,TResult Function( List<NoteEntity> notes)?  successOnFetchNotes,TResult Function( Failures cacheFailure)?  errorOnFetchNotes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetInitialNotes() when initialNotes != null:
return initialNotes();case _LoadingNotes() when loadingNotes != null:
return loadingNotes();case _SuccessOnFetchNotes() when successOnFetchNotes != null:
return successOnFetchNotes(_that.notes);case _ErrorOnFetchNotes() when errorOnFetchNotes != null:
return errorOnFetchNotes(_that.cacheFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialNotes,required TResult Function()  loadingNotes,required TResult Function( List<NoteEntity> notes)  successOnFetchNotes,required TResult Function( Failures cacheFailure)  errorOnFetchNotes,}) {final _that = this;
switch (_that) {
case _GetInitialNotes():
return initialNotes();case _LoadingNotes():
return loadingNotes();case _SuccessOnFetchNotes():
return successOnFetchNotes(_that.notes);case _ErrorOnFetchNotes():
return errorOnFetchNotes(_that.cacheFailure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialNotes,TResult? Function()?  loadingNotes,TResult? Function( List<NoteEntity> notes)?  successOnFetchNotes,TResult? Function( Failures cacheFailure)?  errorOnFetchNotes,}) {final _that = this;
switch (_that) {
case _GetInitialNotes() when initialNotes != null:
return initialNotes();case _LoadingNotes() when loadingNotes != null:
return loadingNotes();case _SuccessOnFetchNotes() when successOnFetchNotes != null:
return successOnFetchNotes(_that.notes);case _ErrorOnFetchNotes() when errorOnFetchNotes != null:
return errorOnFetchNotes(_that.cacheFailure);case _:
  return null;

}
}

}

/// @nodoc


class _GetInitialNotes extends GetNoteState {
  const _GetInitialNotes(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetInitialNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetNoteState.initialNotes()';
}


}




/// @nodoc


class _LoadingNotes extends GetNoteState {
  const _LoadingNotes(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetNoteState.loadingNotes()';
}


}




/// @nodoc


class _SuccessOnFetchNotes extends GetNoteState {
  const _SuccessOnFetchNotes({required final  List<NoteEntity> notes}): _notes = notes,super._();
  

 final  List<NoteEntity> _notes;
 List<NoteEntity> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of GetNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessOnFetchNotesCopyWith<_SuccessOnFetchNotes> get copyWith => __$SuccessOnFetchNotesCopyWithImpl<_SuccessOnFetchNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessOnFetchNotes&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'GetNoteState.successOnFetchNotes(notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$SuccessOnFetchNotesCopyWith<$Res> implements $GetNoteStateCopyWith<$Res> {
  factory _$SuccessOnFetchNotesCopyWith(_SuccessOnFetchNotes value, $Res Function(_SuccessOnFetchNotes) _then) = __$SuccessOnFetchNotesCopyWithImpl;
@useResult
$Res call({
 List<NoteEntity> notes
});




}
/// @nodoc
class __$SuccessOnFetchNotesCopyWithImpl<$Res>
    implements _$SuccessOnFetchNotesCopyWith<$Res> {
  __$SuccessOnFetchNotesCopyWithImpl(this._self, this._then);

  final _SuccessOnFetchNotes _self;
  final $Res Function(_SuccessOnFetchNotes) _then;

/// Create a copy of GetNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notes = null,}) {
  return _then(_SuccessOnFetchNotes(
notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteEntity>,
  ));
}


}

/// @nodoc


class _ErrorOnFetchNotes extends GetNoteState {
  const _ErrorOnFetchNotes({required this.cacheFailure}): super._();
  

 final  Failures cacheFailure;

/// Create a copy of GetNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorOnFetchNotesCopyWith<_ErrorOnFetchNotes> get copyWith => __$ErrorOnFetchNotesCopyWithImpl<_ErrorOnFetchNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorOnFetchNotes&&(identical(other.cacheFailure, cacheFailure) || other.cacheFailure == cacheFailure));
}


@override
int get hashCode => Object.hash(runtimeType,cacheFailure);

@override
String toString() {
  return 'GetNoteState.errorOnFetchNotes(cacheFailure: $cacheFailure)';
}


}

/// @nodoc
abstract mixin class _$ErrorOnFetchNotesCopyWith<$Res> implements $GetNoteStateCopyWith<$Res> {
  factory _$ErrorOnFetchNotesCopyWith(_ErrorOnFetchNotes value, $Res Function(_ErrorOnFetchNotes) _then) = __$ErrorOnFetchNotesCopyWithImpl;
@useResult
$Res call({
 Failures cacheFailure
});


$FailuresCopyWith<$Res> get cacheFailure;

}
/// @nodoc
class __$ErrorOnFetchNotesCopyWithImpl<$Res>
    implements _$ErrorOnFetchNotesCopyWith<$Res> {
  __$ErrorOnFetchNotesCopyWithImpl(this._self, this._then);

  final _ErrorOnFetchNotes _self;
  final $Res Function(_ErrorOnFetchNotes) _then;

/// Create a copy of GetNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cacheFailure = null,}) {
  return _then(_ErrorOnFetchNotes(
cacheFailure: null == cacheFailure ? _self.cacheFailure : cacheFailure // ignore: cast_nullable_to_non_nullable
as Failures,
  ));
}

/// Create a copy of GetNoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailuresCopyWith<$Res> get cacheFailure {
  
  return $FailuresCopyWith<$Res>(_self.cacheFailure, (value) {
    return _then(_self.copyWith(cacheFailure: value));
  });
}
}

// dart format on
