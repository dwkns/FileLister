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
- (IBAction)loadSomeFiles:(id)sender {
    // Populate the list with the users Home Directory.
    NSFileManager *fm =  [NSFileManager defaultManager];
    NSString *homeDir = NSHomeDirectory();
    NSArray *files =[fm contentsOfDirectoryAtPath:homeDir error:nil];
     for (id file in files) {
        File *f = [[File alloc] init];
        NSString *fileWithPath = [NSString stringWithFormat:@"%@/%@",homeDir,file];
        [f createFromFilePathString:fileWithPath];
        [fileListArray addObject:f];
    }
    
    [fileListView reloadData];
}

-(IBAction)remove:(id)sender {
    
    NSIndexSet *indexes = [fileListView selectedRowIndexes];
    [fileListArray removeObjectsAtIndexes:indexes];
    [fileListView deselectAll:sender];
    
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

