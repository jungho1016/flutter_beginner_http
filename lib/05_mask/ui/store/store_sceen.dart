import 'package:flutter/material.dart';
import 'package:flutter_beginner/05_mask/ui/store/store_widget.dart';
import 'package:provider/provider.dart';

import '../../data/model/model.dart';
import 'store_view_model.dart';

class StoreSceen extends StatelessWidget {
  const StoreSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StoreViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '마스크 재고 있는곳 : ${viewModel.stores.length}곳',
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.fetch();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: viewModel.isLoading
          ? loadingWidget()
          : ListView(
              children: viewModel.stores.map((e) {
                return ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.addr),
                  trailing: RemainStatWidget(
                    store: e,
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('정보를 가져 오는 중'), CircularProgressIndicator()],
      ),
    );
  }
}
