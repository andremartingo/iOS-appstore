import Foundation
protocol Repository {

    func getFeaturedCategories(_ completionHandlergetFeaturedCategories: @escaping (_ result: FeatureApp?, _ error: NSError?) -> Void)

      func getAppById(appId: NSNumber, _ completionHandlergetFeaturedCategories: @escaping (_ result: App?, _ error: NSError?) -> Void)
}
