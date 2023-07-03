import 'package:flutter/material.dart';
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
            '마스크 재고 있는곳 : ${viewModel.stores.where((e) => e.remainStat == 'plenty' || e.remainStat == 'some' || e.remainStat == 'few').length}곳'),
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
              children: viewModel.stores
                  .where((e) =>
                      e.remainStat == 'plenty' ||
                      e.remainStat == 'some' ||
                      e.remainStat == 'few')
                  .map((e) {
                return ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.addr),
                  trailing: _buildRemainStat(e),
                );
              }).toList(),
            ),
    );
  }

  Widget _buildRemainStat(Store store) {
    String remainStat = '판매중지';
    String description = '판매중지';
    Color color = Colors.black;
    switch (store.remainStat) {
      case 'plenty':
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainStat = '보통';
        description = '30 ~ 100개';
        color = Colors.yellow;
        break;
      case 'few':
        remainStat = '부족';
        description = '2개 ~ 30개';
        color = Colors.red;
        break;
      case 'empty':
        remainStat = '소진 임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          remainStat,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(color: color),
        )
      ],
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
