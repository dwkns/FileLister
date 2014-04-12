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



@end

