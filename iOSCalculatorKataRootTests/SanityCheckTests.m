#import <SenTestingKit/SenTestingKit.h>
#import "OCMockObject.h"
#import "ISanityCheckRepository.h"

@interface SanityCheckTests : SenTestCase

@end

@implementation SanityCheckTests

-(void)test_SanityCheckOCUnit {

    STAssertTrue(true, nil);
}

-(void)test_SanityCheckOCMock {

    id sanityCheckRepository = [OCMockObject mockForProtocol:@protocol(ISanityCheckRepository)];
    [sanityCheckRepository verify];
}
@end
