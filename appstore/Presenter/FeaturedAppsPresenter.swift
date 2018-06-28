import Foundation

class FeaturedAppsPresenter {

    let repository: APIRepository

    init(repository: APIRepository) {
        self.repository = repository
    }

    func getFeaturedCategories(_ completionHandlergetFeaturedCategories: @escaping (_ result: FeatureApp?, _ error: Error?) -> Void) {
        repository.getFeaturedCategories { (result, error) in
            completionHandlergetFeaturedCategories(result, error)
        }
    }
}
