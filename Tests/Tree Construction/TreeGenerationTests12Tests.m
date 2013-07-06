// This file was autogenerated from Tests/html5lib/tree-construction/tests12.dat

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTreeConstructionTestUtilities.h"

@interface TreeGenerationTests12Tests : SenTestCase

@end

@implementation TreeGenerationTests12Tests

- (void)test000
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><body><p>foo<math><mtext><i>baz</i></mtext><annotation-xml><svg><desc><b>eggs</b></desc><g><foreignObject><P>spam<TABLE><tr><td><img></td></table></foreignObject></g><g>quux</g></svg></annotation-xml></math>bar"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <p>\n|       \"foo\"\n|       <math math>\n|         <math mtext>\n|           <i>\n|             \"baz\"\n|         <math annotation-xml>\n|           <svg svg>\n|             <svg desc>\n|               <b>\n|                 \"eggs\"\n|             <svg g>\n|               <svg foreignObject>\n|                 <p>\n|                   \"spam\"\n|                 <table>\n|                   <tbody>\n|                     <tr>\n|                       <td>\n|                         <img>\n|             <svg g>\n|               \"quux\"\n|       \"bar\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test001
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><body>foo<math><mtext><i>baz</i></mtext><annotation-xml><svg><desc><b>eggs</b></desc><g><foreignObject><P>spam<TABLE><tr><td><img></td></table></foreignObject></g><g>quux</g></svg></annotation-xml></math>bar"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     \"foo\"\n|     <math math>\n|       <math mtext>\n|         <i>\n|           \"baz\"\n|       <math annotation-xml>\n|         <svg svg>\n|           <svg desc>\n|             <b>\n|               \"eggs\"\n|           <svg g>\n|             <svg foreignObject>\n|               <p>\n|                 \"spam\"\n|               <table>\n|                 <tbody>\n|                   <tr>\n|                     <td>\n|                       <img>\n|           <svg g>\n|             \"quux\"\n|     \"bar\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

@end
