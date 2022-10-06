import UIKit

struct Photo {
    let image: UIImage?
    let name: String
    
    static func allPhotos() -> [Self] {
        [Photo(image: UIImage(named: "01"), name: "Shanks"),
         Photo(image: UIImage(named: "02"), name: "Japan Car"),
         Photo(image: UIImage(named: "03"), name: "Monkey D. Luffy"),
         Photo(image: UIImage(named: "04"), name: "Dio Brando"),
         Photo(image: UIImage(named: "05"), name: "Vinsmok Sanji"),
         Photo(image: UIImage(named: "06"), name: "Enel"),
         Photo(image: UIImage(named: "07"), name: "Saitama"),
         Photo(image: UIImage(named: "08"), name: "Naruto"),
         Photo(image: UIImage(named: "09"), name: "Stand"),
         Photo(image: UIImage(named: "10"), name: "Frankie")]
    }
}
