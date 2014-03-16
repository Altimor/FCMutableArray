//
//  FCMainViewController.m
//  FCMutableArraySample
//
//  Created by Florent Crivello on 3/16/14.
//  Copyright (c) 2014 Indri. All rights reserved.
//

#import "FCMainViewController.h"

@interface FCMainViewController ()

@end

@implementation FCMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Informs the delegate that an object was added to the array
- (void)object:(id)object wasAddedToArray:(FCMutableArray *)array {
	
}

// Informs the delegate that an object was removed from the array
- (void)objectWasRemovedFromArray:(FCMutableArray *)array {
	
}
// Informs the delegate that an object will soon be removed from the array
- (void)object:(id)object willBeRemovedFromArray:(FCMutableArray *)array {
	
}

// Informs the delegate that the array was modified - either by adding, removing or replacing an object
- (void)arrayWasMutated:(FCMutableArray*)array {
	
}

// Asks the delegate if it should add the object to the array
- (BOOL)shouldAddObject:(id)object toArray:(FCMutableArray *)array {
	return YES;
}

// Asks the delegate if it should remove the object from the array
- (BOOL)shouldRemoveObject:(id)object fromArray:(FCMutableArray *)array {
	return YES;
}

- (int) add:(int)A to:(int)B withDeduction:(int)deduction index:(int)index{
	int currentNumberA = A%10;
	int currentNumberB = B%10;
	int result = 0;
	
	int sum = currentNumberA + currentNumberB + deduction;
	int nextDeduction = sum / 2;
	
	result = (sum % 2) * (pow(10, index));
	
	if(A/10+B/10+nextDeduction == 0){
		return result;
	}
	
	return result + [self add:A/10 to:B/10 withDeduction:nextDeduction index:index+1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	FCMutableArray *fcMutableArray = [[FCMutableArray alloc] initWithDelegate:self];
	NSDate *startDate = [NSDate date];
	while (fcMutableArray.count < 100000) {
		[fcMutableArray addObject:[NSNumber numberWithInt:(int)fcMutableArray.count]];
	}
	while (fcMutableArray.count > 0) {
		[fcMutableArray removeLastObject];
	}
	NSLog(@"FCMutableArray : %f",[[NSDate date] timeIntervalSinceDate:startDate]);
	[fcMutableArray removeAllObjects];

	NSMutableArray *nsMutableArray = [NSMutableArray new];
	startDate = [NSDate date];
	while (nsMutableArray.count < 100000) {
		[nsMutableArray addObject:[NSNumber numberWithInt:(int)nsMutableArray.count]];
	}
	while (nsMutableArray.count > 0) {
		[nsMutableArray removeLastObject];
	}
	NSLog(@"NSMutableArray : %f",[[NSDate date] timeIntervalSinceDate:startDate]);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
