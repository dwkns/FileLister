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
        [self addSampleFiles];
    }
   
    return self;
}

-(void)doSomething:(NSArray *)files {
    NSLog(@"do something called");
    for (id file in files) {
        NSLog(@" the file is : %@",file);
        
            File *f = [[File alloc] init];
            [f createFromFilePathString:file];
    
            [fileListArray addObject:f];
            [fileListView reloadData];
    }
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



#pragma mark -- NSTableView protocol methods
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [fileListArray count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    File *p = [fileListArray objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    return [p valueForKey:identifier];
    }

#pragma mark -- Test data methods
- (void)addOneTestFile {
    File *f = [[File alloc] init];
    f.fileName = @"~/Desktop/temp/file1.txt";
    [fileListArray addObject:f];
    [fileListView reloadData];
}

- (void)addSampleFiles {
    File *f1 = [[File alloc] init];
    [f1 createFromFilePathString:@"/Users/dazza/Desktop/temp/file 1.txt"];
    [fileListArray addObject:f1];
    
    File *f2 = [[File alloc] init];
    [f2 createFromFilePathString:@"/Users/dazza/Desktop/temp/file2.txt"];
    [fileListArray addObject:f2];
    
    File *f3 = [[File alloc] init];
    [f3 createFromFilePathString:@"/Users/dazza/Desktop/temp/file3.txt"];
    [fileListArray addObject:f3];
    
    File *f4 = [[File alloc] init];
    [f4 createFromFilePathString:@"/Users/dazza/Desktop/temp/file4.txt"];
    [fileListArray addObject:f4];
    
    File *f5 = [[File alloc] init];
    [f5 createFromFilePathString:@"/Users/dazza/Desktop/temp/file5.txt"];
    [fileListArray addObject:f5];
    
    [fileListView reloadData];
}


@end

