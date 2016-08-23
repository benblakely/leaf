private var workDir: String {
    let parent = #file.characters.split(separator: "/").map(String.init).dropLast().joined(separator: "/")
    let path = "/\(parent)/../../Resources/"
    return path
}

public final class Stem {
    public let workingDirectory: String
    public fileprivate(set) var tags: [String: Tag] = defaultTags
    public fileprivate(set) var cache: [String: Leaf] = [:]

    public init(workingDirectory: String = workDir) {
        self.workingDirectory = workingDirectory.finished(with: "/")
    }
}

extension Stem {
    public func cache(_ leaf: Leaf, named name: String) {
        cache[name] = leaf
    }
}

extension Stem {
    public func register(_ tag: Tag) {
        tags[tag.name] = tag
    }

    public func remove(_ tag: Tag) {
        removeTag(named: tag.name)
    }

    public func removeTag(named name: String) {
        tags[name] = nil
    }
}
