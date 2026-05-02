import SwiftUI

struct CameraView: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            // Tampilkan foto jika sudah diambil
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 300)
                    .cornerRadius(12)
                    .overlay(Text("Belum ada foto").foregroundColor(.gray))
            }

            // Tombol Camera Anda
            HStack {
                Spacer()
                Button(action: {
                    self.showCamera = true
                }) {
                    Text("Camera").bold().font(.callout).foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(15)
        }
        .padding()
        // Menampilkan kamera sebagai slide-up sheet
        .sheet(isPresented: $showCamera) {
            ImagePicker(image: $selectedImage)
        }
    }
}
