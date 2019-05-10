//
//  NSString+Manager.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/10.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringMaker : NSObject
-(StringMaker *(^)(NSString *))append;
-(StringMaker *(^)(NSString *, NSString *))replace;
-(StringMaker *(^)(NSString *))remove;
@end

@interface NSString (Manager)
//@property(nonatomic,strong)StringMaker *stringMaker;
+(NSString *)makeString:(void (^)(StringMaker *make))string;
@end




