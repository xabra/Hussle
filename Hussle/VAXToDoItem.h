//
//  VAXToDoItem.h
//  ToDoList7.1
//
//  Created by Adam Brailove on 7/4/14.
//  Copyright (c) 2014 Vaxis Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAXToDoItem : NSObject


@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;



@end
