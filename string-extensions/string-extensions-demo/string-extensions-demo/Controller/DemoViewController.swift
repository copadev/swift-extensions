//
//  DemoViewController.swift
//  string-extensions-demo
//
//  Created by Seasoft on 6/18/18.
//  Copyright © 2018 Huy Duong. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    class var identifier: String { return String.className(self) }
    
    // MARK: - IBOUTLET
    
    /**
     * Outlet from Storyboard
     */
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var demoButton: UIButton!
    @IBOutlet weak var parameterAdjustmentButton: UIButton!
    @IBOutlet weak var resultTextView: UITextView!
    
    
    
    // MARK: - LOCAL VARIABLES
    
    /**
     * Instance variables
     */
    var stringExtensions: StringExtensions?
    var parameterCustom: [Parameter]?
    
    
    
    // MARK: - CONTROLLER LIFE CYCLE
    
    /**
     * Called after the view has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSetup()
    }
    
    
    
    // MARK: - IBACTION
    
    /**
     * Show document view controller action
     */
    @IBAction func documentButtonAction(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToDocumentVC", sender: nil)
    }
    
    
    /**
     * Generate input text for demo action
     */
    @IBAction func generateTextButtonAction(_ sender: UIButton) {
        self.generateInputTextAction()
    }
    
    
    /**
     * Custom parameter
     */
    @IBAction func parameterAdjustmentButtonAction(_ sender: UIButton) {
        self.customParameterInput()
    }
    
    
    /**
     * Show demo function result action
     */
    @IBAction func demoButtonAction(_ sender: UIButton) {
        self.performingDemoAction()
    }
    
    
    
    // MARK: - VIEWCONTROLLER HELPER MEDTHODS
    
    /**
     * Init setup
     */
    func initSetup() {
        
        // Hiding keyboard when user tapping outside textview
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        // Edit parameter button
        self.parameterAdjustmentButton.isHidden = (self.stringExtensions?.parameter == nil) ? true : false
        
        // Load parameter to local variable
        if let parameter = self.stringExtensions?.parameter {
            self.parameterCustom = parameter
            for (index, _) in parameter.enumerated() {
                self.parameterCustom![index].value = nil
            }
        }
        
    }
    
    
    /**
     * Generate input text for the demo
     */
    func generateInputTextAction() {
        
        guard let stringExtensions = stringExtensions else {
            return
        }
        
        // Input text
        self.inputTextView.text = stringExtensions.inputDemo
        
        // Parameter
        if let parameter = self.stringExtensions?.parameter {
            self.parameterCustom = parameter
        }

    }
    
    
    /**
     * Parameter adjustment
     */
    func customParameterInput() {
        
        guard let parameter = self.parameterCustom, parameter.count > 0 else {
            self.resultTextView.text = "No custom parameter available..."
            return
        }
        
        let alertController = UIAlertController(title: "Parameters Adjustment",
                                                message: "You can customize your parameter here!!!",
                                                preferredStyle: .alert)
        
        for param in parameter {
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.text = param.value
                textField.placeholder = param.placeholder
                textField.keyboardType = (param.dataType == .number) ? .decimalPad : .default
            }
        }
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { alert -> Void in
                                        guard let textFields = alertController.textFields else { return }
                                        for (index, textField) in textFields.enumerated() {
                                            self.parameterCustom![index].value = textField.text
                                        }
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    /**
     * Showing the demo result
     */
    func performingDemoAction() {
        
        guard let stringExtensions = stringExtensions else {
            return
        }
        
        guard let inputText = self.inputTextView.text else {
            self.resultTextView.text = AppText.noInputTextDemoError
            return
        }
        
        self.resultTextView.text = stringExtensions.outputDemoOf(inputText, parameterCustom)
        
    }
    
    
    /**
     * Notifies the view controller that a segue is about to be performed.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "goToDocumentVC",
            let destinationVC = segue.destination as? DocumentViewController else {
                return
        }
        
        destinationVC.stringExtensions = stringExtensions
        
    }
    
}





















