import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    //film veri listesi oluşturalım nesneler ise Filmler türünde olmalıdır
    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collection view'i protocollere bağlıyacağız
        CollectionView.dataSource = self
        CollectionView.delegate = self
        //tasarım değişkeni CollectionView'in hücrelerinin nasıl düzenleyeceğini tanımlayan bir layout olacak.
        let tasarım:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //tasrım'ı UICollectionViewFlowLayout nesnesi olarak oluşturduk şimdi CollectionView'e atayacağız.
        CollectionView.collectionViewLayout = tasarım
        //CollectionView in genişliğini bellirle
        let genislik = self.CollectionView.frame.size.width
        //Kenar boşlukları verilmeli
        tasarım.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //Hücre genişliği ve boyunu belirliyeceğiz
        tasarım.itemSize = CGSize(width: (genislik-25)/2, height: ((genislik-25)/2)*(2.2))
        //arada kalan boşlukları belirleyelim
        tasarım.minimumLineSpacing = 5
        tasarım.minimumInteritemSpacing = 5
        //Filmler sınıfından nesnelerimizi oluşturuyoruz
        let f1 = Filmler(filmId: 1, filmBaslik: "The Pianist", filmResimAdi: "thepianist", filmFiyat: 14.50)
        let f2 = Filmler(filmId: 2, filmBaslik: "Bir Zamanlar Anadolu", filmResimAdi: "birzamanlaranadoluda", filmFiyat: 18.50)
        let f3 = Filmler(filmId: 3, filmBaslik: "Django", filmResimAdi: "django", filmFiyat: 15.99)
        let f4 = Filmler(filmId: 4, filmBaslik: "Inception", filmResimAdi: "inception", filmFiyat: 20.00)
        let f5 = Filmler(filmId: 5, filmBaslik: "Interstellar", filmResimAdi: "interstellar", filmFiyat: 24.50)
        let f6 = Filmler(filmId: 6, filmBaslik: "The Hateful Eight", filmResimAdi: "thehatefuleight", filmFiyat: 8.50)
        //nesnleri verilistesine eklemeliyiz
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
    }


}
// Gerekli protokolleri extension yolu ile ekliyeceğiz
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,FilmHucreProtocol{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 //1 bölümden oluşucak
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count // eleman sayısı
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row] //nesneleri sıradan vericek
        //hücreye ulaşacağız
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmHucre", for: indexPath) as! FilmHucre
        //artık hücredeki görsel nesnelere erişebileceğiz
        cell.labelFilmAdi.text = film.filmBaslik!
        cell.labelFilmFiyati.text = "\(film.filmFiyat!) TL"
        cell.FilmResim.image = UIImage(named: film.filmResimAdi!)
        //cell i FilmHucreProtocol'e bağlıcaz
        cell.hucreProtocol = self
        //FilmHücredeki dğeişkene ulaşarak burdaki değişkeni atıyacağız
        cell.indexPath = indexPath
        //hücrelerin çevresini tasarlıcaz
        
        
        return cell
    }
    func sepeteEkle(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.filmBaslik!) filmi sepete eklediniz.")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.filmBaslik!) adlı hücreye tıklandı.")
    }
}
