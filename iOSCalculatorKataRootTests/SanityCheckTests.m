#import <SenTestingKit/SenTestingKit.h>
#import "OCMockObject.h"
#import "ISanityCheckRepository.h"

@interface SanityCheckTests : SenTestCase

@end

@implementation SanityCheckTests

-(void)testSanityCheckOCMock {
    id sanityCheckRepository = [OCMockObject mockForProtocol:@protocol(ISanityCheckRepository)];
    [sanityCheckRepository verify];
}
@end
