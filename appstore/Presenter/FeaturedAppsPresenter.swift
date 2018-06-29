import Foundation

class FeaturedAppsPresenter {
    let repository: APIRepository

    init(repository: APIRepository) {
        self.repository = repository
    }

    func getFeaturedCategories(_ completionHandler: @escaping (_ result: FeatureApp?, _ error: Error?) -> Void) {
        repository.getFeaturedCategories { result, error in
            completionHandler(result, error)
        }
    }
}
