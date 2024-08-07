
import SwiftUI

struct InfoRow: View {
    
    @AppStorage("rowSize") private var value: Double = 100
    
    var post: Post
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: post.images.sm)) { phase in
                switch phase {
                case .failure: Image(systemName: "photo") .font(.largeTitle)
                case .success(let image):
                    image.resizable()
                default: ProgressView()
                }
            }
            .frame(width: value)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(post.name).font(.title)
        }
        .frame(height: value)
    }
}

#Preview {
    let viewModel = ViewModel()
    return InfoRow(post: viewModel.post!)
}
