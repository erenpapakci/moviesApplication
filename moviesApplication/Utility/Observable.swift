//
//  Observable.swift
//  moviesApplication
//
//  Created by Eren Papakçı on 30.08.2020.
//  Copyright © 2020 Eren Papakçı. All rights reserved.
//

import Foundation

public class Observable<T> {
    
    private let thread: DispatchQueue
    
    private var observer: ((T) -> Void)?
    
    private var errorObserver: ((String?) -> Void)?
    
    public var data: T? {
        didSet {
            if let data = self.data {
                thread.async { [weak self] in
                    self?.observer?(data)
                }
            }
        }
    }
    
    public var errorData: String? {
        didSet {
            thread.async { [weak self] in
                self?.errorObserver?(self?.errorData)
            }
        }
    }
    
    init(_ data: T? = nil, thread: DispatchQueue = DispatchQueue.main) {
        self.thread = thread
        self.data = data
    }
    
    public func addObserver(observer: @escaping ((T) -> Void)) {
        self.observer = observer
    }
    
    public func addErrorObserver(observer: @escaping ((String?) -> Void)) {
        self.errorObserver = observer
    }
    
    public func removeObservers() {
        observer = nil
        errorObserver = nil
    }
}
