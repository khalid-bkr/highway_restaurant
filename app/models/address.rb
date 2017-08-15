class Address < ApplicationRecord
  validates :city, presence: true, inclusion: { in: %w(Irbid)}
  validates :area, presence: true, inclusion: {in: ["Al-Manara", "Ghorfet Al Tijarah", "Al-Nozha", "Alhai Alshamali", "Al-Alruda",
    "Al-Hashemi", "Al Sareeh", "Hanina", "Hay Al Zhour", "Hay Al Mahkamah", "Al Shariyeh", "Hay Al Atibaa", "Hakama Zabda", "Farkoh Al-Hashemiah", "King abdallah gardens",
    "Eskan al amleen", "Boshra", "Al-Nasr", "Alhai Alshamali", "Aydoun", "hai altwal", "Al-Barha", "Hay Al Turkman", "Al-mdenah", "Al-Snaieah", "Hay Al Qasilah", "Hay Al Naseem", "Hay Shabib",
    "hai al janobi", "Al-Rabia", "Al Huson", "Al Balad", "Hay Al Tuloul", "Hay Al Gharby", "Hay Al Sharqi", "Hay Al Sheikh Khalil", "Hawara", "Beit Ras", "Hay Al Jamaa", "Hay Al Asilah", "Hay Al Abrar",
    "Um Al Qura", "Hay Al Fadilah", "Hay Al Dobat", "Hay Al Ward", "Dahyat Al Hussein", "Hay Aliyah"] }
  validates :road_name, presence: true
end
