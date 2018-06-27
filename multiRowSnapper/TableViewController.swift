import UIKit

class TableViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableCell

        if cell.collectionController == nil {
            let collectionController = storyboard?.instantiateViewController(withIdentifier: "Collection") as! CollectionViewController
            cell.collectionController = collectionController
            let collectionControllerView = collectionController.view!
            collectionControllerView.translatesAutoresizingMaskIntoConstraints = false
            cell.columnStack.addArrangedSubview(collectionController.view)
            let layout = collectionController.collectionViewLayout as! UICollectionViewFlowLayout
            NSLayoutConstraint.activate([
                collectionControllerView.widthAnchor.constraint(equalTo: cell.columnStack.widthAnchor),
                collectionControllerView.heightAnchor.constraint(equalToConstant: layout.itemSize.height * 3),
                ])
        }

        return cell
    }

}

class TableCell: UITableViewCell {
    @IBOutlet var columnStack: UIStackView!

    var collectionController: CollectionViewController?
}
