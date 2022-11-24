//
//  ViewController.swift
//  TestAlamofire
//
//  Created by mac on 2022/11/22.
//

import UIKit
import Alamofire
import Moya


struct Test1: Codable {
    let q: String
    let token: String
}

class ViewController: UIViewController {
    
    let url = "https://talk.objc.io/episodes.json"
    //var alamofireModel = AlamofireModel()
    //var arrUsers = [AlamofireRequest]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("requesting...")
        //alamofireModel.getAllUserData()
        //test1Alamofire()
        //tets2Alamofire()
        //testMoya()
        
    }

    func test1Alamofire() {
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let responseSource = try JSONDecoder().decode([AlamofireRequest].self, from: data!)
                    print(responseSource)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }

    }
    
    func tets2Alamofire() {
        let test1 = Test1(q: "china", token: "ce5695a7d72a94da3b96d72b12048d76")
        AF.request("https://gnews.io/api/v4/search",
                   method: .get,
                   parameters:  test1,
                   encoder: URLEncodedFormParameterEncoder.default).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
  //                  let JHSJdata = String(data: data, encoding: .utf8)//从网络获取数据的转换
                    do {
                        let responseSource = try JSONDecoder().decode(JHSJAlamofire.self, from: data )
                        print(responseSource)
                    } catch {
                        print(error)
                    }
//                    print(JHSJdata!)
                } else {
                    print("解包失败")
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    func testMoya() {
        let provider = MoyaProvider<MoyaTest>()
        provider.request(.search(q: "china", token: "ce5695a7d72a94da3b96d72b12048d76")) { result in
            switch result {
            case .success(let response):
                do {
                    let source = try JSONDecoder().decode(JHSJAlamofire.self, from: response.data)
                } catch {
                    print(error)
                }
 
            case .failure(let error):
                print(error)
            }
                
        }
    }
    

}



enum MoyaTest {
    case search(q: String, token: String)
    
}


extension MoyaTest: TargetType {
    var baseURL: URL {
        URL(string: "https://gnews.io")!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/api/v4/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let q, let token):
            let p: [String: Any] = [
                "q" : q,
                "token": token
            ]
            return .requestParameters(parameters: p, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
  
}


