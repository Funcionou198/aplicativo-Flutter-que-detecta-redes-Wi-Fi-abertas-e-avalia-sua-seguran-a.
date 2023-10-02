import 'package:permission_handler/permission_handler.dart';

// ...

// Função para solicitar permissões de localização
Future<void> requestLocationPermission() async {
  final status = await Permission.location.request();

  if (status.isGranted) {
    // Permissão concedida, você pode acessar a localização agora
  } else if (status.isDenied) {
    // Permissão negada, explique ao usuário por que a localização é necessária
  } else if (status.isPermanentlyDenied) {
    // Permissão negada permanentemente, redirecione o usuário para as configurações do aplicativo
    openAppSettings();
  }
}
