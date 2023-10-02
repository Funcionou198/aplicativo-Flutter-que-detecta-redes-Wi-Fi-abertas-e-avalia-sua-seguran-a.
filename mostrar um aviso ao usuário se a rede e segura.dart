mostrar um aviso ao usuário se a rede selecionada não for segura
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

              if (selectedWifi != null) {
                if (selectedWifi!.securityScore >= 3.0) {
                  // Conecte à rede segura
                  connectToWifi(selectedWifi!.ssid);
                } else {
                  // A rede não é segura, mostre um aviso
                  showSecurityWarningDialog(context);
                }
              }
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

  void connectToWifi(String ssid) {
    // Implemente a lógica de conexão à rede Wi-Fi aqui
  }

  void showSecurityWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rede Não Segura'),
          content: Text('Esta rede Wi-Fi não é segura. Deseja se conectar mesmo assim?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('Conectar'),
              onPressed: () {
                connectToWifi(selectedWifi!.ssid); // Conecte à rede, mesmo não sendo segura
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
