//
//  ViewController.h
//  PrimeNumbers
//
//  Created by Oscar Sánchez Ayala on 03/02/15.
//  Copyright (c) 2015 OSA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(void)startProcess;
-(void)printPrimeNumber:(NSNumber *)primeNumber;
-(void)searchPrimeNumber;

@property (assign, nonatomic) int myCount;
@property (strong, nonatomic) NSOperationQueue *myQueue;

@property (weak, nonatomic) IBOutlet UILabel *lblNumbers;
- (IBAction)btnRestart:(id)sender;

@end

