//
//  NSObject+Property.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/20.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

//得到当前的所有@property键值对
-(NSDictionary *)propertyDictionary;
- (NSDictionary*)dictionaryValue;

- (NSArray*)allPropertyKeys;
+ (NSArray *)classPropertyList;

- (NSArray*)allPropertyKeyPaths;

// Exclude container type keypaths
- (NSArray*)allBasePropertyKeyPaths;
- (BOOL)hasPropertyForKey:(NSString*)key;
- (BOOL)hasIvarForKey:(NSString*)key;
- (id)valueForArrayIndexedKeyPath:(NSString *)keyPath;

@end
