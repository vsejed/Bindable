import Foundation

public class Bindable<T> {
    public typealias Listener = (T) -> Void
    var listener: Listener?

    public func bind(_ listener: Listener?) {
        self.listener = listener
    }

    public func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        fire(value)
    }

    public func fire(_ value: T) {
        if Thread.isMainThread {
            listener?(value)
        } else {
            DispatchQueue.main.async {
                self.listener?(value)
            }
        }
    }

    public func fire() {
        fire(value)
    }

    public var value: T {
        didSet {
            fire(value)
        }
    }

    public init(_ value: T) {
        self.value = value
    }
}
