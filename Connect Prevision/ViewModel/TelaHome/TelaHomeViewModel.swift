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

enum TelaHomeStatus {
    case VALORES_CARREGADOS, CARREGANDO, FALHA, DEFAULT
}

class TelaHomeViewModel: NSObject {
    
    var breachesRX: BehaviorRelay<[Forecastday]> = BehaviorRelay<[Forecastday]>(value: [])
    
    var firebaseHelper = LoginHelper()
    var dataSourse: BehaviorRelay<ForeCastModel> = BehaviorRelay<ForeCastModel>(value: ForeCastModel())
    let locationManager = CLLocationManager()
    
    var isUsuarioDeslogar: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var data: ForeCastModel?
    
    var statusFeedback: BehaviorRelay<TelaHomeStatus> = BehaviorRelay<TelaHomeStatus>(value: .DEFAULT)
    
    func bindViewModel(){
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
        APIClient.pegarTemperaturaForeCast(
            lat: lat,
            long: long,
            completion: { result in
                self.data = result
                self.dataSourse.accept(result)
                self.breachesRX.accept(result.forecast!.forecastday)
                self.statusFeedback.accept(.VALORES_CARREGADOS)
                
            }
        )
    }
}

extension TelaHomeViewModel: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.pegarTemperatura(lat: locValue.latitude, long: locValue.longitude)
        locationManager.stopUpdatingLocation()
    }
}
