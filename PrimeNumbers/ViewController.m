//
//  ViewController.m
//  PrimeNumbers
//
//  Created by Oscar Sánchez Ayala on 03/02/15.
//  Copyright (c) 2015 OSA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myCount = _myCount;
@synthesize myQueue = _myQueue;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myCount = 2;
    [self startProcess];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)startProcess
{
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(searchPrimeNumber) object:nil];
    self.myQueue = [[NSOperationQueue alloc] init];
    self.myQueue.name = @"PrimeNumbers";
    [self.myQueue addOperation:op];
}

-(void)searchPrimeNumber
{
    for(int i = 2; i < self.myCount + 1; i++)
    {
        self.myCount++;
        bool isPrime = true;
        
        for(int j = 2; j < i; j++)
        {
            if (i % j == 0) {
                isPrime = false;
                break;
            }
        }
        
        if (isPrime) {
            NSNumber *primeNumber = [NSNumber numberWithInt:i];
            [self performSelectorOnMainThread:@selector(printPrimeNumber:) withObject:primeNumber waitUntilDone:YES];
            
            NSLog(@"%d", i);
            
            [NSThread sleepForTimeInterval:1.5];
        }
    }
}

-(void)printPrimeNumber:(NSNumber *)primeNumber
{
    self.lblNumbers.text = [NSString stringWithFormat:@"%d", [primeNumber intValue]];
}

- (IBAction)btnRestart:(id)sender {
    
    self.myCount = 2;
    [self.myQueue cancelAllOperations];
    [self startProcess];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.myQueue cancelAllOperations];
    [super viewWillDisappear:animated];
}
@end
