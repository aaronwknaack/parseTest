//
//  ViewController.swift
//  back-endTest
//
//  Created by Aaron Knaack on 11/5/15.
//  Copyright © 2015 Aaron Knaack. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    //Created array variables to store all data from each object in the trivia class from back-end
    var question:[String] = [String]();
    var ans2:[String] = [String]();
    var ans3:[String] = [String]();
    var correctAns:[String] = [String]();

   override func viewDidLoad() {
       super.viewDidLoad()
    
    //Retrieve trivia objects from Parse
    self.retrieveTrivia()
    
    }

    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        func retrieveTrivia() {
            
            //create new pfQuery - This is the bridge between our app and Parse: "trivia" is our class name on Parse
            let queryTrivia:PFQuery = PFQuery(className:"trivia")
            
            //This method gives access to all objects in "trivia" class using our queryTrivia Bridge
            queryTrivia.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
                
                // Loop through the objects array
                for triviaObject in objects!{
                    
                    // Retrieve data for each object (question, ans2, ans3, correctAns)
                    let triviaQuestion:String? = (triviaObject as PFObject)["question"] as? String
                    let triviaAns2:String? = (triviaObject as PFObject)["ans2"] as? String
                    let triviaAns3:String? = (triviaObject as PFObject)["ans3"] as? String
                    let triviaAns:String? = (triviaObject as PFObject)["correctAns"] as? String
                    
                    // Assign to arrays
                    if triviaQuestion != nil {
                        self.question.append(triviaQuestion!)
                    }
                    if triviaAns2 != nil {
                        self.ans2.append(triviaAns2!)
                    }
                    if triviaAns3 != nil {
                        self.ans3.append(triviaAns3!)
                    }
                    if triviaAns != nil {
                        self.correctAns.append(triviaAns!)
                    }
                    
                }
                
                
                //This is to check that data has been succesfully transfered
                //Print all Data in order stored in our question array
                print("Questions in order as they are stored:")
                for element in self.question{
                    print(element)
                }
                
                print(" ")
                print("Correct Ansers in order as they are stored:")
                
                //Print all Data in order stored in our correctAns array
                for element in self.correctAns{
                    print(element)
                }
                //The first of the list printed from question should correspond to the
                //first item in the second list, and the 2nd match to the 2nd, so forth.
                
            }
            
        }



}