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

- (void) awakeFromNib {
    [self registerForDraggedTypes:@[NSFilenamesPboardType]];
}

// Stop the NSTableView implementation getting in the way
- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender {
	return [self draggingEntered:sender];
}

#pragma GCC diagnostic ignored "-Wundeclared-selector"
- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender {
    NSLog(@"performDragOperation in TableViewDropper.h");
    
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSArray *filenames = [pboard propertyListForType:NSFilenamesPboardType];
    
    id delegate = [self delegate];
    
    if ([delegate respondsToSelector:@selector(doSomething:)]) {
        [delegate performSelector:@selector(doSomething:) withObject:filenames];
    }
    
    highlight=NO;
    [self setNeedsDisplay: YES];
    return YES;
}


- (BOOL)prepareForDragOperation:(id)sender {
    NSLog(@"prepareForDragOperation called in TableViewDropper.h");
    return YES;
}


- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    if (highlight==NO) {
        NSLog(@"drag entered in TableViewDropper.h");
        highlight=YES;
        [self setNeedsDisplay: YES];
    }
   
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

