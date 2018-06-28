protocol Repository {

    func getFeaturedCategories(completionHandler: @escaping (_ result: FeatureApp?, _ error: Error?) -> Void)

    func getAppById(appId: Int, _ completionHandlergetFeaturedCategories: @escaping (_ result: App?, _ error: Error?) -> Void)
}
