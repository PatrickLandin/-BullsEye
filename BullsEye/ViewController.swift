



import UIKit

class ViewController: UIViewController {
    
	var currentValue : Int = 0
	var targetValue : Int = 0
	var difference : Int = 0
	
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	
	@IBAction func showAlert(sender: AnyObject) {
		

		if currentValue > targetValue {
			difference = currentValue - targetValue
			
		} else if targetValue > currentValue {
			difference = targetValue - currentValue
			
		} else {
			difference = 0
		}
		
			
		let sliderMessage = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is: \(difference)"
        
		let alert = UIAlertController(title: "Helllooorr", message: sliderMessage, preferredStyle: .Alert)
        
		let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
		alert.addAction(action)
        
		presentViewController(alert, animated: true, completion: nil)
		
		self.startNewRound()
		self.updateLabels()
	}
	
    
	@IBAction func sliderMoved(slider: UISlider) {
        
		currentValue = lroundf(slider.value)
	}
	
	
	func startNewRound() {
		
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
	}
	
	
	func updateLabels() {
		
		targetLabel.text = String(targetValue)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
			
		self.startNewRound()
		self.updateLabels()
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

