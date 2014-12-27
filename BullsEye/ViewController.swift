



import UIKit

class ViewController: UIViewController {
    
	var currentValue : Int = 0
	
	var targetValue : Int = 0
	
    
	@IBOutlet weak var slider: UISlider!

	@IBAction func showAlert(sender: AnyObject) {
			
			let sliderMessage = "The value of the slider is: \(currentValue)"
        
			let alert = UIAlertController(title: "Helllooorr", message: sliderMessage, preferredStyle: .Alert)
        
			let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
			alert.addAction(action)
        
			presentViewController(alert, animated: true, completion: nil)
			
    }
	
    
	@IBAction func sliderMoved(slider: UISlider) {
        
			currentValue = lroundf(slider.value)
        
    }
	
    
    override func viewDidLoad() {
			super.viewDidLoad()
			
			currentValue = lroundf(slider.value)
			targetValue = 1 + Int(arc4random_uniform(100))
			
		}
	

    override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

