//
//  LottieAnimationVC.swift
//  DebtManagemenrt
//
//  Created by Naveen Reddy Venna on 4/19/24.
//

import UIKit
import Lottie

class LottieAnimationVC: UIViewController {
    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
    didSet{
        LaunchLAV.animation = .named("Animation")
        LaunchLAV.alpha=1
        LaunchLAV.play(){[weak self] _ in
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0.1, options: [.curveEaseIn]){
                self!.LaunchLAV.alpha = 0
                self?.performSegue(withIdentifier: "LAVtologin", sender: self)
            }
        }
    }
}
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
