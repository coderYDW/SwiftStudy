import Foundation
import UIKit

public class ViewController01: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.frame  = CGRect(x: 0, y: 200, width:300, height:50)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("click", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func onButtonClick () {
        navigationController?.pushViewController(ViewController02(), animated: true)
    }
    
    
    
}
