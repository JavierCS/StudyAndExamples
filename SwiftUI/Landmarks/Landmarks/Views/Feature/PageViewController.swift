//
//  PageViewController.swift
//  Landmarks
//
//  Created by Javier Cruz Santiago on 20/11/24.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    
    var pages: [Page]
    @Binding var currentPage: Int
    
    /// Called before `makeUIViewController(contex:)`, you can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    /// Swift UI calls this method a single time when it's ready to display the view, and then manages the view controller's life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    /// The coordinator is a good plate to store the controllers because the system initializes them only onc, and before you need them to update the view controller
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(parent: PageViewController) {
            self.parent = parent
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // MARK: Data Source Code
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 { return controllers.last }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index + 1 == controllers.count { return controllers.first }
            return controllers[index + 1]
        }
        
        // MARK: Delegate Methods
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
