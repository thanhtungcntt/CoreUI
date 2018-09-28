//LabeLExtension
// author : TungLe

import Foundation
import UIKit

// name of image back
private let kBackImgString = "ic_back_common"

open class NavigationSettings : NSObject {
    
    // MARK : title navigation
    var titleNavigation: String?
    var leftTitle: String?
    var leftImage: UIImage?
    var rightTitle: String?
    var rightImage: UIImage?
    
    open class func setupNavigationBar(with viewController: UIViewController, settings: NavigationSettings, target: Any?, leftAction: Selector?, rightAction: Selector?) {
        if settings.leftImage != nil {
            let backButtonBarItem = UIBarButtonItem(image: settings.leftImage, style: .plain, target: target, action: leftAction)
            viewController.navigationItem.leftBarButtonItem = backButtonBarItem
        }
        if settings.leftTitle != nil {
            let leftBarButtonItem = UIBarButtonItem(title: settings.leftTitle, style: .plain, target: target, action: leftAction)
            viewController.navigationItem.rightBarButtonItem = leftBarButtonItem
        }
        if settings.rightImage != nil || settings.rightTitle != nil {
            let rightButtonBarItem = UIBarButtonItem(image: settings.rightImage, style: .plain, target: target, action: rightAction)
            rightButtonBarItem.title = settings.rightTitle
            viewController.navigationItem.rightBarButtonItem = rightButtonBarItem
        }
        if settings.rightTitle != nil {
            let rightBarButtonItem = UIBarButtonItem(title: settings.rightTitle, style: .plain, target: target, action: rightAction)
            viewController.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
        viewController.title = settings.titleNavigation
    }
    
    public init(title: String) {
        super.init()
        titleNavigation = title
    }
    
    public init(backButtonAndNavigationTitle title: String) {
        super.init()
        titleNavigation = title
        let bundle = Bundle(for: type(of: self))
        leftImage = UIImage.init(named: kBackImgString, in: bundle, compatibleWith: nil)
    }

    public init(backButtonAndNavigationTitle title: String, withRightTitle rightTitle: String) {
        super.init()
        self.rightTitle = rightTitle
    }

    public init(backButtonAndNavigationTitle title: String, withRightImage rightImage: String) {
        super.init()
        self.rightImage = UIImage(named: rightImage)
    }

    public init(title: String, withTitleLeft titleLeft: String) {
        super.init()
        self.titleNavigation = title
        self.leftTitle = titleLeft
    }

    public init(title: String, withImageLeft imageLeft: String) {
        super.init()
        titleNavigation = title
        leftImage = UIImage(named: imageLeft)
    }

    public init(title: String, withTitleRight titleRight: String) {
        super.init()
        titleNavigation = title
        rightTitle = titleRight
    }

    public init(title: String, withImageRight imageRight: String) {
        super.init()
        titleNavigation = title
        rightImage = UIImage(named: imageRight)
    }

    public init(title: String, withTitleLeft titleLeft: String, withTitleRight titleRight: String) {
        super.init()
        titleNavigation = title
        rightTitle = titleRight
        leftTitle = titleLeft
    }

    public init(title: String, withImageLeft imageLeft: String, withImageRight imageRight: String) {
        super.init()
        titleNavigation = title
        rightImage = UIImage(named: imageRight)
        leftImage = UIImage(named: imageLeft)
    }

    public init(title: String, withTitleLeft titleLeft: String, withImageRight imageRight: String) {
        super.init()
        titleNavigation = title
        leftTitle = titleLeft
        rightImage = UIImage(named: imageRight)
    }

    public init(title: String, withImageLeft imageLeft: String, withTitleRight titleRight: String) {
        super.init()
        titleNavigation = title
        leftImage = UIImage(named: imageLeft)
        rightTitle = titleRight
    }
}
