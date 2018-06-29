import Foundation

class APIRepository: Repository {
    func getFeaturedCategories(completionHandler: @escaping (_ result: FeatureApp?, _ error: Error?) -> Void) {
        let url: String = "https://api.letsbuildthatapp.com/appstore/featured"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) -> Void in
            /* GUARD: Was there an error? */
            guard error == nil else {
                print("There was an error with your request: \(error!)")
                return
            }

            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                200 ..< 299 ~= statusCode else {
                print("Your request returned a status code other than 2xx!")
                return
            }

            /* GUARD: Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }

            do {
                let featureApp = try JSONDecoder().decode(FeatureApp.self, from: data)
                completionHandler(featureApp, nil)
            } catch let err {
                print(err)
            }
        }.resume()
    }

    func getAppById(appId: Int, _ completionHandler: @escaping (_ result: App?, _ error: Error?) -> Void) {
        let url: String = "https://api.letsbuildthatapp.com/appstore/appdetail?id=\(appId)"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) -> Void in
            /* GUARD: Was there an error? */
            guard error == nil else {
                print("There was an error with your request: \(error!)")
                return
            }

            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                print("Your request returned a status code other than 2xx!")
                return
            }

            /* GUARD: Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }

            do {
                let appDetail = try JSONDecoder().decode(App.self, from: data)
                completionHandler(appDetail, nil)
            } catch let err {
                print(err)
            }
        }.resume()
    }
}
