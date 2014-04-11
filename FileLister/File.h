//
//  File.h
//  FileLister
//
//  Created by dazza on 10/04/2014.
//  Copyright (c) 2014 dazza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File : NSObject {
//    NSString *fileName;
//    int fileSize;
}

@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *fileSize;
@property  (nonatomic, copy) NSURL *fileURL;
- (void)createFromFilePathString:(NSString *)fileNameString;

@end
