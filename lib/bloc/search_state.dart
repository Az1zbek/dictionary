part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}
final class SearchLoadingState extends SearchState {}
final class SearchErorState extends SearchState {}
final class SearchSuccessState extends SearchState {
  List<Dic> list;
  SearchSuccessState(this.list);
}

