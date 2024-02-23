//
//  DebtVC.swift
//  DebtManagemenrt
//
//  Created by venkat on 20/02/24.
//

import UIKit
import Lottie

class DebtVC: UIViewController {
   
    

    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
        didSet{
            LaunchLAV.animation = .named("Animation")
            LaunchLAV.alpha=1
            LaunchLAV.play(){[weak self] _ in
                        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0.1, options: [.curveEaseIn]){
                            self!.LaunchLAV.alpha = 0
                        }
                    }
                }
            }
    
    @IBOutlet weak var DebtManagementTV: UIImageView!
    
    
    @IBOutlet weak var UsernameSV: UIStackView!
    
    
    @IBOutlet weak var usernameLBL: UILabel!
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    
    @IBOutlet weak var PasswordSV: UIStackView!
    
    
    @IBOutlet weak var PasswordLBL: UILabel!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var LOGINBTN: UIButton!
    
    @IBOutlet weak var RegisterBTN: UIButton!
    
    
    
    
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
