
import SwiftUI

struct InfoDetails: View {
    
    var post: Post
    
    var body: some View {
        ScrollView {
            VStack {
                Text (post.name)
                    .bold()
                    .font(.largeTitle)
                
                AsyncImage(url: URL(string: post.images.lg)) { phase in
                    switch phase {
                    case .failure: Image(systemName: "photo") .font(.largeTitle)
                    case .success(let image):
                        image.resizable()
                    default: ProgressView()
                    }
                }
                .frame(width: 300, height: 300)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Biography").bold()
                Text("""
                    Name: \(post.name)
                    FullName: \(post.biography.fullName ?? "")
                    AlterEgos: \(post.biography.alterEgos ?? "")
                    Aliases: \(post.biography.aliases?[0] ?? "")
                    PlaceOfBirth: \(post.biography.placeOfBirth ?? "")
                    FirstAppearance: \(post.biography.firstAppearance ?? "")
                    Publisher: \(post.biography.publisher ?? "")
                    Alignment: \(post.biography.alignment ?? "")
                    """)
                Text("Connections").bold()
                Text("""
                    GroupAffiliation: \(post.connections.groupAffiliation ?? "")
                    Relatives: \(post.connections.relatives ?? "")
                    """)
                Text("Work").bold()
                Text("""
                    Occupation: \(post.work.occupation ?? "")
                    Base: \(post.work.base ?? "")
                    """)
                Text("Appearance").bold()
                Text("""
                     Gender: \(post.appearance.gender ?? "")
                     Race: \(post.appearance.race ?? "")
                     Height: \(post.appearance.height?[1] ?? "")
                     Weight: \(post.appearance.weight?[1] ?? "")
                     EyeColor: \(post.appearance.eyeColor ?? "")
                     HairColor: \(post.appearance.hairColor ?? "")
                     """)
                Text("Powerstats").bold()
                Text("""
                     Intelligence: \(post.powerstats.intelligence ?? 0)
                     Strength: \(post.powerstats.strength ?? 0)
                     Speed: \(post.powerstats.speed ?? 0)
                     Durability: \(post.powerstats.durability ?? 0)
                     """)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    return InfoDetails(post: viewModel.post!)
}
