//
//  FileListController.h
//  FileLister
//
//  Created by dazza on 10/04/2014.
//  Copyright (c) 2014 dazza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileListController : NSObject <NSTableViewDataSource> {
     NSMutableArray *fileListArray;
    IBOutlet NSTableView *fileListView;

}
-(IBAction)add:(id)sender;
-(IBAction)remove:(id)sender;
-(void)doSomething:(NSArray *)files;
@end
