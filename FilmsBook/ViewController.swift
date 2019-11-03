//
//  ViewController.swift
//  FilmsBook
//
//  Created by Xcode on 23.10.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit
var FilmsData = [Search]()
var FilmDetailData = [DetailFilmType]()

class ViewController: UIViewController {
    @IBOutlet weak var VizyonImage: UIImageView!
    @IBOutlet weak var SearchTextField: UITextField!
    @IBAction func SearchButton(_ sender: Any) {
        get(LinkTitle: self.SearchTextField.text!);
    
        
    }
    @IBAction func WatchedButton(_ sender: Any) {
    }
    @IBAction func WatchingButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        get(LinkTitle: "lord")
    }

    func get(LinkTitle: String) -> Void {
        let url = URL(string: "http://www.omdbapi.com/?apikey=ebb5f279&type=movie&s=\(LinkTitle)")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("error:\(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("StatusCode:\(response.statusCode)")
                }
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let ResponsModel = try jsonDecoder.decode(SearchType.self, from: data);
                        FilmsData = ResponsModel.search!;
                        for dict in FilmsData {
                            print(dict.imdbID);
                            self.ForGet(imdb:dict.imdbID!)
                        }
                        
                        
                      /*  let ParseData = try JSONSerialization.jsonObject(with: data) as! [String:Any]
                        for (key, value) in ParseData {
                            if (key == "Search") {
                                if let SearchArray:[ [String : Any] ] = value as? [ [String : Any] ] {
                                    for dict in SearchArray {
                                        for (key, value) in dict {
                                            if (key == "imdbID") {
                                                do {
                                                print("imdbID:\(value)")
                                                AllidmbID.append(value as! String)
                                                self.ForGet(imdb: value as! String)
                                                    
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }*/
                        
                    } catch let error {
                        print("Error",error)
                    }
                }
            }
        }
        task.resume();
    }
    func ForGet(imdb: String) -> Void {
                let Furl = URL(string: "http://www.omdbapi.com/?apikey=ebb5f279&i=\(imdb)&plot=full")!
                let Ftask = URLSession.shared.dataTask(with: Furl) {(Fdata, Fresponse, Ferror) in
             if let Ferror = Ferror {
                        print("error:\(Ferror)")
                    } else {
             if let Fresponse = Fresponse as? HTTPURLResponse {
                        print("StatusCode:\(Fresponse.statusCode)")
                        }
                if let Fdata = Fdata {
                    do {
                let FJsonDecoder = JSONDecoder()
                        let FResponseModel = try FJsonDecoder.decode(DetailFilmType.self, from: Fdata);
                        FilmDetailData.append(FResponseModel);
                        
                            } catch let error {
                                print("Error",error)
                        }
                    }
                }
            }
                Ftask.resume();
        }
   
}

