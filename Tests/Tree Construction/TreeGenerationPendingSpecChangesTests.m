// This file was autogenerated from Tests/html5lib/tree-construction/pending-spec-changes.dat

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTreeConstructionTestUtilities.h"

@interface TreeGenerationPendingSpecChangesTests : SenTestCase

@end

@implementation TreeGenerationPendingSpecChangesTests

- (void)test000
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<input type=\"hidden\"><frameset>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <frameset>\n");
    HTMLAssertParserState(parser, 3, fixture, nil);
}

- (void)test001
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><table><caption><svg>foo</table>bar"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <table>\n|       <caption>\n|         <svg svg>\n|           \"foo\"\n|     \"bar\"\n");
    HTMLAssertParserState(parser, 4, fixture, nil);
}

- (void)test002
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<table><tr><td><svg><desc><td></desc><circle>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <table>\n|       <tbody>\n|         <tr>\n|           <td>\n|             <svg svg>\n|               <svg desc>\n|           <td>\n|             <circle>\n");
    HTMLAssertParserState(parser, 8, fixture, nil);
}

@end
