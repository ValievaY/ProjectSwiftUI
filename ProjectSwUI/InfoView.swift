
import SwiftUI

struct InfoView: View {
    
    var viewModel = ViewModel()
    
    @State private var posts: [Post] = []
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(searchResults) { post in
                    NavigationLink {
                        InfoDetails(post: post)
                    } label: {
                        InfoRow(post: post)
                    }
                }
            }
            .navigationTitle("Superheros")
            .bold()
            .font(.largeTitle)
        }
        .searchable(text: $searchText)
        .scrollContentBackground(.hidden)
        .background(.white)
        .onAppear {
            viewModel.fetchRemoteData() { characters, errorString in
                if errorString == nil && characters != nil {
                    DispatchQueue.main.async {
                        self.posts = characters!
                    }
                }
            }
        }
    }
    
    var searchResults: [Post] {
        if searchText.isEmpty {
            return posts
        } else {
            return posts.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    InfoView()
}
