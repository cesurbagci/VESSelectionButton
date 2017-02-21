//
//  VESSelectionButton.h
//  VESSelectionButton
//
//  Created by developer on 21/02/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN
@interface VESSelectionButton : UIButton

#pragma mark - IBOutlet
@property (nonatomic) IBOutletCollection(VESSelectionButton) NSArray<VESSelectionButton *> *otherButtons;

#pragma mark - properties
@property (nonatomic) BOOL multipleSelectionEnabled;

#pragma mark - methods
- (NSArray<VESSelectionButton *> *)selectedButtons;

@end
NS_ASSUME_NONNULL_END
