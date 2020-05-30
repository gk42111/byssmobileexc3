import Foundation
import Glibc

protocol CheckListElementDelegate{
    var czyDaSieWykonac:Bool {get set}
    func pokazCzyDaSieWykonac()
}

class CheckListElement: CheckListElementDelegate{
    var poleTekstowe:String
    var czyWykonany:Bool
    var dzienTygodnia:String
    var czyDaSieWykonac:Bool = false
    
    init(){
        poleTekstowe = ""
        czyWykonany = false
        dzienTygodnia = ""
    }
    
    init(_ nrDniaTygodnia:Int, _ poleTekstowe:String, _ czyWykonany:Bool){
        self.poleTekstowe = poleTekstowe
        self.czyWykonany = czyWykonany
        let tydzien = ["Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela"]
        self.dzienTygodnia = tydzien[nrDniaTygodnia-1]
    }
    
    func pokazCzyDaSieWykonac(){
        if czyWykonany == true{
            czyDaSieWykonac = true
            print("da się wykonać")
        }
        else{
            czyDaSieWykonac = false
            print("niewiadomo, czy da się wykonać")
        }
    }
    
    func zmienCzyWykonany(){
        var holder:Bool?
        holder = czyWykonany
        if holder == true {
            czyWykonany = false
        }
        else{
            czyWykonany = true
        }
    }
}
   
extension CheckListElement: CustomStringConvertible{
    var description: String {
        var tekstCzyWykonany = ""
        if czyWykonany == false {
            tekstCzyWykonany = "Do Wykonania"
        }
        else{
            tekstCzyWykonany = "Gotowe"
        }
        return "\(dzienTygodnia) \(poleTekstowe) -> \(tekstCzyWykonany)"
    }   
}


var o = CheckListElement(7, "Wyjść na spacer", true)
print(o)
o.pokazCzyDaSieWykonac()
o.zmienCzyWykonany()
print(o)
o.pokazCzyDaSieWykonac()




