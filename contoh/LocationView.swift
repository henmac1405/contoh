
import Foundation
import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject var controller : Controller
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack(spacing: 20) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    
                    if locationManager.isLoading {
                        ProgressView("Mencari Alamat...")
                    } else {
                        Text(locationManager.address.isEmpty ? "Alamat belum ditemukan" : locationManager.address)
                            .multilineTextAlignment(.center)
                            .padding()
                        HStack {
                                            Text("Latitude")
                                            Spacer()
                                            Text("\(locationManager.latitude, specifier: "%.6f")")
                                                .foregroundColor(.gray)
                                        }
                                        HStack {
                                            Text("Longitude")
                                            Spacer()
                                            Text("\(locationManager.longitude, specifier: "%.6f")")
                                                .foregroundColor(.gray)
                                        }
                    }
                    
                    Button("Ambil Lokasi & Alamat") {
                        locationManager.requestLocation()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .navigationTitle("Cek Lokasi")
                .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            locationManager.requestLocation()
        }
    }
}
