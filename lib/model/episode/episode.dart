import 'dart:convert';

enum Episode {
  NEWHOPE,
  EMPIRE,
  JEDI,
}

String episodeToJson(Episode e) {
  switch (e) {
    case Episode.NEWHOPE:
      return 'NEWHOPE';
    case Episode.EMPIRE:
      return 'EMPIRE';
    case Episode.JEDI:
      return 'JEDI';
    default:
      return '';
  }
}

String episodeToDisplay(Episode e) {
  switch (e) {
    case Episode.NEWHOPE:
      return 'EP. IV: A NEW HOPE';
    case Episode.EMPIRE:
      return 'EP. V: THE EMPIRE STRIKES BACK';
    case Episode.JEDI:
      return 'EP. VI: RETURN OF THE JEDI';
    default:
      return '';
  }
}

Episode? episodeFromJson(String e) {
  switch (e) {
    case 'NEWHOPE':
      return Episode.NEWHOPE;
    case 'EMPIRE':
      return Episode.EMPIRE;
    case 'JEDI':
      return Episode.JEDI;
    default:
      return null;
  }
}

String getPrettyJSONString(Map<String, dynamic>? data) {
  return const JsonEncoder.withIndent('  ').convert(data);
}
