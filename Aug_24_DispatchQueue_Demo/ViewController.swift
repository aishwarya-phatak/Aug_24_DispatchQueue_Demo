//
//  ViewController.swift
//  Aug_24_DispatchQueue_Demo
//
//  Created by Vishal Jagtap on 26/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serialQueue()
//        concurrentQueue()
    }
    
    func serialQueue(){
        
        let serialQueue = DispatchQueue(label: "Serial Queue")
        serialQueue.sync {
            
            for i in 1...1000{
                print("Task 1 is getting executed -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority()) -- \(Thread.description()) -- \(Thread.version())")
            }
        }
        
//        serialQueue.async {
//            for i in 1...500000{
//                print("Task 2 is getting executed -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority()) -- \(Thread.description()) -- \(Thread.version())")
//            }
//        }
        
        print("Task 10 ------- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority()) -- \(Thread.description()) -- \(Thread.version())")
        
        serialQueue.async {
            for i in 1...100{
                print("Task 3 is getting executed -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority()) -- \(Thread.description()) -- \(Thread.version())")
            }
        }
        
//        serialQueue.async {
//            for i in 1...5000{
//                print("Task 4 is getting executed -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority()) -- \(Thread.description()) -- \(Thread.version())")
//            }
//        }
    }
    
    func concurrentQueue(){
        
        
        
        
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        let svc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        navigationController?.pushViewController(svc, animated: true)
    }
}
