//
//  HttpDownloader.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPDownloader: NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDownloadDelegate, UIDocumentInteractionControllerDelegate {
    var url: URL?
    
    let viewController: UIViewController
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
//    MARK: - Delegates
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        print("\(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite))")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let originalURL = downloadTask.originalRequest?.url
        
        saveToDocuments(originalURL, downloadLocation: location)
        presentDocument(documentsURLforFileRequest(originalURL!))
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return viewController
    }
    
// MARK: Functionalities
    
    func download(_ url: URL){
        
        let fileManager = FileManager.default
        let fileURL     = documentsURLforFileRequest(url)
        
        if let fileURL = fileURL {
            let filePath = fileURL.path
    
            if fileManager.fileExists(atPath: filePath) {
                presentDocument(fileURL)
            }
            else {
                let request = URLRequest(url: url)
                let sessionConfig = URLSessionConfiguration.background(withIdentifier: UUID().uuidString)
                let session = Foundation.URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
                
                let task = session.downloadTask(with: request)
                task.resume()

                makeDownloadToast()
            }
        }
    }

//  MARK: Private Helpers
    
    func makeDownloadToast() {
        DispatchQueue.main.async(execute: { () -> Void in
        
            let toast = EKToast(message: "Downloading...")
            toast?.delay = 4.0
            toast?.shouldAutoDestruct = true
            toast?.position = ToastPositionTop
            toast?.show(nil)
        })
    }
    
    fileprivate func saveToDocuments(_ originalURL: URL?, downloadLocation: URL){
        if let originalURL = originalURL, let destinationURL = documentsURLforFileRequest(originalURL){
            do {
                let fileManager = FileManager.default
                try fileManager.copyItem(at: downloadLocation, to: destinationURL)
            }
            catch let error {
                print (error)
            }
        }
    }
    
    fileprivate func presentDocument(_ documentURL:URL?) {
        if let documentURL = documentURL {
            let documentController = UIDocumentInteractionController(url: documentURL)
            
            DispatchQueue.main.async(execute: { () -> Void in
                documentController.delegate = self
                documentController.presentPreview(animated: true)
            })
        }
    }

    fileprivate func documentsURLforFileRequest(_ originalURL: URL) -> URL? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsURL = urls.last
        
        return documentsURL?.appendingPathComponent((originalURL.lastPathComponent))
    }

}
