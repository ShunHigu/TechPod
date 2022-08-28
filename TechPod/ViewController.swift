//
//  ViewController.swift
//  TechPod
//
//  Created by 日暮駿之介 on 2022/08/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table:UITableView!
    
    var songNameArray=[String]()
    
    var fileNameArray=[String]()
    
    var imageNameArray=[String]()
    
    var audioplayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource=self
        
        table.delegate=self
        
        songNameArray=["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray=["cannon","elise","aria"]
        
        imageNameArray=["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"Cell")
        
        cell?.textLabel?.text=songNameArray[indexPath.row]
        
        cell?.imageView?.image=UIImage(named:imageNameArray[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        let audioPath=URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioplayer=try?AVAudioPlayer(contentsOf:audioPath)
        
        audioplayer.play()
    }


}

