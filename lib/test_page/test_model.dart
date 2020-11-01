class Soru {
  int id;
  String soru;
  String cevap1;
  String cevap2;
  String cevap3;
  String cevap4;
  int dogrucevap;

  Soru(this.id, this.soru, this.cevap1, this.cevap2, this.cevap3, this.cevap4,
      this.dogrucevap);
}

List<Soru> soruList10 = [
  new Soru(0, "soru1", "1_cevap1", "1_cevap2", "1_cevap3", "1_cevap4", 1),
  new Soru(1, "soru2", "2_cevap1", "2_cevap2", "2_cevap3", "2_cevap4", 2),
  new Soru(2, "soru3", "3_cevap1", "3_cevap2", "3_cevap3", "3_cevap4", 3),
  new Soru(3, "soru4", "4_cevap1", "4_cevap2", "4_cevap3", "4_cevap4", 4),
  new Soru(4, "soru5", "5_cevap1", "5_cevap2", "5_cevap3", "5_cevap4", 1),
  new Soru(5, "soru6", "6_cevap1", "6_cevap2", "6_cevap3", "6_cevap4", 2),
  new Soru(6, "soru7", "7_cevap1", "7_cevap2", "7_cevap3", "7_cevap4", 3),
  new Soru(7, "soru8", "8_cevap1", "8_cevap2", "8_cevap3", "8_cevap4", 4),
  new Soru(8, "soru9", "9_cevap1", "9_cevap2", "9_cevap3", "9_cevap4", 1),
  new Soru(9, "soru10", "10_cevap1", "10_cevap2", "10_cevap3", "b", 2)
];
