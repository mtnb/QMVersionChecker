//
//  QMVersionUpCheckerTests.m
//  versionUpChecker
//
//  Created by Muto Nobuhito on 2015/11/22.
//  Copyright © 2015年 Muto Nobuhito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QMVersionUpChecker.h"

@interface QMVersionUpCheckerTests : XCTestCase{
QMVersionUpChecker *checker;
}

@end

@implementation QMVersionUpCheckerTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    //[[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    checker = [[QMVersionUpChecker alloc]init];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testVersionUpChecker {
    //True pattern
    XCTAssertTrue([checker isNeedUpdate:@"1.1" :@"1.0"]);
    XCTAssertTrue([checker isNeedUpdate:@"1.1.0" :@"1.0"]);
    XCTAssertTrue([checker isNeedUpdate:@"1.1" :@"1.0.0"]);
    XCTAssertTrue([checker isNeedUpdate:@"1.11" :@"1.9"]);
    XCTAssertTrue([checker isNeedUpdate:@"1.21.0" :@"1.9.0"]);
    XCTAssertTrue([checker isNeedUpdate:@"2.1.0" :@"1.9.0"]);
    XCTAssertTrue([checker isNeedUpdate:@"2.0.1" :@"1.0.9"]);
    XCTAssertTrue([checker isNeedUpdate:@"2.0.1" :@"1.0.0.0.0.1"]);
    //False pattern
    XCTAssertFalse([checker isNeedUpdate:@"1.0" :@"1.0"]);
    XCTAssertFalse([checker isNeedUpdate:@"0.9" :@"1.0"]);
    XCTAssertFalse([checker isNeedUpdate:@"1.2" :@"1.6"]);
    XCTAssertFalse([checker isNeedUpdate:@"1.2.0" :@"1.6"]);
    XCTAssertFalse([checker isNeedUpdate:@"1.2" :@"1.6.0"]);
    XCTAssertFalse([checker isNeedUpdate:@"1.9" :@"1.11"]);
    XCTAssertFalse([checker isNeedUpdate:@"1.9.0" :@"1.11.0"]);
    //Exception pattern
    XCTAssertThrows([checker isNeedUpdate:@"1" :@"1.2"]);
    XCTAssertThrows([checker isNeedUpdate:@"1.2" :@"1"]);

}

- (void)testVersionUpCheckerSingle {
    //True pattern
    XCTAssertTrue([checker isNeedUpdate:@"1.1"]);
    XCTAssertTrue([checker isNeedUpdate:@"2.1"]);
    XCTAssertTrue([checker isNeedUpdate:@"1.0.1"]);
    XCTAssertTrue([checker isNeedUpdate:@"2.1.0"]);
    XCTAssertTrue([checker isNeedUpdate:@"1.0.0.1"]);
    //False pattern
    XCTAssertFalse([checker isNeedUpdate:@"1.0"]);
    XCTAssertFalse([checker isNeedUpdate:@"0.9"]);
    XCTAssertFalse([checker isNeedUpdate:@"0.9.1"]);
    XCTAssertFalse([checker isNeedUpdate:@"0.1.0"]);
    XCTAssertFalse([checker isNeedUpdate:@"0.0.0.1"]);
    //Exception pattern
    XCTAssertThrows([checker isNeedUpdate:@"1"]);
    XCTAssertThrows([checker isNeedUpdate:@"2"]);
}

@end
