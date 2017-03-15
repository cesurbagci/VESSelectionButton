//
//  VESSelectionButton.h
//  VESSelectionButton
//
//  Created by developer on 21/02/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VESSelectionButtonDelegate <NSObject>

@optional

-(void) didSelectSelectionButton:( UIButton * _Nullable )selectedItem;
-(void) didDeSelectSelectionButton:( UIButton * _Nullable )deSelectedItem;

@end

IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN
@interface VESSelectionButton : UIButton

#pragma mark - IBOutlet
@property (nonatomic) IBOutletCollection(VESSelectionButton) NSArray<VESSelectionButton *> *otherButtons;

#pragma mark - properties
@property (nonatomic) IB_DESIGNABLE BOOL multipleSelectionEnabled;

#pragma mark - methods
// return selected buttons
- (NSArray<VESSelectionButton *> *)selectedButtons;
- (VESSelectionButton *)selectedButton;
#pragma mark - delegates
@property (nonatomic, weak) id<VESSelectionButtonDelegate> delegate;

@end
NS_ASSUME_NONNULL_END
