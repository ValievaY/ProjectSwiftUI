
import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
}

struct Biography: Codable {
    let fullName, alterEgos: String?
    let aliases: [String]?
    let placeOfBirth, firstAppearance, publisher, alignment: String?
}

struct Connections: Codable {
    let groupAffiliation, relatives: String?
}

struct Images: Codable {
    let xs, sm, md, lg: String
}

struct Powerstats: Codable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?
}

struct Work: Codable {
    let occupation, base: String?
}

typealias Posts = [Post]

@Observable class ViewModel {
    
    var post: Post?
    
    func fetchRemoteData(completion: ((_ post: Posts?, _ errorString: String?)->Void)? ) {
        
        let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!
        
        let request = URLRequest(url: url)
        let session  = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let answer = try JSONDecoder().decode(Posts.self, from: data)
                self.post = answer[0]
                completion?(answer, nil)
            } catch {
                print(error)
                completion?(nil, error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
