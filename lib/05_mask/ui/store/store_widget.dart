import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/model.dart';

class RemainStatWidget extends StatelessWidget {
  final Store store;

  RemainStatWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(store.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(store.addr),
          Text('${store.km}km'),
        ],
      ),
      trailing: _buildRemainStat(store),
      onTap: () {
        _launchUrl(store.lat, store.lng);
      },
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

  Future<void> _launchUrl(double lat, double lng) async {
    final Uri _url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
