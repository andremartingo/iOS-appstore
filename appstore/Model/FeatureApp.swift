class FeatureApp: Decodable {
    var bannerCategory: Category?
    var appCategories: [Category]?

    enum CodingKeys: String, CodingKey {
        case appCategories = "categories"
        case bannerCategory
    }
}
