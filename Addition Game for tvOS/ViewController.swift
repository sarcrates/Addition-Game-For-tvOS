//
//  ViewController.swift
//  Addition Game for tvOS
//
//  Created by sarcrates on 5/3/17.
//  Copyright © 2017 sarcrates. All rights reserved.
//

import UIKit
// to add sound remove this comment // import AVFoundation

class ViewController: UIViewController {
	
	@IBOutlet weak var AdditionGameLabel: UILabel!
	@IBOutlet weak var CorrectTotalLabel: UILabel!
	@IBOutlet weak var QuestionLabel: UILabel!
	@IBOutlet weak var CorrectIncorrectLabel: UILabel!
	
	@IBOutlet weak var ResetButton: UIButton!
	@IBOutlet weak var Answer0Button: UIButton!
	@IBOutlet weak var Answer1Button: UIButton!
	@IBOutlet weak var Answer2Button: UIButton!
	@IBOutlet weak var Answer3Button: UIButton!
	
	var firstNumber : Int = 0
	var secondNumber : Int = 0
	var answer : Int = 0
	
	var correctTotal : Int = 0
	var correctIncorrect = ""
	
	var RandomButton : Int = 0
	
	var incorrectAnswer1 : Int = 0
	var incorrectAnswer2 : Int = 0
	var incorrectAnswer3 : Int = 7

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		randomNumbers()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func printMathQuestion(){
		QuestionLabel.text = "\(firstNumber) + \(secondNumber) = ?"
	}
	
	func randomNumbers(){
		firstNumber = Int(arc4random_uniform(9))
		secondNumber = Int(arc4random_uniform(9))
		answer = firstNumber + secondNumber
		
		incorrectAnswer1 = Int(arc4random_uniform(5))
		incorrectAnswer2 = Int(arc4random_uniform(2))
		RandomButton = Int(arc4random_uniform(4))
		
		printMathQuestion()
		ShowTextOnButton()
		showCorrectIncorrect()
	}
	
	func ShowTextOnButton(){
		if RandomButton == 0{
			
			Answer0Button.setTitle("\(answer)", for: UIControlState())
			Answer1Button.setTitle("\(incorrectAnswer1)", for: UIControlState())
			Answer2Button.setTitle("\(incorrectAnswer2)", for: UIControlState())
			Answer3Button.setTitle("\(incorrectAnswer3)", for: UIControlState())
			
		}
		if RandomButton == 1{
			
			Answer1Button.setTitle("\(answer)", for: UIControlState())
			Answer0Button.setTitle("\(incorrectAnswer1)", for: UIControlState())
			Answer2Button.setTitle("\(incorrectAnswer2)", for: UIControlState())
			Answer3Button.setTitle("\(incorrectAnswer3)", for: UIControlState())
			
		}
		if RandomButton == 2{
			
			Answer2Button.setTitle("\(answer)", for: UIControlState())
			Answer1Button.setTitle("\(incorrectAnswer3)", for: UIControlState())
			Answer0Button.setTitle("\(incorrectAnswer2)", for: UIControlState())
			Answer3Button.setTitle("\(incorrectAnswer1)", for: UIControlState())
			
		}
		if RandomButton == 3{
			
			Answer3Button.setTitle("\(answer)", for: UIControlState())
			Answer1Button.setTitle("\(incorrectAnswer1)", for: UIControlState())
			Answer2Button.setTitle("\(incorrectAnswer2)", for: UIControlState())
			Answer0Button.setTitle("\(incorrectAnswer3)", for: UIControlState())
			
		}
		
	}
	
	@IBAction func Answer0Action(_ sender: UIButton) {
		if RandomButton == 0{
			button0correct()
		}
		else if RandomButton != 0{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	@IBAction func Answer1Action(_ sender: UIButton) {
		if RandomButton == 1{
			button1correct()
		}
		else if RandomButton != 1{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	@IBAction func Answer2Action(_ sender: UIButton) {
		if RandomButton == 2{
			button2correct()
		}
		else if RandomButton != 2{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	
	@IBAction func Answer3Action(_ sender: UIButton) {
		if RandomButton == 3{
			button3correct()
		}
		else if RandomButton != 3{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	func button0correct(){
		checkingForCorrectAnswer()
	}
	func button1correct(){
		checkingForCorrectAnswer()
	}
	
	func button2correct(){
		checkingForCorrectAnswer()
	}
	func button3correct(){
		checkingForCorrectAnswer()
	}
	func gotincorrectAnswer(){
		correctIncorrect = "Incorrect"
	}
	func checkingForCorrectAnswer(){
		correctTotal = correctTotal + 1
		correctIncorrect = "Correct"
		//		playSound()
	}
	
	func showCorrectIncorrect(){
		CorrectTotalLabel.text = "Total Correct: \(correctTotal)"
		CorrectIncorrectLabel.text = "\(correctIncorrect)"
	}
	
	@IBAction func ResetAction(_ sender: UIButton) {
		correctTotal = 0
		CorrectTotalLabel.text = "Total Correct: \(correctTotal)"
        CorrectIncorrectLabel.text = ""
	}
	//add sound to correct answers:
	
	//	var player: AVAudioPlayer?
	//	func playSound(){
	//		guard let url = Bundle.main.url(forResource: "Ding", withExtension: "m4a") else {
	//			print("not playing")
	//			return
	//		}
	//		do {
	
	//			try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
	//			try! AVAudioSession.sharedInstance().setActive(true)
	//			player = try! AVAudioPlayer.init(contentsOf: url, fileTypeHint: AVFileTypeMPEG4)
	//			player!.play()
	//		} catch let error as NSError{
	//			print ("error: \(error.localizedDescription)")
	//		}
	//	}
}

