//
//  VESSelectionButton.m
//  VESSelectionButton
//
//  Created by developer on 21/02/17.
//  Copyright © 2017 developer. All rights reserved.
//

#import "VESSelectionButton.h"

static BOOL _groupModifing = NO;

@implementation VESSelectionButton

- (void)setMultipleSelectionEnabled:(BOOL)multipleSelectionEnabled {
    if (![VESSelectionButton isGroupModifing]) {
        [VESSelectionButton groupModifing:YES];
        for (VESSelectionButton *radioButton in self.otherButtons) {
            radioButton.multipleSelectionEnabled = multipleSelectionEnabled;
        }
        [VESSelectionButton groupModifing:NO];
    }
    _multipleSelectionEnabled = multipleSelectionEnabled;
}

#pragma mark - public methods

- (void)setOtherButtons:(NSArray *)otherButtons {
    if (![VESSelectionButton isGroupModifing]) {
        [VESSelectionButton groupModifing:YES];
        for (VESSelectionButton *radioButton in otherButtons) {
            NSMutableArray *otherButtonsForCurrentButton = [[NSMutableArray alloc] initWithArray:otherButtons];
            [otherButtonsForCurrentButton addObject:self];
            [otherButtonsForCurrentButton removeObject:radioButton];
            [radioButton setOtherButtons:[otherButtonsForCurrentButton copy]];
        }
        [VESSelectionButton groupModifing:NO];
    }
    
    _otherButtons = otherButtons;
}

- (VESSelectionButton *)selectedButton {
    if (!self.multipleSelectionEnabled) {
        if (self.selected) {
            return self;
        } else {
            for (VESSelectionButton *radioButton in self.otherButtons) {
                if (radioButton.selected) {
                    return radioButton;
                }
            }
        }
    }
    return nil;
}

- (NSArray *)selectedButtons {
    NSMutableArray *selectedButtons = [[NSMutableArray alloc] init];
    if (self.selected) {
        [selectedButtons addObject:self];
    }
    for (VESSelectionButton *radioButton in self.otherButtons) {
        if (radioButton.selected) {
            [selectedButtons addObject:radioButton];
        }
    }
    return selectedButtons;
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initRadioButton];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initRadioButton];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self drawButton];
}

- (void)prepareForInterfaceBuilder {
    [self initRadioButton];
    [self drawButton];
}

#pragma mark - UIControl

- (void)setSelected:(BOOL)selected {
    BOOL currentSelected = selected;
    
    if (self.multipleSelectionEnabled) {
        currentSelected = !self.isSelected;
        [super setSelected:!self.isSelected];
    } else {
        
        if (selected) {
            if (!self.isSelected &&
                [self.delegate conformsToProtocol:@protocol(VESSelectionButtonDelegate)] &&
                [self.delegate respondsToSelector:@selector(didSelectSelectionButton:)]) {
                
                [self.delegate didSelectSelectionButton:self];
            }
            [self deselectOtherButtons];
        }else {
            if (self.isSelected &&
                [self.delegate conformsToProtocol:@protocol(VESSelectionButtonDelegate)] &&
                [self.delegate respondsToSelector:@selector(didDeSelectSelectionButton:)]) {
                
                [self.delegate didDeSelectSelectionButton:self];
            }
        }
        
        [super setSelected:selected];
        if (selected) {
            [self deselectOtherButtons];
        }
    }
    
    if (currentSelected) {
        [self setBackgroundColor:self.tintColor];
    }else {
        [self setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark - events

- (void)touchUpInside {
    [self setSelected:YES];
}

#pragma mark - private methods

- (void)drawButton {
    UIColor *defaulColor = self.selected ? [self titleColorForState:UIControlStateSelected | UIControlStateHighlighted] : [self titleColorForState:UIControlStateNormal];
    
    NSLog(@"%@",defaulColor);
}

- (void)initRadioButton {
    //    _iconSize = kDefaultIconSize;
    //    _marginWidth = kDefaultMarginWidth;
    //    _animationDuration = kDefaultAnimationDuration;
    [super addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self.layer setCornerRadius:5.0f];
    [self.layer setBorderWidth:1.0f];
    [self setClipsToBounds:YES];
    
    
    //    [self setTintColor:self.tintColor];
}

- (void)deselectOtherButtons {
    for (UIButton *button in self.otherButtons) {
        [button setSelected:NO];
        //        [self.layer setBackgroundColor:(__bridge CGColorRef _Nullable)([self titleForState:UIControlStateNormal])];
    }
}

+ (void)groupModifing:(BOOL)chaining {
    _groupModifing = chaining;
}

+ (BOOL)isGroupModifing {
    return _groupModifing;
}

@end
