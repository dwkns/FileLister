//
//  File.m
//  FileLister
//
//  Created by dazza on 10/04/2014.
//  Copyright (c) 2014 dazza. All rights reserved.
//

#import "File.h"

@implementation File 

- (void)createFromFilePathString:(NSString *)fileNameString {
    
    // Convert the String to a escaped / encoded string.
    fileNameString = [fileNameString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
   
    // Create a URL from the encoded string
    _fileURL =  [NSURL URLWithString:fileNameString];
    
    // Create a file manager to get the file details
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *attribs = [fm attributesOfItemAtPath:_fileURL.path error:nil];
    
    //Convert the filesize attribute to a bytes / KB / MB formatted string.
    _fileSize = [NSByteCountFormatter stringFromByteCount:[attribs fileSize]
                                               countStyle:NSByteCountFormatterCountStyleFile];

    _fileName = _fileURL.lastPathComponent;
    
   
}
@end




