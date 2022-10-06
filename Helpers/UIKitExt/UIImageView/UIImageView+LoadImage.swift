import UIKit

// TODO: Add UIActivityIndicatorView if need it
/**
 ```
 let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
 addSubview(activityIndicator)
 activityIndicator.startAnimating()
 activityIndicator.center = self.center
 ```
 */

extension UIImageView {
    
    func loadImage(from url: URL) {
        image = nil
        
        ImageLoader().loadImage(from: url) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async { self?.image = image }
            case .failure(_):
                DispatchQueue.main.async { self?.image = nil }
            }
        }
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            image = nil; return
        }
        
        loadImage(from: url)
    }
}

// MARK: ImageLoader

extension UIImageView {
    
    struct ImageLoader {
        func loadImage(
            from url: URL,
            _ onLoadWasCompleted: @escaping (_ result: Result<UIImage, Error>) -> Void
        ) {
            if let imageFromCache = getCacheImage(url: url) {
                onLoadWasCompleted(.success(imageFromCache))
                return
            }
            
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error {
                    onLoadWasCompleted(.failure(error))
                }
                
                if let data, let response, let image = UIImage(data: data) {
                    saveDataToCach(with: data, response: response)
                    onLoadWasCompleted(.success(image))
                }
            }
            
            dataTask.resume()
        }
    }
}

// MARK: ImageCache

private extension UIImageView.ImageLoader {
    
    func getCacheImage(url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        guard let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) else { return nil }
        
        return UIImage(data: cachedResponse.data)
    }
    
    func saveDataToCach(with data: Data, response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
