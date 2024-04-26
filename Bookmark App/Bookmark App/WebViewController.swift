//
//  WebViewController.swift
//  BookmarkAppUIKit
//
//  Created by Azamat Kenjebayev on 4/19/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var url: URL?
    private var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
