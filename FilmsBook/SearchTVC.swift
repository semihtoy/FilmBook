//
//  SearchTVC.swift
//  FilmsBook
//
//  Created by Xcode on 25.10.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit


class SearchTVC: UITableViewController {
    

    @IBOutlet var SearchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchTableView.delegate = self
        SearchTableView.dataSource = self
        DispatchQueue.main.async {   // async çalıştırdık yine
            self.SearchTableView.reloadData()    // tableview deki verileri güncelledik çalışmadan önce gelen verileri ekranda göstermek için
        }
    
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        self.SearchTableView.reloadData()
        return FilmDetailData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as?

        SearchCell else {return UITableViewCell()}
    
        cell.FilmNameLabel.text = FilmDetailData[indexPath.row].title
        cell.imdbLabel.text = FilmDetailData[indexPath.row].imdbRating
        cell.SkorLabel.text = FilmDetailData[indexPath.row].imdbVotes
        cell.YearLabel.text = FilmDetailData[indexPath.row].year
        if let imageURL = URL(string: FilmDetailData[indexPath.row].poster!){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage (data: data)
                    DispatchQueue.main.async {
                        cell.FilmPoster.image = image
                    }
                }
            }
        }

        return cell
    }
    /*
    func get(imdbid: String) -> Void {
        let url = URL(string: "http://www.omdbapi.com/?apikey=ebb5f279&i=\(imdbid)&plot=full")!
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
                        let ResponsModel = try jsonDecoder.decode(DetailFilmType.self, from: data);
                        FilmDetailData = (ResponsModel.Films)!;
                    

                        
                    } catch let error {
                        print("Error",error)
                    }
                }
            }
        }
        task.resume();
    }

    */
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
