// This file was autogenerated from Tests/html5lib/tree-construction/comments01.dat

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTreeConstructionTestUtilities.h"

@interface TreeGenerationComments01Tests : SenTestCase

@end

@implementation TreeGenerationComments01Tests

- (void)test000
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-- BAR -->BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  BAR  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test001
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-- BAR --!>BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  BAR  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test002
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-- BAR --   >BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  BAR --   >BAZ -->\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test003
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-- BAR -- <QUX> -- MUX -->BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  BAR -- <QUX> -- MUX  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test004
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-- BAR -- <QUX> -- MUX --!>BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  BAR -- <QUX> -- MUX  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test005
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-- BAR -- <QUX> -- MUX -- >BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  BAR -- <QUX> -- MUX -- >BAZ -->\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test006
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!---->BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test007
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!--->BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test008
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!-->BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!--  -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test009
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<?xml version=\"1.0\">Hi"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!-- ?xml version=\"1.0\" -->\n| <html>\n|   <head>\n|   <body>\n|     \"Hi\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test010
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<?xml version=\"1.0\">"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!-- ?xml version=\"1.0\" -->\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test011
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<?xml version"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!-- ?xml version -->\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test012
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"FOO<!----->BAZ"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"FOO\"\n|     <!-- - -->\n|     \"BAZ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test013
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<html><!-- comment --><title>Comment before head</title>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <!--  comment  -->\n|   <head>\n|     <title>\n|       \"Comment before head\"\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

@end
