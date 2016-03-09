//
//  ViewController.m
//  queens
//
//  Created by Ido on 10/28/15.
//  Copyright © 2015 punch. All rights reserved.
//

#import "ViewController.h"
#import "TTTGame.h"
#import "TTTBoardView.h"
#import "TTTCellView.h"
#import "queens-Swift.h"

@interface ViewController () <QueenPlacementDelegate>
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (nonatomic ,strong) TTTBoardView *boardView;
@property (weak, nonatomic) IBOutlet UILabel *solutionLabel;
@property (weak, nonatomic) IBOutlet UILabel *numCellsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *numCellsStepper;
@property (weak, nonatomic) IBOutlet UIStepper *solutionStepper;
@property (nonatomic) NSUInteger solutionsFound;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.solutionLabel.hidden = YES;
    self.solutionStepper.hidden = YES;
    self.numCellsLabel.text = @"4x4";
    self.numCellsStepper.minimumValue = 4;
    self.numCellsStepper.maximumValue = 20;
    
    self.solutionStepper.minimumValue = 1;
    [QueenPlacement sharedInstance].delegate = self;

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewForSolution:(NSUInteger)index {
    if (self.boardView)
    {
        [self.boardView removeFromSuperview];
        self.boardView = nil;
    }
    NSArray<Solution *> *solutionArray = [[QueenPlacement sharedInstance].solutions allObjects];
    Solution *solution = solutionArray[index-1];
    
    self.solutionLabel.text = [NSString stringWithFormat:@"Solution #%ld of %ld",index,self.solutionsFound];
    self.boardView = [[TTTBoardView alloc] initWithFrame:self.gameView.bounds andBoard:solution.board];
    [self.gameView addSubview:self.boardView];
    [self.gameView bringSubviewToFront:self.boardView];
    

}

- (IBAction)solutionStepperChanged:(id)sender {
    
    int solutionNumber = (int)self.solutionStepper.value;
    [self updateViewForSolution:solutionNumber];
    
}

- (IBAction)stepperChanged:(id)sender
{
    self.numCellsLabel.text = [NSString stringWithFormat:@"%dx%d",(int)self.numCellsStepper.value,(int)self.numCellsStepper.value];
    
}

- (IBAction)start:(id)sender {
    [[QueenPlacement sharedInstance] setBoardSize:self.numCellsStepper.value];
    [[QueenPlacement sharedInstance] start];
    
}

-(void)solutionsFound:(NSInteger)numOfSolutions {
    if (numOfSolutions > 0) {
        self.solutionsFound = numOfSolutions;
        self.solutionStepper.maximumValue = numOfSolutions;
        self.solutionStepper.hidden = NO;
        self.solutionLabel.hidden = NO;

        [self updateViewForSolution:1];
        
    }
}


@end
