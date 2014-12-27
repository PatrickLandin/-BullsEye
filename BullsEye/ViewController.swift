



import UIKit

class ViewController: UIViewController {
    
	var currentValue : Int = 0
	
	var targetValue : Int = 0
	
    
	@IBOutlet weak var slider: UISlider!

	@IBAction func showAlert(sender: AnyObject) {
			
		let sliderMessage = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
		let alert = UIAlertController(title: "Helllooorr", message: sliderMessage, preferredStyle: .Alert)
        
		let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
		alert.addAction(action)
        
		presentViewController(alert, animated: true, completion: nil)
		
		self.startNewRound()
			
	}
	
    
	@IBAction func sliderMoved(slider: UISlider) {
        
		currentValue = lroundf(slider.value)
        
	}
	
	func startNewRound() {
		
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
		
	}
    
	override func viewDidLoad() {
		super.viewDidLoad()
			
		self.startNewRound()
			
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

