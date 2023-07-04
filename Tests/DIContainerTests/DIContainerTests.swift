import XCTest
@testable import DIContainer

final class DIContainerTests: XCTestCase {
    private var sut: TestA!

    override func setUp() {
        DIContainer.shared.register(type: TestProtocol.self, component: TestB())
        sut = TestA()
    }

    func test_DI_Injection() {
        sut.change(val: 30)
        XCTAssert(sut.i == 900, "value not changed")
    }

    override func tearDown() {
        
    }
}

protocol TestProtocol {
    func modifyTestVal(val: Int) -> Int
}

class TestA {
    @Inject private var testProtocol: TestProtocol
    var i = 0
    func change(val: Int) {
        i = testProtocol.modifyTestVal(val: val)
    }
}

class TestB: TestProtocol {
    init(){}
    func modifyTestVal(val: Int) -> Int {
        val*val
    }
    
}
