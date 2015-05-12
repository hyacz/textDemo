//
//  ViewController.m
//  textDemo
//
//  Created by hyacz on 15/5/11.
//  Copyright (c) 2015年 hyaczStudio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *Htextview;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"%@",[self.Htextview.textStorage class]);
    
    
}

- (IBAction)changeColorToButtonBackgroundColor:(UIButton *)sender {
    [self.Htextview.textStorage addAttribute:NSForegroundColorAttributeName
                                       value:sender.backgroundColor
                                       range:self.Htextview.selectedRange];
}

- (IBAction)outlineSelectedTextInTextview:(UIButton *)sender {
    [self.Htextview.textStorage addAttributes:@{
                                                NSStrokeWidthAttributeName : @-3,
                                                NSStrokeColorAttributeName : [UIColor blackColor]}
                                        range:self.Htextview.selectedRange];
}

- (IBAction)unoutlineSelectedTextInTextview:(UIButton *)sender {
    [self.Htextview.textStorage removeAttribute:NSStrokeWidthAttributeName
                                          range:self.Htextview.selectedRange];
}

- (void)changeContentSizeCategory:(NSNotification *)notification{
    [self setToRecommendFont];
}

- (void)setToRecommendFont{
    self.Htextview.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(changeContentSizeCategory:)
                   name:UIContentSizeCategoryDidChangeNotification
                 object:nil];
}


@end
