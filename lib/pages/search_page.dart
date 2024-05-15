import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionary/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/dic.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
  List<Dic> dicList=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SafeArea(
          child: Column(
            children: [
              TextField(),
              BlocConsumer<SearchBloc, SearchState>(
                builder: (BuildContext context, SearchState state){
                  if(state is SearchSuccessState) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return Text(state.list[index].en);
                        });
                  }
                  return Text("Loading...");
                }, listener: (BuildContext context, SearchState state) {  },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
