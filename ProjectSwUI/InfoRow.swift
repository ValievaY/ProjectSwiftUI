
import SwiftUI

struct InfoRow: View {
    
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
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(post.name).font(.title)
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    return InfoRow(post: viewModel.post!)
}
