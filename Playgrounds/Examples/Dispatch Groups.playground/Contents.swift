import UIKit

//MARK: - Group Creation
//let someQueue = DispatchQueue.global(qos: .utility)
//let someOtherQueue = DispatchQueue(label: "com.example.myUtilityQueue", qos: .utility)
//
//let group = DispatchGroup()
//
//someQueue.async(group: group) {
//    print("Start job 1")
//    Thread.sleep(until: Date().addingTimeInterval(5))
//    print("End job 1")
//}
//
//someOtherQueue.async(group: group) {
//    print("Start job 2")
//    Thread.sleep(until: Date().addingTimeInterval(3))
//    print("End job 2")
//}
//
//group.notify(queue: DispatchQueue.main) {
//    print("All jobs have completed")
//}

//MARK: - Synchronous Waiting
//let otherGroup = DispatchGroup()
//
//someQueue.async(group: otherGroup) {
//    print("Start job 3")
//    Thread.sleep(until: Date().addingTimeInterval(5))
//    print("End job 3")
//}
//
//someOtherQueue.async(group: otherGroup) {
//    print("Start job 4")
//    Thread.sleep(until: Date().addingTimeInterval(10))
//    print("End job 4")
//    print("The job still running after the timeout has happened")
//}
//
//switch otherGroup.wait(timeout: .now() + 7) {
//case .timedOut:
//    print("The jobs 3 and 4 didn’t finish in 7 seconds")
//case .success:
//    print("All the jobs have completed")
//}

//MARK: - Wrapping Asynchronous Methods
func myAsyncAdd(lhs: Int, rhs: Int, completion: @escaping (Int) -> Void) {
    //Lots of code here
    DispatchQueue.global(qos: .utility).async {
        Thread.sleep(until: Date().addingTimeInterval(7))
        completion(lhs + rhs)
    }
}

func myAsyncAddForGroups(group: DispatchGroup, lhs: Int, rhs: Int, completion: @escaping (Int) -> Void) {
    group.enter()
    myAsyncAdd(lhs: lhs, rhs: rhs) { result in
        defer { group.leave() }
        completion(result)
    }
}

let lastQueue = DispatchQueue.global(qos: .utility)
let lastGroup = DispatchGroup()

lastQueue.async(group: lastGroup) {
    print("Start job 5")
    Thread.sleep(until: Date().addingTimeInterval(5))
    print("Start sub job 5-1")
    myAsyncAdd(lhs: 1, rhs: 2) { result in
        print("El resultado de la suma es \(result)")
        print("End sub job 5-1")
    }
//    myAsyncAddForGroups(group: lastGroup, lhs: 1, rhs: 2) { result in
//        print("El resultado de la suma es \(result)")
//        print("End sub job 5-1")
//    }
}

lastGroup.notify(queue: .main) {
    print("Finished all job 5")
}


