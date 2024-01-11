import 'package:url_launcher/url_launcher.dart';

///Redireciona usuário para a url informada
void launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } else {
    'Não foi possível prosseguir com a solicitação';
  }
}

bool isNullOrEmpty(dynamic value) {
  if (value == null) {
    return true;
  }

  if (value is String) {
    if (value.trim().isEmpty || value == 'null') {
      return true;
    }
  }

  return false;
}

