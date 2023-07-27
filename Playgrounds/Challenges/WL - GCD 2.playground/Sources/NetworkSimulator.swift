import Foundation

public class NetworkSimulator {
    
    public init() {}
    
    public func getNewText1(completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
            completion("Var")
        }
    }
    
    public func getNewText2(completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
            completion("Foo")
        }
    }
}
