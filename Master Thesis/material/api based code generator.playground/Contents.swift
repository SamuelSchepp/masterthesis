import UIKit

protocol Generateable {
    func generate() -> String
}

enum TypeAttributes: Generateable {
    case `private`, `public`, `default`
    
    func generate() -> String {
        switch self {
        case .private:
            return "private"
        case .public:
            return "public"
        case .default:
            return "default"
        }
    }
}

class ClassDeclaration: Generateable {
    
    let name: String
    var baseType: ClassDeclaration?
    var typeAttributes: TypeAttributes
    
    init(_ name: String) {
        self.name = name
        baseType = nil
        typeAttributes = .default
    }
    
    func generate() -> String {
        let extends: String
        if let baseType = baseType {
            extends = "extends \(baseType.name)"
        } else {
            extends = ""
        }
        return "\(typeAttributes.generate()) class \(name) \(extends) {\n\n}"
    }
}

let personClass = ClassDeclaration("Person")

let studentClass = ClassDeclaration("Student");
studentClass.baseType = personClass
studentClass.typeAttributes = TypeAttributes.public

studentClass.generate()
