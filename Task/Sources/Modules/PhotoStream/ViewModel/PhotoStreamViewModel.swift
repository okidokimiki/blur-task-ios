import UIKit
import Combine

final class PhotoStreamViewModel {
    private(set) var photos: [Photo] = Photo.allPhotos()
    private(set) var randPhotos: [RandomPhoto] = RandomPhoto.allPhotos()
}

protocol WebImageServicing {
    func getImage(url: URL) -> AnyPublisher<UIImage, Error>
}

final class WebImageService: WebImageServicing {
    func getImage(url: URL) -> AnyPublisher<UIImage, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .compactMap { UIImage(data: $0) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
