//
//  NavigationRouter.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 14.03.2021.
//

import SwiftUI

struct NavigationRouter<Content> : View where Content : View {
    
    @ObservedObject private var navigationModel: NavigationRouterViewModel
    
    private let routerController: Navigation
    
    private let content: Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content()
        self.routerController = Navigation()
        self.navigationModel = routerController.navigationModel
    }
    
    var body: some View {
        if navigationModel.isEmpty {
            show(rootScreen: content).environmentObject(routerController)
        } else {
            navigationModel.currentScreen.environmentObject(routerController)
        }
    }
    
    private func show(rootScreen: Content) -> Content {
        routerController.show(rootScreen)
        return rootScreen
    }
    
}

/** interface for managing NavigationRouter */
final class Navigation : ObservableObject {
    
    fileprivate let navigationModel: NavigationRouterViewModel = .init()
    
    var currentScreen: AnyView? { navigationModel.currentScreen }
    
    func show<Screen : View>(_ screen: Screen) { navigationModel.show(screen) }
    
    func goBack() { navigationModel.goBack() }
    
}

final class NavigationRouterViewModel : ObservableObject {
    
    @Published var currentScreen: AnyView?
    
    private var navigationStack: [AnyView] = .init()
    
    func show<Screen : View>(_ screen: Screen) {
        navigationStack.append(AnyView(screen))
        currentScreen = navigationStack.last
    }
    
    func goBack() {
        guard navigationStack.count > 1 else { return }
        navigationStack.removeLast()
        currentScreen = navigationStack.last
    }
    
    var isEmpty: Bool { currentScreen == nil }
    
}
