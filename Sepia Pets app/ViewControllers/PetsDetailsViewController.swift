//
//  PetsDetailsViewController.swift
//  Sepia Pets app
//
//  Created by Vishal Kamble on 18/02/23.
//

import UIKit
import WebKit

class PetsDetailsViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var petData:Pet?
      override func viewDidLoad() {
         super.viewDidLoad()
          DispatchQueue.main.async {
              let myURL = URL(string: self.petData?.contentURL ?? "")
             let myRequest = URLRequest(url: myURL!)
              self.webView.load(myRequest)
          }
          
      }
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            webView.allowsBackForwardNavigationGestures = true
            view = webView
    }

}
