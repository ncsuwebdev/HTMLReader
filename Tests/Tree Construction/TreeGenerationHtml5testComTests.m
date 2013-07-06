// This file was autogenerated from Tests/html5lib/tree-construction/html5test-com.dat

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTreeConstructionTestUtilities.h"

@interface TreeGenerationHtml5testComTests : SenTestCase

@end

@implementation TreeGenerationHtml5testComTests

- (void)test000
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<div<div>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <div<div>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test001
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<div foo<bar=''>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <div>\n|       foo<bar=\"\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test002
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<div foo=`bar`>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <div>\n|       foo=\"`bar`\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test003
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<div \\\"foo=''>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <div>\n|       \\\"foo=\"\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test004
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<a href='\\nbar'></a>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <a>\n|       href=\"\\nbar\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test005
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test006
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"&lang;&rang;"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"⟨⟩\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test007
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"&apos;"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"'\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test008
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"&ImaginaryI;"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"ⅈ\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test009
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"&Kopf;"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"𝕂\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test010
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"&notinva;"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     \"∉\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test011
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<?import namespace=\"foo\" implementation=\"#bar\">"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!-- ?import namespace=\"foo\" implementation=\"#bar\" -->\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test012
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!--foo--bar-->"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!-- foo--bar -->\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test013
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<![CDATA[x]]>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!-- [CDATA[x]] -->\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test014
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<textarea><!--</textarea>--></textarea>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <textarea>\n|       \"<!--\"\n|     \"-->\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test015
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<textarea><!--</textarea>-->"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <textarea>\n|       \"<!--\"\n|     \"-->\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test016
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<style><!--</style>--></style>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|     <style>\n|       \"<!--\"\n|   <body>\n|     \"-->\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test017
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<style><!--</style>-->"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|     <style>\n|       \"<!--\"\n|   <body>\n|     \"-->\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test018
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<ul><li>A </li> <li>B</li></ul>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <ul>\n|       <li>\n|         \"A \"\n|       \" \"\n|       <li>\n|         \"B\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test019
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<table><form><input type=hidden><input></form><div></div></table>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <input>\n|     <div>\n|     <table>\n|       <form>\n|       <input>\n|         type=\"hidden\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test020
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<i>A<b>B<p></i>C</b>D"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <i>\n|       \"A\"\n|       <b>\n|         \"B\"\n|     <b>\n|     <p>\n|       <b>\n|         <i>\n|         \"C\"\n|       \"D\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test021
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<div></div>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <div>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test022
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<svg></svg>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <svg svg>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test023
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<math></math>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <math math>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

@end
