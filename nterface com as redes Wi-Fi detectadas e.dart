nterface com as redes Wi-Fi detectadas e suas avaliações de segurança
class WifiNetwork {
  final String ssid;
  final String securityProtocol;
  final int signalStrength;
  final bool isHidden;
  double securityScore;

  WifiNetwork(this.ssid, this.securityProtocol, this.signalStrength, this.isHidden, this.securityScore);
}
import 'package:flutter/material.dart';

class WifiListScreen extends StatefulWidget {
  final List<WifiNetwork> wifiList;

  WifiListScreen(this.wifiList);

  @override
  _WifiListScreenState createState() => _WifiListScreenState();
}

class _WifiListScreenState extends State<WifiListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redes Wi-Fi Disponíveis'),
      ),
      body: ListView.builder(
        itemCount: widget.wifiList.length,
        itemBuilder: (context, index) {
          final wifi = widget.wifiList[index];
          return ListTile(
            title: Text(wifi.ssid),
            subtitle: Text('Segurança: ${wifi.securityProtocol}'),
            trailing: Text('Pontuação: ${wifi.securityScore.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
