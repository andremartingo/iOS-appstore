import UIKit

class DetailAppController: UIViewController {
    private let detailHeaderId = "detailHeaderId"
    var mainView: DetailAppView!
    var mainSource: DetailAppSource?
    var store: APIRepository?

    var app: App? {
        didSet {
            navigationItem.title = app?.name
        }
    }

    override func loadView() {
        mainView = DetailAppView(frame: UIScreen.main.bounds)
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainSource = DetailAppSource(collection: mainView.appsCollectionView, app: app!)
        self.store = APIRepository()
        if let appId = app?.appId {
            self.getAppById(appId: appId)
        }
    }

    func getAppById(appId: Int) {
        store?.getAppById(appId: appId, { appDetail, _ in
            guard let app = appDetail else {
                return assertionFailure()
            }
            self.mainSource?.app = app
        })
    }
}
