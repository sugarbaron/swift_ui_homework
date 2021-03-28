//
//  ServiceLocator.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.03.2021.
//

final class ServiceLocator {
    
    private static var registry: [ObjectIdentifier : Any] = .init()
    
    static func register<Dependency>(_: Dependency.Type, factory: @escaping () -> Dependency) {
        registry[ObjectIdentifier(Dependency.self)] = factory
    }
    
    static func registerSingleton<Dependency>(_: Dependency.Type, _ singleton: Dependency) {
        registry[ObjectIdentifier(Dependency.self)] = singleton
    }
    
    static func inject<Dependency>(_: Dependency.Type) throws -> Dependency {
        guard let dependency: Any = registry[ObjectIdentifier(Dependency.self)] else { throw Exception() }
        if let singleton = dependency as? Dependency { return singleton }
        if let factory = dependency as? () -> Dependency { return factory() }
        throw Exception()
    }
    
}
