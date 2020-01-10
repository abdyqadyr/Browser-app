 //
//  InfoVC.swift
//  Browser
//
//  Created by Abdykadyr Maksat on 10/4/19.
//  Copyright © 2019 Abdykadyr Maksat. All rights reserved.
//

import UIKit
import WebKit
class InfoVC: UIViewController {

    @IBOutlet var tap: UITapGestureRecognizer!
    var fav:Bool = false
    
    @IBAction func tapAction(_ sender: Any) {
        if !fav{
            fav=true
            self.view.backgroundColor = .yellow
        }else{
            fav=false
            self.view.backgroundColor = .purple
        }
    }
    @IBOutlet weak var webView: WKWebView!
    var url:URL?{
        didSet{
            if webView != nil{
                updateUI()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tap.numberOfTapsRequired = 3
        updateUI()

    }
    func updateUI(){
        if url != nil{
            let urlRequest :URLRequest = URLRequest(url: url!)
            webView.load(urlRequest)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="kek"{
            if let destination = segue.destination as? WebsitesVC{
                
            }
        }
    }
  

}
