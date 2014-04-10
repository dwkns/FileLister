//
//  FileListController.m
//  FileLister
//
//  Created by dazza on 10/04/2014.
//  Copyright (c) 2014 dazza. All rights reserved.
//

#import "FileListController.h"
#import "File.h"

@implementation FileListController {
   
}

-(id)init {
    self = [super init];
    if (self) {
        fileListArray = [[NSMutableArray alloc] init];
    }
    [self addSampleFiles];
    return self;
}

#pragma mark -- Actions
-(IBAction)add:(id)sender {
    [self addOneTestFile];
}

-(IBAction)remove:(id)sender {
    NSInteger selectedRow = [fileListView selectedRow];
    if (selectedRow >= 0) {
        [fileListArray removeObjectAtIndex:selectedRow];
        [fileListView reloadData];
    }
    
}


#pragma mark -- Test data methods
- (void)addOneTestFile {
    File *f = [[File alloc] init];
    [fileListArray addObject:f];
    [fileListView reloadData];
}

- (void)addSampleFiles {
    File *f1 = [[File alloc] init];
    f1.fileName = @"file1.txt";
    f1.fileSize = 1231;
    [fileListArray addObject:f1];
    
    File *f2 = [[File alloc] init];
    f2.fileName = @"file2.txt";
    f2.fileSize = 1232;
    [fileListArray addObject:f2];
    
    File *f3 = [[File alloc] init];
    f3.fileName = @"file3.txt";
    f3.fileSize = 1233;
    [fileListArray addObject:f3];
    
    File *f4 = [[File alloc] init];
    f4.fileName = @"file4.txt";
    f4.fileSize = 1234;
    [fileListArray addObject:f4];
    
    [fileListView reloadData];
}


#pragma mark -- NSTableView protocol methods
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [fileListArray count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    File *p = [fileListArray objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    return [p valueForKey:identifier];
    }
@end

