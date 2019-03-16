//
//  DocumentViewController.swift
//  string-extensions-demo
//
//  Created by Huy Duong on 6/19/18.
//  Copyright © 2018 Huy Duong. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    // MARK: - IBOUTLET
    
    /**
     * Outlet from Storyboard
     */
    @IBOutlet weak var markdownView: MarkdownView!
    
    
    
    // MARK: - LOCAL VARIABLES
    
    /**
     * Instance variables
     */
    var stringExtensions: StringExtensions?
    
    
    
    // MARK: - CONTROLLER LIFE CYCLE
    
    /**
     * Called after the view has been loaded.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDocumentContent()
    }

    
    
    // MARK: - IBACTION
    
    /**
     * Go to home screen (string extension list)
     */
    @IBAction func homeButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    // MARK: - VIEWCONTROLLER HELPER MEDTHODS
    
    /**
     * Showing document content (markdown formmat)
     */
    func showDocumentContent() {
        
        guard let stringExtensions = stringExtensions else {
            return
        }
        
        do {
            
            if let path = Bundle.main.path(forResource: stringExtensions.document, ofType: "md") {
                let url: URL = URL(fileURLWithPath: path)
                let markdown = try String(contentsOf: url, encoding: String.Encoding.utf8)
                self.markdownView.load(markdown: markdown, enableImage: true)
            }
            
        } catch let error {
            
            print("Error: \(error)")
            
        }
        
        
    }
    

}













