//
//  File.m
//  FileLister
//
//  Created by dazza on 10/04/2014.
//  Copyright (c) 2014 dazza. All rights reserved.
//

#import "File.h"

@implementation File {


}


-(id)init {
    self = [super init];
    if (self) {
        _fileName = @"testFile";
        _fileSize = 123;
    }
    return self;
}

@end
