class Proje {
  final String aciklama;
  final String baslik;
  final String kategoreiler;
  final String olusturan;

  Proje(
      {required this.aciklama,
        required this.baslik,
        required this.kategoreiler,
        required this.olusturan});

  Map<String, dynamic> toJson() => {
    'aciklama': aciklama,
    'baslik': baslik,
    'kategoriler': kategoreiler,
    'olusturan': olusturan,
  };

  static Proje fromJson(Map<String, dynamic> json) => Proje(
      aciklama: json['aciklama'],
      baslik: json['baslik'],
      kategoreiler: json['kategoriler'],
      olusturan: json['olusturan']
  );
}
