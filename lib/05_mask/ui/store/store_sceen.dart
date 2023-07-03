import 'package:flutter/material.dart';
import 'package:flutter_beginner/05_mask/ui/store/store_widget.dart';
import 'package:provider/provider.dart';
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
        body: _buildBody(viewModel));
  }

  Widget _buildBody(StoreViewModel storeModel) {
    if (storeModel.isLoading == true) {
      return loadingWidget();
    }
    if (storeModel.stores.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('반경 5km 이내에 재고가 있는 매장이 없습니다.'),
            Text('인터넷이 연결 되어 있는지 확인해주세요.'),
          ],
        ),
      );
    }
    return ListView(
      children: storeModel.stores.map((e) {
        return RemainStatWidget(
          store: e,
        );
      }).toList(),
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
