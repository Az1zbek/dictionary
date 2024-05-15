import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../model/dic.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  Future<List<Dic>> getDics() async {
    List<Dic> dicList = [];
    await instance.collection('dic').get().then((value) {
      var docs = value.docs;
      docs.forEach((document) {
        var data = document.data() as Map<String, dynamic>;
        var dic = Dic(data['eng'], data['uz']);
        print(dic);
        dicList.add(dic);

      });
    });
    return dicList;
  }

  SearchBloc() : super(SearchInitialState()) {
    on<GetDataSearchEvent>((event, emit) async {
      emit(SearchLoadingState());
      var list= await getDics();
      emit(SearchSuccessState(list));

      // TODO: implement event handler
    });
  }
}
