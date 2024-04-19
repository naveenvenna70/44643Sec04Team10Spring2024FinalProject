
import Foundation
import UIKit

class SplitViewControllerUtility {
    static func toggleMasterView(for splitViewController: UISplitViewController) {
        if splitViewController.isCollapsed {
            splitViewController.show(.primary)
        } else {
            if splitViewController.displayMode == .oneOverSecondary {
                splitViewController.preferredDisplayMode = .secondaryOnly
            } else {
                splitViewController.preferredDisplayMode = .automatic
            }
        }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


