implementar a lógica para calcular a nota de segurança da rede
class WifiNetwork {
  final String ssid;
  final String securityProtocol;
  final int signalStrength;
  final bool isHidden;
  double securityScore;

  WifiNetwork(this.ssid, this.securityProtocol, this.signalStrength, this.isHidden, this.securityScore);
}

// Função para calcular a nota de segurança de uma rede Wi-Fi
double calculateSecurityScore(WifiNetwork wifi) {
  double securityScore = 0.0;

  // Fator 1: Protocolo de segurança
  if (wifi.securityProtocol == "WEP") {
    securityScore += 1.0;
  } else if (wifi.securityProtocol == "WPA") {
    securityScore += 2.0;
  } else if (wifi.securityProtocol == "WPA2") {
    securityScore += 3.0;
  } else if (wifi.securityProtocol == "WPA3") {
    securityScore += 4.0;
  } else {
    // Não reconhecido ou sem segurança
    securityScore += 0.0;
  }

  // Fator 2: Força do sinal
  // Suponha que a força do sinal varie de 0 a 100
  double signalStrengthFactor = wifi.signalStrength / 100.0;
  securityScore += signalStrengthFactor;

  // Fator 3: Visibilidade do SSID
  if (wifi.isHidden) {
    securityScore -= 1.0;
  }

  // Limitar a pontuação mínima a 0 e a pontuação máxima a 5
  securityScore = securityScore.clamp(0.0, 5.0);

  // Armazenar a pontuação de segurança na instância da rede Wi-Fi
  wifi.securityScore = securityScore;

  return securityScore;
}
