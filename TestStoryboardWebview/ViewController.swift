//
//  ViewController.swift
//  TestStoryboardWebview
//
//  Created by TorIsHere on 22/3/2564 BE.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var constantWebviewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let htmlString = """
                                               <!DOCTYPE html>
                                               <html>
                                               <body>

                                               <h1>My First Heading</h1>

                                               <p style="font-size: 32px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae purus faucibus ornare suspendisse sed nisi lacus. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et netus. Mattis vulputate enim nulla aliquet porttitor lacus luctus. Morbi tristique senectus et netus et malesuada fames ac turpis. Ornare arcu odio ut sem. Venenatis lectus magna fringilla urna porttitor rhoncus dolor. Ut sem viverra aliquet eget. Vestibulum rhoncus est pellentesque elit ullamcorper. Convallis posuere morbi leo urna molestie at elementum. Elit pellentesque habitant morbi tristique senectus et. Integer malesuada nunc vel risus. Sed cras ornare arcu dui vivamus arcu felis bibendum ut. Quis hendrerit dolor magna eget est lorem ipsum dolor. A pellentesque sit amet porttitor eget dolor morbi. Praesent elementum facilisis leo vel fringilla. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est. Etiam non quam lacus suspendisse faucibus interdum posuere.
                               
                                               Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae purus faucibus ornare suspendisse sed nisi lacus. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et netus. Mattis vulputate enim nulla aliquet porttitor lacus luctus. Morbi tristique senectus et netus et malesuada fames ac turpis. Ornare arcu odio ut sem. Venenatis lectus magna fringilla urna porttitor rhoncus dolor. Ut sem viverra aliquet eget. Vestibulum rhoncus est pellentesque elit ullamcorper. Convallis posuere morbi leo urna molestie at elementum. Elit pellentesque habitant morbi tristique senectus et. Integer malesuada nunc vel risus. Sed cras ornare arcu dui vivamus arcu felis bibendum ut. Quis hendrerit dolor magna eget est lorem ipsum dolor. A pellentesque sit amet porttitor eget dolor morbi. Praesent elementum facilisis leo vel fringilla. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est. Etiam non quam lacus suspendisse faucibus interdum posuere.
                                               Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae purus faucibus ornare suspendisse sed nisi lacus. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et netus. Mattis vulputate enim nulla aliquet porttitor lacus luctus. Morbi tristique senectus et netus et malesuada fames ac turpis. Ornare arcu odio ut sem. Venenatis lectus magna fringilla urna porttitor rhoncus dolor. Ut sem viverra aliquet eget. Vestibulum rhoncus est pellentesque elit ullamcorper. Convallis posuere morbi leo urna molestie at elementum. Elit pellentesque habitant morbi tristique senectus et. Integer malesuada nunc vel risus. Sed cras ornare arcu dui vivamus arcu felis bibendum ut. Quis hendrerit dolor magna eget est lorem ipsum dolor. A pellentesque sit amet porttitor eget dolor morbi. Praesent elementum facilisis leo vel fringilla. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est. Etiam non quam lacus suspendisse faucibus interdum posuere.
                               Eleifend mi in nulla posuere sollicitudin aliquam ultrices. Tincidunt tortor aliquam nulla facilisi. Lectus proin nibh nisl condimentum id. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Eu feugiat pretium nibh ipsum consequat nisl vel. Amet tellus cras adipiscing enim eu. Lorem ipsum dolor sit amet. Urna porttitor rhoncus dolor purus non enim praesent elementum. Enim diam vulputate ut pharetra sit amet aliquam id. Porttitor lacus luctus accumsan tortor posuere ac. Id velit ut tortor pretium viverra suspendisse potenti nullam. Sit amet volutpat consequat mauris nunc. Neque aliquam vestibulum morbi blandit cursus risus at ultrices mi. Tincidunt tortor aliquam nulla facilisi. Ut consequat semper viverra nam libero justo. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien. A diam sollicitudin tempor id eu. Tempus iaculis urna id volutpat lacus laoreet non curabitur. Pulvinar elementum integer enim neque.</p>

                                               </body>
                                               </html>
                    """
        
        self.webview.scrollView.bounces = false
        
        self.webview.sizeToFit()
        self.webview.scrollView.isScrollEnabled = false
        
        self.webview.navigationDelegate = self
        self.loadingIndicator.startAnimating()
        self.myScrollView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.webview.loadHTMLString(htmlString, baseURL: nil)
        }
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.constantWebviewHeight.constant = webView.scrollView.contentSize.height
            self.myScrollView.isHidden = false
            self.loadingIndicator.isHidden = true
            self.view.layoutSubviews()
        }
    }
    
//    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        guard navigationType == .Other else { return true }
//        if let url = request.URL, let host = url.host {
//            guard url.scheme == "ready" else { return true }
//            if let contentHeight = Float(host) {
//                yourScrollView.contentSize = CGSizeMake(yourScrollView.bounds.size.width, CGFloat(contentHeight))
//                var fr = webView.frame
//                fr.size = CGSizeMake(fr.size.width, CGFloat(contentHeight))
//                webView.frame = fr
//            }
//
//            return false
//        }
//
//        return true
//    }

}

