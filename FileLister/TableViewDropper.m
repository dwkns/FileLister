//
//  TableViewDropper.m
//  FileLister
//
//  Created by dazza on 10/04/2014.
//  Copyright (c) 2014 dazza. All rights reserved.
//

#import "TableViewDropper.h"

@implementation TableViewDropper {
    BOOL highlight;
}


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        NSLog(@"init in initWithFrame in TableViewDropper.h");
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code here.
        NSLog(@"init in initWithCoder in TableViewDropper.h");
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
    }
    return self;
    
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender {
    NSLog(@"performDragOperation in TableViewDropper.h");
    return YES;
}


- (BOOL)prepareForDragOperation:(id)sender {
    NSLog(@"prepareForDragOperation called in TableViewDropper.h");
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSArray *filenames = [pboard propertyListForType:NSFilenamesPboardType];
    
    
    NSLog(@"%@",filenames);
    return YES;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    highlight=YES;
    [self setNeedsDisplay: YES];
    NSLog(@"drag entered in TableViewDropper.h");
    
    // this defines what the drop target can do
    // Can be copy, link, move, delete or none to do nothing.
    return NSDragOperationCopy;
}

- (void)draggingExited:(id)sender
{
    highlight=NO;
    
    [self setNeedsDisplay: YES];
    NSLog(@"drag exit in TableViewDropper.h");
}

-(void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    if ( highlight ) {
        //highlight by overlaying a gray border
        [[NSColor greenColor] set];
        [NSBezierPath setDefaultLineWidth: 18];
        [NSBezierPath strokeRect: rect];
    }
}

@end

