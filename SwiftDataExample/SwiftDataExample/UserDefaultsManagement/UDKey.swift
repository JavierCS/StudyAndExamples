//
//  UDKey.swift
//  Pigget
//
//  Created by Javier Cruz Santiago on 07/01/25.
//

import Foundation

enum UDKey: String {
    // MARK: - Configuration Keys
    
    /// `Bool` que indica si se han guardado las categorías iniciales.
    case haveTheInitialDataBeenSaved
    /// `Bool` que indica si los permisos han sido revisados.
    case permissionsHasBeenReviewed
    /// `Bool` que indica si se ha terminado de configurar los elementos iniciales de la cartera
    case walletHasBeenConfigured
    /// `Bool` que indica si el usuario ha concluido la configuración inicial
    case shouldShowDashboard
}
