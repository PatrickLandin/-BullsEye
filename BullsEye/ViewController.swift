

import UIKit

class ViewController: UIViewController {
    
	var currentValue = 0
	var targetValue = 0
	var score = 0
	var round = 0
	
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var roundLabel: UILabel!
	
	
	@IBAction func showAlert(sender: AnyObject) {
		
		let difference = abs(currentValue - targetValue)
		var points = 100 - difference
		
		
		var title : String = ""
		
		if difference == 0 {
			title = "Perfect."
			points += 100
		} else if difference < 4 {
			title = "Damn! You almost had it!"
			if difference == 1 {
				points += 50
			}
			if difference == 2 {
				points += 20
			}
			if difference == 3 {
				points += 10
			}
		} else if difference < 9 {
			title = "Not bad I guess."
		} else if difference < 16 {
			title = "Not even close..."
		} else {
			title = "You're bloody rubbish at this."
		}
		
		score += points
		
			
		let sliderMessage = "" + "\nYou were off by \(difference) slider bits" + "\nand scored \(points) points this round!"
        
		let alert = UIAlertController(title: title, message: sliderMessage, preferredStyle: .Alert)
        
		let action = UIAlertAction(title: "OK", style: .Default, handler: {action in
			self.startNewRound()
			self.updateLabels()
			})
        
		alert.addAction(action)
        
		presentViewController(alert, animated: true, completion: nil)
	}
	
    
	@IBAction func sliderMoved(slider: UISlider) {
        
		currentValue = lroundf(slider.value)
	}
	
	@IBAction func startOver(sender: AnyObject) {
		
		startNewGame()
		updateLabels()
	}
	
	
	func startNewRound() {
		
		round += 1
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
	
	}
	
	func startNewGame() {
		
		score = 0
		round = 0
		startNewRound()
	}
	
	func updateLabels() {
		
		targetLabel.text = String(targetValue)
		scoreLabel.text = String(score)
		roundLabel.text = String(round)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
			
		self.startNewGame()
		self.updateLabels()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

