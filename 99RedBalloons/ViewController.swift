//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Rehan Mahmood on 5/31/15.
//  Copyright (c) 2015 Sysnet Managed Services, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //begin properties
    @IBOutlet weak var balloonNumberLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!

    //First create an array for Balloon structs
    var balloonArray:[Balloon] = []
    var currentIndexOfArray = 0 //create an index variable for the array and initialize it to 0
    //end properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createBalloon()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
      let balloon = balloonArray[currentIndexOfArray]
        balloonNumberLabel.text = "\(balloon.number)  Balloons"
        myImageView.image = balloon.image
        currentIndexOfArray += 1
    }
    
    func createBalloon(){
        for var balloonCount = 0; balloonCount <= 99;  ++balloonCount {
            var balloon = Balloon()
            balloon.number = balloonCount
            let randomNumberInt = Int(arc4random_uniform(UInt32(4)))
            switch randomNumberInt {
            case 1: balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2: balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3: balloon.image = UIImage(named: "RedBalloon3.jpg")
            default: balloon.image = UIImage(named: "RedBalloon4.jpg")

            }
            self.balloonArray.append(balloon)
        }
    }

}

//struct will have a number and an image
//create 99 instances of the struct and store in an array
//different number randomly assign