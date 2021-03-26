//
//  TelaHomeViewModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 19/03/21.
//

import Foundation
import Firebase
import RxSwift
import RxCocoa
import CoreLocation

class TelaHomeViewModel:NSObject {
    var firebaseHelper = LoginHelper()
    let locationManager = CLLocationManager()
    
    var isUsuarioDeslogar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var data: ForeCastModel?
    var isDataLoaded: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func bindViewModel(){
        print("Iniciando Mapa")
        locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
                if CLLocationManager.locationServicesEnabled() {
                    locationManager.delegate = self
                    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                    locationManager.startUpdatingLocation()
                }
    }
    
    func deslogarUsuario(){
        firebaseHelper.deslogarFirebase()
        isUsuarioDeslogar.accept( Auth.auth().currentUser == nil ? true : false )
    }
    
    func pegarTemperatura(lat: Double, long: Double){
        APIClient.pegarTemperaturaForeCast(lat: lat,long: long,completion: { result in
            if(result != nil){
                print(result)
                self.data = result
                self.isDataLoaded.accept(true)
            }
                print(result)
        })
    }

}

extension TelaHomeViewModel: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.pegarTemperatura(lat: locValue.latitude, long: locValue.longitude)
        locationManager.stopUpdatingLocation()
        }
}
