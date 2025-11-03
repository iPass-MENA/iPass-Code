////
////  ViewController.swift
////  SdkSkelton
////
////  Created by MOBILE on 12/06/24.
////
//
//import UIKit
//import iPass2_0NativeiOS
//import CoreNFC
//
//
//extension ViewController : iPassSDKManagerDelegate {
//
//    func getScanCompletionResult(result: String, transactionId: String, error: String) {
//        print(result)
//        print(transactionId)
//        print(error)
//        if(error == "") {
//            LocalDataHanlder.shared.scannedJsonResponse = result
//            LocalDataHanlder.shared.scannedTransactionId = transactionId
//            DispatchQueue.main.async {
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScannedDataViewController") as! ScannedDataViewController
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//           
//        }
//        else {
//            DispatchQueue.main.async {
//                let alertController = UIAlertController(title: transactionId, message: error, preferredStyle: .alert)
//                       
//                       // Step 3: Add actions
//                       let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
//                           // Handle the OK button tap if needed
//                           print("OK button tapped")
//                       }
//                       alertController.addAction(okAction)
//                       
//                       // Optionally, add more actions if needed
//                       // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//                       // alertController.addAction(cancelAction)
//                       
//                       // Step 4: Present the alert
//                       self.present(alertController, animated: true, completion: nil)
//            }
//            
//            
//          
//        }
//    }
//}
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NFCNDEFReaderSessionDelegate {
//
//    @IBOutlet weak var flowsTableView: UITableView!
//    let loadingView = LoadingView()
//    var dataDict: [[String: Any]] = []
//    
//    
//    
//    
//    
////    
//    var appToken1 = "eyJhbGciOiJIUzI1NiJ9.aXBhc3Ntb2Jpb3NAeW9wbWFpbC5jb21CaWtyYW0gc2luZ2ggICBjYjg5N2FlNC0wZDg2LTQzZmEtYmZhYy1hZjM0ZTFjOTFkMDM.C-BLHVUeW2nlFWgJGMCJV-w4PcSzq85r81X6bQuzE80"
//    var emailStr = "ipassmobios@yopmail.com"
//    var passwordStr  =  "Admin@123#"
//    
//    
//    
////    var appToken1 = "eyJhbGciOiJIUzI1NiJ9.dGVzdHdlYmhvb2tpcGFzc0B5b3BtYWlsLmNvbUFqYXkgS3VtYXIgICA1ZDBmMTQ5Yi1jM2ZlLTRlYTUtOGY2ZC1lZmU4NzM2MDg0OTE.Mgl6wdtfkMt3niHgbeRk7RYlB-QflCa69u8U3re1tDo"
////    var emailStr = "testwebhookipass@yopmail.com"
////    var passwordStr  =  "Admin@123#"
//    
//
//    
//    
//    var nfcSession: NFCNDEFReaderSession?
//    
//   // var userToken = String()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        handleUIData()
//        flowsTableView.register(UINib(nibName: "FlowsTableViewCell", bundle: nil), forCellReuseIdentifier: "FlowsTableViewCell")
//       
//    }
//    
//
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        if(DataManager.shared.processCompleted == true) {
//            return
//        }
//        
//        DispatchQueue.main.async {
//            self.loadingView.show(in: self.view)
//            self.loadingView.updateProgress("")
//        }
//        
//        
//        configProperties.setLoaderColor(color: .purple)
//        configProperties.needHologramDetection(value: true)
//        
//        DataBaseDownloading.initialization(dbType: DataBaseDownloading.availableDataSources.fullAuth, completion:{status, error in
//            print(status, error)
//            if(status == "Start Now") {
//               
//                iPassSDKManger.UserOnboardingProcess(email: self.emailStr, password: self.passwordStr) { status, tokenString in
//                  //  print(tokenString)
//                    DispatchQueue.main.async {
//                        self.loadingView.hide()
//                        if(status == true) {
//                            DataManager.shared.processCompleted = true 
//                            DataManager.shared.userLoginToken = tokenString!
//                           // self.userToken = tokenString!
//                            
//                        }
//                    }
//                }
//            }
//        })
//    }
//    
//    
//    
//    
//    func handleUIData() {
//        let flow1: [String: Any] = ["title": "Full Processing", "subtitle": "This flow includes Document Scanning, Document Authenticity, User Liveness, User Face Matching, AML and social media verification", "image": "flow1.png"]
//        let flow2: [String: String] = ["title": "IDV + Liveness + AML", "subtitle": "This flow includes Document Scanning, Document Authenticity, User Liveness, User Face Matching and AML check", "image": "flow2.png"]
//        let flow3: [String: String] = ["title": "IDV + AML", "subtitle": "This flow includes Document Scanning, Document Authenticity and AML check", "image": "flow3.png"]
//        let flow4: [String: String] = ["title": "IDV + Liveness ", "subtitle": "This flow includes Document Scanning, Document Authenticity, User Liveness and User Face Matching", "image": "flow4.png"]
//       
//        dataDict.append(flow1)
//        dataDict.append(flow2)
//        dataDict.append(flow3)
//        dataDict.append(flow4)
//        
//    }
//    
//    // 553c6d85-bfbd-4b61-8d19-d407c091c68e
//     //597b482f-4d44-42be-a9ce-a40cdaa1fc1a
////        2261b84f-090e-441f-a5ca-31ba1c71ca25
////        i267130117OSrAIf7kaLaV2024-06-1412-3410031
//   //  i277845013OSUrFRcPxGhD2024-06-2611-0810015
//     //i38195208OSIhC80SEIbD2024-06-2611-0710011
//     // 262a6a13-12b8-4cd6-8296-af7df38df52b
//     //i330904380OS8KwSw84n9u2024-06-2613-4710011
//     //i925336646OSSI0ki3x5TD2024-06-2719-2110031
////        iPassSDKManger.delegate = self
////        iPassSDKManger.fetchTransaction(transactionId: "i267130117OSrAIf7kaLaV2024-06-1412-3410031", controller: self, appToken: self.appToken1 )
//     
//     
//   //  iPassSDKManger.addLivenessInfoView(ctrl: self)
//    
//    func startDocScanner (_ flowNumber: Int)  {
//      
//        
//        Task { @MainActor in
//            iPassSDKManger.delegate = self
//            await iPassSDKManger.startScanningProcess(userEmail: emailStr, flowId: flowNumber,
//                                                socialMediaEmail :"bikram4127@gmail.com", phoneNumber : "+919781986132", controller: self, userToken: DataManager.shared.userLoginToken, appToken: self.appToken1 )
//            
//            
//            
//           // await iPassSDKManger.addLivenessInfoView()
//            
//        }
//        
//        
//       
//    }
//    
//    func fetchPublicIPAddress22(completion: @escaping (String?) -> Void) {
//        let url = URL(string: "https://api.ipify.org?format=json")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching public IP address: \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//            
//            guard let data = data else {
//                print("No data received.")
//                completion(nil)
//                return
//            }
//            
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                   let ipAddress = json["ip"] as? String {
//                    completion(ipAddress)
//                } else {
//                    print("Invalid JSON format.")
//                    completion(nil)
//                }
//            } catch {
//                print("Error parsing JSON: \(error.localizedDescription)")
//                completion(nil)
//            }
//        }
//        
//        task.resume()
//    }
//
//    
//    
//    func fetchPublicIPAddress(completion: @escaping (String?) -> Void) {
//        let url = URL(string: "https://api.ipify.org?format=json")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error fetching public IP address: \(error?.localizedDescription ?? "Unknown error")")
//                completion(nil)
//                return
//            }
//            
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                   let ipAddress = json["ip"] as? String {
//                    completion(ipAddress)
//                } else {
//                    completion(nil)
//                }
//            } catch {
//                print("Error parsing JSON: \(error.localizedDescription)")
//                completion(nil)
//            }
//        }
//        
//        task.resume()
//    }
//    
//     func getIPAddress22() -> String? {
//        var address : String?
//
//        // Get list of all interfaces on the local machine:
//        var ifaddr : UnsafeMutablePointer<ifaddrs>?
//        guard getifaddrs(&ifaddr) == 0 else { return nil }
//        guard let firstAddr = ifaddr else { return nil }
//
//        // For each interface ...
//        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
//            let interface = ifptr.pointee
//
//            // Check for IPv4 or IPv6 interface:
//            let addrFamily = interface.ifa_addr.pointee.sa_family
//            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
//
//                // Check interface name:
//                // wifi = ["en0"]
//                // wired = ["en2", "en3", "en4"]
//                // cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]
//                
//                let name = String(cString: interface.ifa_name)
//                if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3" {
//
//                    // Convert interface address to a human readable string:
//                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
//                                &hostname, socklen_t(hostname.count),
//                                nil, socklen_t(0), NI_NUMERICHOST)
//                    address = String(cString: hostname)
//                }
//            }
//        }
//        freeifaddrs(ifaddr)
//
//        return address
//    }
//    
//    func getIPAddress() -> String? {
//        var address: String?
//        
//        // Get list of all interfaces on the device
//        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
//        guard getifaddrs(&ifaddr) == 0 else { return nil }
//        guard let firstAddr = ifaddr else { return nil }
//        
//        // Iterate through the list of interfaces
//        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
//            let interface = ptr.pointee
//            
//            // Check for IPv4 or IPv6 interfaces
//            let addrFamily = interface.ifa_addr.pointee.sa_family
//            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
//                // Get interface name
//                let name = String(cString: interface.ifa_name)
//                
//                // Only consider Wi-Fi or cellular interfaces
//                if name == "en0" || name == "pdp_ip0" {
//                    // Convert interface address to a human-readable string
//                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//                    var addr = interface.ifa_addr.pointee
//                    if (getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len),
//                                    &hostname, socklen_t(hostname.count),
//                                    nil, socklen_t(0), NI_NUMERICHOST) == 0) {
//                        address = String(cString: hostname)
//                    }
//                }
//            }
//        }
//        
//        freeifaddrs(ifaddr)
//        return address
//    }
//    
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return dataDict.count
//        }
//
//        
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "FlowsTableViewCell", for: indexPath) as! FlowsTableViewCell
//        
//        let flowData: [String: Any] = dataDict[indexPath.row]
//        cell.title.text = flowData["title"] as? String
//        cell.subtitle.text = flowData["subtitle"] as? String
//        cell.flowImage.image = UIImage(named: (flowData["image"] as? String)!)
//        
//      
//
//            return cell
//        }
//    
//    
//    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
//            if let nfcError = error as? NFCReaderError {
//                switch nfcError.code {
//                case .readerSessionInvalidationErrorUserCanceled:
//                    print("User canceled the session.")
//                case .readerSessionInvalidationErrorSessionTimeout:
//                    print("Session timeout.")
//                default:
//                    print("Other error: \(nfcError.localizedDescription)")
//                }
//            } else {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//
//    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
//        print("NFC Reader session became active")
//    }
//    
//    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
//        for message in messages {
//            for record in message.records {
//                print("NFC Tag payload------: \(record)")
//                if let payload = String(data: record.payload, encoding: .utf8) {
//                    print("NFC Tag payload: \(payload)")
//                }
//            }
//        }
//    }
//    
//
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
////        
////        if let ipAddress = getIPAddress() {
////            print("IP Address 1: \(ipAddress)")
////        } else {
////            print("Unable to get IP Address")
////        }
////        
////        if let ipAddressww = getIPAddress22() {
////            print("IP Address 2: \(ipAddressww)")
////        } else {
////            print("Unable to get IP Address22")
////        }
////        
////     
////        
////        fetchPublicIPAddress { ipAddress in
////            if let ipAddress = ipAddress {
////                print("IP Address 3 \(ipAddress)")
////            } else {
////                print("Unable to fetch public IP Address")
////            }
////        }
////        
////        
////        fetchPublicIPAddress22 { ipAddress in
////            if let ipAddress = ipAddress {
////                print("Public IP Address 4 : \(ipAddress)")
////            } else {
////                print("Unable to fetch public IP Addressr")
////            }
////        }
//        
//     
//        let flowData: [String: Any] = dataDict[indexPath.row]
//       
//        if(indexPath.row == 0) {
//            DataManager.shared.selectedFlowCode = 10031
//             startDocScanner(10031)
////            guard NFCNDEFReaderSession.readingAvailable else {
////                       print("NFC is not available on this device")
////                       return
////                   }
////
////                   nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
////                   nfcSession?.alertMessage = "Hold your iPhone near the NFC tag."
////                   nfcSession?.begin()
//            
//        }
//        else if(indexPath.row == 1) {
//            DataManager.shared.selectedFlowCode = 10032
//             startDocScanner(10032)
//        }
//        else if(indexPath.row == 2) {
//            DataManager.shared.selectedFlowCode = 10015
//             startDocScanner(10015)
//        }
//        else {
//            DataManager.shared.selectedFlowCode = 10011
//             startDocScanner(10011)
//        }
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//



//
//  ViewController.swift
//  SdkSkelton
//
//  Created by MOBILE on 12/06/24.
//

import UIKit
import iPass2_0NativeiOS
import CoreNFC
import AVFoundation
import Network

extension ViewController : iPassSDKManagerDelegate {

    func getScanCompletionResult(result: String, transactionId: String, error: String) {
        print("-----ABCDEF----")
        print("result",result)
        print("transactionId",transactionId)
        print("error",error)
        self.loadingView.hide()
        if(error == "") {
            LocalDataHanlder.shared.scannedJsonResponse = result
            LocalDataHanlder.shared.scannedTransactionId = transactionId
            DispatchQueue.main.async {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScannedDataViewController") as! ScannedDataViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else {
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: transactionId, message: error, preferredStyle: .alert)
                       
                       // Step 3: Add actions
                       let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                           // Handle the OK button tap if needed
                           print("OK button tapped")
                       }
                       alertController.addAction(okAction)
                       
                       // Optionally, add more actions if needed
                       // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                       // alertController.addAction(cancelAction)
                       
                       // Step 4: Present the alert
                       self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NFCNDEFReaderSessionDelegate {

    @IBOutlet weak var flowsTableView: UITableView!
    let loadingView = LoadingView()
    var dataDict: [[String: Any]] = []
    

    var appToken1 = "eyJhbGciOiJIUzI1NiJ9.bW9idGVzdDEyM0B5b3BtYWlsLmNvbXRlc3QgYXBpJ3MgICAzNDMzYWZlZC0zNWZkLTQ3MGMtOTNlYy1lYjBjN2I1Y2VlZjI.2XbfGso6YVZ5xhbM74Ye1NnOzPvKSCv20ceT9GzR3HQ"
    var emailStr = "mobtest123@yopmail.com"
    var passwordStr  =  "Admin@123#"
   
    
    
    
    var nfcSession: NFCNDEFReaderSession?
    
   // var userToken = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        handleUIData()
        flowsTableView.register(UINib(nibName: "FlowsTableViewCell", bundle: nil), forCellReuseIdentifier: "FlowsTableViewCell")
       
    }
    

    
    
    
    func callOnlineDataBase() {
        //DataManager.shared.userLoginToken = ""
        if(DataManager.shared.processCompleted == true) {
            return
        }
        
        DispatchQueue.main.async {
            self.loadingView.show(in: self.view)
            self.loadingView.updateProgress("")
        }
        iPassSDKManger.delegate = self
       //http://192.168.11.27:4088/api/v1/ipass/create/authenticate/login
       // https://staging.ipass-mena.com/stagapi
        DataBaseDownloading.initializeDynamicDb(serverUrl: "https://plusapi.ipass-mena.com", completion:{progres, status, error in
            print("progress-> " + progres, "status-> " + status, "Error-> " + error)
            DispatchQueue.main.async {
                self.loadingView.updateProgress(progres)
            }

            
            if(error == "") {
                if(status == "Start Now") {
                    configProperties.setLoaderColor(color: UIColor.red)
                    iPassSDKManger.UserOnboardingProcess(email: self.emailStr, password: self.passwordStr) { status, tokenString in
                       print("tokenstring--",tokenString)
                        DispatchQueue.main.async {
                            self.loadingView.hide()
                            if(status == true) {
                                DataManager.shared.processCompleted = true
                                DataManager.shared.userLoginToken = tokenString!
                               // self.userToken = tokenString!
                                
                            }
                            else {
                                
                                    DispatchQueue.main.async {
                                        let alertController = UIAlertController(title: "Error", message: "Login failed", preferredStyle: .alert)
                                               
                                               // Step 3: Add actions
                                               let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                                                   // Handle the OK button tap if needed
                                                   print("OK button tapped")
                                               }
                                               alertController.addAction(okAction)
                                               
                                               // Optionally, add more actions if needed
                                               // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                                               // alertController.addAction(cancelAction)
                                               
                                               // Step 4: Present the alert
                                               self.present(alertController, animated: true, completion: nil)
                                    }
                            }
                        }
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    self.loadingView.hide()
                    let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                           
                           // Step 3: Add actions
                           let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                               // Handle the OK button tap if needed
                               print("OK button tapped")
                           }
                           alertController.addAction(okAction)
                           
                           // Optionally, add more actions if needed
                           // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                           // alertController.addAction(cancelAction)
                           
                           // Step 4: Present the alert
                           self.present(alertController, animated: true, completion: nil)
                }
            }
            
           
           
        })
    }
  //  http://192.168.12.138/node/api/v1/ipass/
   
    
    func callDataBaseFiles() {
      //  DataManager.shared.userLoginToken = ""
        if(DataManager.shared.processCompleted == true) {
            return
        }
        
        DispatchQueue.main.async {
            self.loadingView.show(in: self.view)
            self.loadingView.updateProgress("")
        }
        //
        
        configProperties.setLoaderColor(color: .purple)
        iPassSDKManger.delegate = self
       // configProperties.needHologramDetection(value: true)
       // http://192.168.12.138/node/api/v1/ipass/
       // http://192.168.14.20
       // http://192.168.14.20
        DataBaseDownloading.initializePreProcessedDb( serverUrl: "https://staging.ipass-mena.com/stagapi", dbType: DataBaseDownloading.availableDataSources.fullDb, completion:{status, error in
            print(status, error)
            if(error == "") {
                if(status == "Start Now") {
                    iPassSDKManger.UserOnboardingProcess(email: self.emailStr, password: self.passwordStr) { status, tokenString in
                      print("tokenString",tokenString)
                        DispatchQueue.main.async {
                            self.loadingView.hide()
                            if(status == true) {
                                DataManager.shared.processCompleted = true
                                DataManager.shared.userLoginToken = tokenString!
                               // self.userToken = tokenString!
                            }
                        }
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    self.loadingView.hide()
                    let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                           
                           // Step 3: Add actions
                           let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                               // Handle the OK button tap if needed
                               print("OK button tapped")
                           }
                           alertController.addAction(okAction)
                           
                           // Optionally, add more actions if needed
                           // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                           // alertController.addAction(cancelAction)
                           
                           // Step 4: Present the alert
                           self.present(alertController, animated: true, completion: nil)
                }
            }
            
           
          
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
        
         // callDataBaseFiles()
     callOnlineDataBase()
    }
 
    
    
    func handleUIData() {
        let flow1: [String: Any] = ["title": "Full Processing", "subtitle": "This flow includes Document Scanning, Document Authenticity, User Liveness, User Face Matching, AML and social media verification", "image": "flow1.png"]
        let flow2: [String: String] = ["title": "IDV + Liveness + AML", "subtitle": "This flow includes Document Scanning, Document Authenticity, User Liveness, User Face Matching and AML check", "image": "flow2.png"]
        let flow3: [String: String] = ["title": "IDV + AML", "subtitle": "This flow includes Document Scanning, Document Authenticity and AML check", "image": "flow3.png"]
        let flow4: [String: String] = ["title": "IDV + Liveness ", "subtitle": "This flow includes Document Scanning, Document Authenticity, User Liveness and User Face Matching", "image": "flow4.png"]
        let flow5: [String: String] = ["title": "IDV + Verification ", "subtitle": "This flow includes Document Scanning, Document Authenticity", "image": "flow4.png"]
       
        dataDict.append(flow1)
        dataDict.append(flow2)
        dataDict.append(flow3)
        dataDict.append(flow4)
        dataDict.append(flow5)
        
    }
    
    // 553c6d85-bfbd-4b61-8d19-d407c091c68e
     //597b482f-4d44-42be-a9ce-a40cdaa1fc1a
//        2261b84f-090e-441f-a5ca-31ba1c71ca25
//        i267130117OSrAIf7kaLaV2024-06-1412-3410031
   //  i277845013OSUrFRcPxGhD2024-06-2611-0810015
     //i38195208OSIhC80SEIbD2024-06-2611-0710011
     // 262a6a13-12b8-4cd6-8296-af7df38df52b
     //i330904380OS8KwSw84n9u2024-06-2613-4710011
     //i925336646OSSI0ki3x5TD2024-06-2719-2110031
//        iPassSDKManger.delegate = self
//        iPassSDKManger.fetchTransaction(transactionId: "i267130117OSrAIf7kaLaV2024-06-1412-3410031", controller: self, appToken: self.appToken1 )
     
     
   //  iPassSDKManger.addLivenessInfoView(ctrl: self)
    
    
    func callLive () {
        
//        iPassSDKManger.checkNewLiveness(controllerReference: self, tkn: "ZXlKcGRpSTZJbEJSWlRGMlFUQndZakUwUmpkUE5HaHRibU5FSzBFOVBTSXNJblpoYkhWbElqb2lhR0ZPUXpCelYzQjZNalpJWjJzNFlXdG9jRWgzVDBKMlJGRkxLMm9yVFdkMWREUXpWV0ZYYm10MVVHTm9WRko0YlRCT016SnVSSE5rTlUxdVUwRjFaWE51VEhSbmJUSTVVRlprTWl0R1REQmFOeXQyVVRKemREQnBZbkV3VG01Rk1XWnBkMHRJYWpWeGJIQm5TMHhOZUV4U00wUmpZelYwVG1aQ1NtdHdkaTlSU2xGTksxZEJiblprVEdocVQzTXhURVowVW5sRE0yZHFVekkzYWtzclQxZ3pRbU0xYUhWWVkwcHZVREI0THpsQ2VsVTFiakZsV2t4SFRrdENkM2NySWl3aWJXRmpJam9pTVRSaVl6ZzVOVFUwWVRrell6QXpOVEptTldabU5XVTBPREJoTW1VNVpqQXdaVGt3WWpobE5UY3hNREF6TkdJM05qa3haRE15WWpSa01EWTBOMlkzTWlJc0luUmhaeUk2SWlKOQ==" )
    
//        iPassSDKManger.checkNewLiveness(controllerReference: self)
    }
    
    func startDocScanner (_ flowNumber: Int)  {
        
      //  DispatchQueue.main.async {
            Task { @MainActor in
                await iPassSDKManger.startScanningProcess(userEmail: self.emailStr, flowId: flowNumber,
                                                    socialMediaEmail :"bikram4127@gmail.com", phoneNumber : "+919781986132", controller: self, userToken: DataManager.shared.userLoginToken, appToken: self.appToken1 )
                
                
                
               // await iPassSDKManger.addLivenessInfoView()
                
            }
            
            //}
      
        
//        Task { @MainActor in
//            iPassSDKManger.delegate = self
//
//
//
//            await iPassSDKManger.startScanningProcess(userEmail: emailStr, flowId: flowNumber,
//                                                socialMediaEmail :"bikram4127@gmail.com", phoneNumber : "+919781986132", controller: self, userToken: DataManager.shared.userLoginToken, appToken: self.appToken1 )
//
//
//
//           // await iPassSDKManger.addLivenessInfoView()
//
//        }
        
        
       
    }
    
    func fetchPublicIPAddress22(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api.ipify.org?format=json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching public IP address: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received.")
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let ipAddress = json["ip"] as? String {
                    completion(ipAddress)
                } else {
                    print("Invalid JSON format.")
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }

    
    
    func fetchPublicIPAddress(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api.ipify.org?format=json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching public IP address: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let ipAddress = json["ip"] as? String {
                    completion(ipAddress)
                } else {
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
     func getIPAddress22() -> String? {
        var address : String?

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                // wifi = ["en0"]
                // wired = ["en2", "en3", "en4"]
                // cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]
                
                let name = String(cString: interface.ifa_name)
                if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3" {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }
    
    func getIPAddress() -> String? {
        var address: String?
        
        // Get list of all interfaces on the device
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }
        
        // Iterate through the list of interfaces
        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ptr.pointee
            
            // Check for IPv4 or IPv6 interfaces
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                // Get interface name
                let name = String(cString: interface.ifa_name)
                
                // Only consider Wi-Fi or cellular interfaces
                if name == "en0" || name == "pdp_ip0" {
                    // Convert interface address to a human-readable string
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    var addr = interface.ifa_addr.pointee
                    if (getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                    &hostname, socklen_t(hostname.count),
                                    nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                        address = String(cString: hostname)
                    }
                }
            }
        }
        
        freeifaddrs(ifaddr)
        return address
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataDict.count
        }

        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FlowsTableViewCell", for: indexPath) as! FlowsTableViewCell
        
        let flowData: [String: Any] = dataDict[indexPath.row]
        cell.title.text = flowData["title"] as? String
        cell.subtitle.text = flowData["subtitle"] as? String
        cell.flowImage.image = UIImage(named: (flowData["image"] as? String)!)
        
      

            return cell
        }
    
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
            if let nfcError = error as? NFCReaderError {
                switch nfcError.code {
                case .readerSessionInvalidationErrorUserCanceled:
                    print("User canceled the session.")
                case .readerSessionInvalidationErrorSessionTimeout:
                    print("Session timeout.")
                default:
                    print("Other error: \(nfcError.localizedDescription)")
                }
            } else {
                print("Error: \(error.localizedDescription)")
            }
        }

    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        print("NFC Reader session became active")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                print("NFC Tag payload------: \(record)")
                if let payload = String(data: record.payload, encoding: .utf8) {
                    print("NFC Tag payload: \(payload)")
                }
            }
        }
    }
    private var audioRecorder: AVAudioRecorder?
    private var isRecording = false
    private var audioPlayer: AVAudioPlayer?
    
    private func getDocumentsDirectory() -> URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }
    
    private func startRecording() {
           let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
           
           let settings: [String: Any] = [
               AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
               AVSampleRateKey: 12000,
               AVNumberOfChannelsKey: 1,
               AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
           ]
           
           do {
               audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
               audioRecorder?.record()
           } catch {
               print("Could not start recording: \(error)")
           }
       }
    
    
    private func stopRecording() {
           audioRecorder?.stop()
       
       }
    
    private func getAudioFilePath() -> URL {
           return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("recording.m4a")
       }
    
    private func playAudio() {
            let audioFilename = getAudioFilePath()
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
                audioPlayer?.play()
                audioPlayer?.delegate = self
            } catch {
                print("Could not play audio: \(error)")
            }
        }
       
  //  192.168.118.51



    func autoDetectAndFetchData() {
        let machineIP = "192.168.118.51"
        let commonPorts: [UInt16] = [80, 8080, 443, 5000, 502]

        let dispatchGroup = DispatchGroup()

        var detectedPort: UInt16?
        var responseData: String?

        // Step 1: Check Open Ports
        for port in commonPorts {
            dispatchGroup.enter()
            let connection = NWConnection(host: NWEndpoint.Host(machineIP), port: NWEndpoint.Port(rawValue: port)!, using: .tcp)

            connection.stateUpdateHandler = { state in
                if case .ready = state {
                    print("✅ Port \(port) is OPEN on \(machineIP)")
                    detectedPort = port
                }
              //  dispatchGroup.leave()
            }

            connection.start(queue: .global())
        }

        dispatchGroup.notify(queue: .main) {
            if let port = detectedPort {
                print("🎯 Testing communication on open port: \(port)")

                // Step 2: Try HTTP Requests
                let httpEndpoints = ["/data", "/records", "/logs"]
                for endpoint in httpEndpoints {
                    if self.sendHTTPRequest(ip: machineIP, endpoint: endpoint) {
                        return
                    }
                }

                // Step 3: Try TCP Communication
                let possibleCommands = ["GET_DATA", "FETCH_RECORDS", "READ_STORAGE"]
                for command in possibleCommands {
                    if let response = self.sendTCPCommand(ip: machineIP, port: port, command: command) {
                        responseData = response
                        return
                    }
                }

                // Step 4: Try UDP if TCP & HTTP fail
                if responseData == nil {
                    self.sendUDPCommand(ip: machineIP, port: port, command: "GET_DATA")
                }
            } else {
                print("❌ No open ports found on \(machineIP). Check connection.")
            }
        }
    }

    // HTTP Request Function
    func sendHTTPRequest(ip: String, endpoint: String) -> Bool {
        let url = URL(string: "http://\(ip)\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let semaphore = DispatchSemaphore(value: 0)
        var success = false

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("📡 HTTP Response from \(endpoint): \(responseString)")
                success = true
            } else {
                print("❌ HTTP \(endpoint) failed: \(error?.localizedDescription ?? "Unknown error")")
            }
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return success
    }

    // TCP Communication Function
    func sendTCPCommand(ip: String, port: UInt16, command: String) -> String? {
        let connection = NWConnection(host: NWEndpoint.Host(ip), port: NWEndpoint.Port(rawValue: port)!, using: .tcp)
        var response: String?

        let semaphore = DispatchSemaphore(value: 0)

        connection.stateUpdateHandler = { state in
            if case .ready = state {
                print("📡 TCP Connection established on port \(port), sending command: \(command)")

                let data = command.data(using: .utf8)!
                connection.send(content: data, completion: .contentProcessed({ error in
                    if let error = error {
                        print("❌ TCP Send error: \(error)")
                    }
                }))

                connection.receive(minimumIncompleteLength: 1, maximumLength: 1024) { receivedData, _, _, error in
                    if let receivedData = receivedData {
                        response = String(decoding: receivedData, as: UTF8.self)
                        print("✅ TCP Response: \(response!)")
                    } else {
                        print("❌ TCP Receive failed: \(error?.localizedDescription ?? "Unknown error")")
                    }
                    semaphore.signal()
                }
            }
        }

        connection.start(queue: .main)
        semaphore.wait()
        return response
    }

    // UDP Communication Function
    func sendUDPCommand(ip: String, port: UInt16, command: String) {
        let connection = NWConnection(host: NWEndpoint.Host(ip), port: NWEndpoint.Port(rawValue: port)!, using: .udp)

        connection.send(content: command.data(using: .utf8), completion: .contentProcessed({ error in
            if let error = error {
                print("❌ UDP Send error: \(error)")
            } else {
                print("📡 UDP Command Sent: \(command)")
            }
        }))

        connection.receive(minimumIncompleteLength: 1, maximumLength: 1024) { receivedData, _, _, error in
            if let receivedData = receivedData {
                let response = String(decoding: receivedData, as: UTF8.self)
                print("✅ UDP Response: \(response)")
            } else {
                print("❌ UDP Receive failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }



    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        callLive ()
//        return
        
//        if(indexPath.row == 0) {
//            if(isRecording == false) {
//                isRecording = true
//                startRecording()
//                return
//            }
//            else {
//                isRecording = false
//                stopRecording()
//                return
//            }
//        }
//        else if(indexPath.row == 1) {
//            playAudio()
//            return
//        }
        
        
        
       
        
//
//        if let ipAddress = getIPAddress() {
//            print("IP Address 1: \(ipAddress)")
//        } else {
//            print("Unable to get IP Address")
//        }
//
//        if let ipAddressww = getIPAddress22() {
//            print("IP Address 2: \(ipAddressww)")
//        } else {
//            print("Unable to get IP Address22")
//        }
//
//
//
//        fetchPublicIPAddress { ipAddress in
//            if let ipAddress = ipAddress {
//                print("IP Address 3 \(ipAddress)")
//            } else {
//                print("Unable to fetch public IP Address")
//            }
//        }
//
//
//        fetchPublicIPAddress22 { ipAddress in
//            if let ipAddress = ipAddress {
//                print("Public IP Address 4 : \(ipAddress)")
//            } else {
//                print("Unable to fetch public IP Addressr")
//            }
//        }
        
     
        let flowData: [String: Any] = dataDict[indexPath.row]
       
        if(indexPath.row == 0) {
            DataManager.shared.selectedFlowCode = 10031
             startDocScanner(10031)
//            guard NFCNDEFReaderSession.readingAvailable else {
//                       print("NFC is not available on this device")
//                       return
//                   }
//
//                   nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
//                   nfcSession?.alertMessage = "Hold your iPhone near the NFC tag."
//                   nfcSession?.begin()
            
        }
        else if(indexPath.row == 1) {
            DataManager.shared.selectedFlowCode = 10032
             startDocScanner(10032)
        }
        else if(indexPath.row == 2) {
            DataManager.shared.selectedFlowCode = 10015
             startDocScanner(10015)
        
        }
        
        else if(indexPath.row == 4) {
            DataManager.shared.selectedFlowCode = 10016
             startDocScanner(10016)
        
        }
        
        else {
            DataManager.shared.selectedFlowCode = 10011
             startDocScanner(10011)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}




extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
    }
}
