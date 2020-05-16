import Foundation
import UIKit


public class ViewController02: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "page 02"
        label.textColor = .white
        label.backgroundColor = .red
        label.frame = CGRect(x: 0, y: 300, width: 300, height: 50)
        view.addSubview(label)
        
    }
}

