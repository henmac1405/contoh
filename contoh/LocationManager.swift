import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var address: String = ""
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.first else { return }
        
        DispatchQueue.main.async {
            // 1. Simpan Latitude dan Longitude
            self.latitude = lastLocation.coordinate.latitude
            self.longitude = lastLocation.coordinate.longitude
            
            // 2. Cari Alamat berdasarkan lokasi tersebut
            self.geocoder.reverseGeocodeLocation(lastLocation) { placemarks, error in
                if let placemark = placemarks?.first {
                    let street = placemark.thoroughfare ?? ""
                    let city = placemark.locality ?? ""
                    let province = placemark.administrativeArea ?? ""
                    
                    self.address = "\(street), \(city), \(province)"
                }
                self.isLoading = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Gagal ambil lokasi: \(error.localizedDescription)")
        DispatchQueue.main.async { self.isLoading = false }
    }
}
