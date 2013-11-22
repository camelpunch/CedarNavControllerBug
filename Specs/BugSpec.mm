#import "IIViewDeckController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ExampleSpec)

describe(@"using a spied-upon nav controller", ^{
    __block UINavigationController *navController;
    __block UIViewController *spiedUponController;

    beforeEach(^{
        UIViewController* leftController = [[[UIViewController alloc] init] autorelease];
        UIViewController* rightController = [[[UIViewController alloc] init] autorelease];

        spiedUponController = [[[UIViewController alloc] init] autorelease];
        UIViewController *subjectController = [[[UIViewController alloc] init] autorelease];

        navController = [[[UINavigationController alloc] initWithRootViewController:subjectController] autorelease];

        IIViewDeckController* deckController =
        [[[IIViewDeckController alloc] initWithCenterViewController:navController
                                                 leftViewController:leftController
                                                rightViewController:rightController] autorelease];
        deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
        deckController.panningMode = IIViewDeckNoPanning;

        spy_on(spiedUponController);

    });

    it(@"pushes", ^{
        navController.viewControllers = @[spiedUponController];
        navController.viewControllers should equal(@[spiedUponController]);
    });

    xit(@"pops", ^{
        
    });
});

SPEC_END

