implementar a funcionalidade que permite ao usuário selecionar uma rede da lista
import 'package:flutter/material.dart';

class WifiListScreen extends StatefulWidget {
  final List<WifiNetwork> wifiList;

  WifiListScreen(this.wifiList);

  @override
  _WifiListScreenState createState() => _WifiListScreenState();
}

class _WifiListScreenState extends State<WifiListScreen> {
  WifiNetwork? selectedWifi;

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
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWifi = wifi; // Armazena a rede selecionada
              });
            },
            child: ListTile(
              title: Text(wifi.ssid),
              subtitle: Text('Segurança: ${wifi.securityProtocol}'),
              trailing: Text('Pontuação: ${wifi.securityScore.toStringAsFixed(2)}'),
              // Define a cor de fundo do item da lista com base na seleção
              tileColor: wifi == selectedWifi ? Colors.blue.withOpacity(0.3) : null,
            ),
          );
        },
      ),
    );
  }
}
