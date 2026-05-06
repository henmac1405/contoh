
import Foundation
import SwiftUI

struct BranchDetilView: View {
    // Terima data dari halaman sebelumnya
    let branch: DataBranch // Sesuaikan dengan nama struct model Anda
    
    var body: some View {
        List {
            Section(header: Text("Informasi Branch")) {
                LabeledContent("ID ", value: branch.branch_id)
                LabeledContent("Nama ", value: branch.branch_name)
                LabeledContent("Alamat ", value: branch.branch_address)
                LabeledContent("No Telp ", value: branch.branch_telp)
                LabeledContent("Kota ", value: branch.branch_city)
                // Tambahkan data lainnya jika ada
            }
        }
        .navigationTitle("Detail Branch")
    }
}


