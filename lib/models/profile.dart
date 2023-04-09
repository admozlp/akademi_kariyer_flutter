class Profile {
  final String adSoyad;
  final String emailProfile;
  final String githubLink;
  final String linkedinLink;
  final String profilAciklama;

  Profile(
      {required this.adSoyad,
      required this.emailProfile,
      required this.githubLink,
      required this.linkedinLink,
      required this.profilAciklama});

  Map<String, dynamic> toJson() => {
        'adSoayd': adSoyad,
        'emailProfile': emailProfile,
        'github': githubLink,
        'linkedin': linkedinLink,
        'profilAciklama': profilAciklama
      };

  static Profile fromJson(Map<String, dynamic> json) => Profile(
      adSoyad: json['adSoyad'],
      emailProfile: json['emailProfile'],
      githubLink: json['github'],
      linkedinLink: json['linkedin'],
      profilAciklama: json['profilAciklama']);
}
