
import Foundation

protocol DIContainerProtocol {
    func register<Service>(type: Service.Type, component: Any)
    func resolve<Service>(type: Service.Type) -> Service
}

final public class DIContainer: DIContainerProtocol {
    
    public static let shared = DIContainer()
    
    private init() {}
    
    var services: [String: Any] = [:]
    
    public func register<Service>(type: Service.Type, component: Any) {
        services["\(type)"] = component
    }
    
    public func resolve<Service>(type: Service.Type) -> Service {
        let key = "\(type)"
        let dependency = services[key]
        precondition(dependency != nil, "No dependency found for key \(key). Must register dependency before resolving it")
        return dependency as! Service
    }
    
}
