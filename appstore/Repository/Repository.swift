protocol Repository {
    typealias FeatureCategoriesHandler = (_ result: FeatureApp?, _ error: Error?) -> Void

    func getFeaturedCategories(completionHandler: @escaping FeatureCategoriesHandler)

    func getAppById(appId: Int, _ completionHandlergetFeaturedCategories: @escaping (_ result: App?, _ error: Error?) -> Void)
}
