import UIKit

protocol FilmHucreProtocol {
    func sepeteEkle(indexPath:IndexPath)
}

class FilmHucre: UICollectionViewCell {
    @IBOutlet weak var FilmResim: UIImageView!
    @IBOutlet weak var labelFilmFiyati: UILabel!
    @IBOutlet weak var labelFilmAdi: UILabel!
    
    //protocole erişebilmemiz için FilmHucreProtocol türünde değişken'e ihtiyacımız var
    var hucreProtocol:FilmHucreProtocol?
    //fonksiyon içerisindeki indexPath'i alacağız
    var indexPath:IndexPath?
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
}
