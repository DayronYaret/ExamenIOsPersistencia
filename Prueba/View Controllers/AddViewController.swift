//
//  AddViewController.swift
//  Prueba
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var surnameInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var cvInput: UITextField!
    @IBOutlet weak var jobInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var dniInput: UITextField!

    var addModel = AddModel()
    var name:String = ""
    var surname:String = ""
    var dni:String = ""
    var age:String = ""
    var job:String = ""
    var cv:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        errorLabel.alpha = 0


    }
    

    @IBAction func addButton(_ sender: Any) {
        name = nameInput.text!
        surname = surnameInput.text!
        dni = dniInput.text!
        age = ageInput.text!
        job = jobInput.text!
        cv = cvInput.text!
        addModel.validateFields(name: name, surname: surname, dni: dni, age: age, job: job, cv: cv) { (error, String) in
            if(!error){
                self.addModel.addPerson(name: self.name, surname: self.surname, dni: self.dni, age: self.age, job: self.job, cv: self.cv) { (error) in
                    if(!error){
                        let navBar = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.navController) as? UINavigationController
                                         
                           self.view.window?.rootViewController = navBar
                           self.view.window?.makeKeyAndVisible()
                    }else{
                        self.errorLabel.text = "An error has ocurred"
                        self.errorLabel.alpha = 1
                    }
                }
            }else{
                self.errorLabel.text = String
                self.errorLabel.alpha = 1
            }
        }
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
