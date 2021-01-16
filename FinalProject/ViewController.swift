import UIKit
import Alamofire
struct Meme: Codable {
   let id: Int
   let image: URL
   let caption: String
}
class ViewController: UIViewController {
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://some-random-api.ml/meme").responseDecodable(of: Meme.self) { (response) in
            
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
