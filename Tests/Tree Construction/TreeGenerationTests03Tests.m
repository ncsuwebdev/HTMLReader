// This file was autogenerated from Tests/html5lib/tree-construction/tests3.dat

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTreeConstructionTestUtilities.h"

@interface TreeGenerationTests03Tests : SenTestCase

@end

@implementation TreeGenerationTests03Tests

- (void)test000
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<head></head><style></style>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|     <style>\n|   <body>\n");
    HTMLAssertParserState(parser, 2, fixture, nil);
}

- (void)test001
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<head></head><script></script>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|     <script>\n|   <body>\n");
    HTMLAssertParserState(parser, 2, fixture, nil);
}

- (void)test002
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<head></head><!-- --><style></style><!-- --><script></script>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|     <style>\n|     <script>\n|   <!--   -->\n|   <!--   -->\n|   <body>\n");
    HTMLAssertParserState(parser, 2, fixture, nil);
}

- (void)test003
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<head></head><!-- -->x<style></style><!-- --><script></script>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <!--   -->\n|   <body>\n|     \"x\"\n|     <style>\n|     <!--   -->\n|     <script>\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

- (void)test004
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>\n</pre></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test005
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>\nfoo</pre></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"foo\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test006
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>\n\nfoo</pre></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test007
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>\nfoo\n</pre></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"foo\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test008
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>x</pre><span>\n</span></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"x\"\n|     <span>\n|       \"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test009
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>x\ny</pre></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"x\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test010
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><pre>x<div>\ny</pre></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"x\"\n|       <div>\n|         \"\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

- (void)test011
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><pre>&#x0a;&#x0a;A</pre>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <pre>\n|       \"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test012
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><HTML><META><HEAD></HEAD></HTML>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|     <meta>\n|   <body>\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

- (void)test013
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><HTML><HEAD><head></HEAD></HTML>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

- (void)test014
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<textarea>foo<span>bar</span><i>baz"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <textarea>\n|       \"foo<span>bar</span><i>baz\"\n");
    HTMLAssertParserState(parser, 2, fixture, nil);
}

- (void)test015
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<title>foo<span>bar</em><i>baz"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|     <title>\n|       \"foo<span>bar</em><i>baz\"\n|   <body>\n");
    HTMLAssertParserState(parser, 2, fixture, nil);
}

- (void)test016
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><textarea>\n</textarea>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <textarea>\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test017
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><textarea>\nfoo</textarea>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <textarea>\n|       \"foo\"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test018
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><textarea>\n\nfoo</textarea>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <textarea>\n|       \"\n");
    HTMLAssertParserState(parser, 0, fixture, nil);
}

- (void)test019
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!DOCTYPE html><html><head></head><body><ul><li><div><p><li></ul></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <ul>\n|       <li>\n|         <div>\n|           <p>\n|       <li>\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

- (void)test020
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!doctype html><nobr><nobr><nobr>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <nobr>\n|     <nobr>\n|     <nobr>\n");
    HTMLAssertParserState(parser, 3, fixture, nil);
}

- (void)test021
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!doctype html><nobr><nobr></nobr><nobr>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <nobr>\n|     <nobr>\n|     <nobr>\n");
    HTMLAssertParserState(parser, 2, fixture, nil);
}

- (void)test022
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<!doctype html><html><body><p><table></table></body></html>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <!DOCTYPE html>\n| <html>\n|   <head>\n|   <body>\n|     <p>\n|     <table>\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

- (void)test023
{
    HTMLParser *parser = [[HTMLParser alloc] initWithString:@"<p><table></table>"];
    NSArray *fixture = ReifiedTreeForTestDocument(@"| <html>\n|   <head>\n|   <body>\n|     <p>\n|       <table>\n");
    HTMLAssertParserState(parser, 1, fixture, nil);
}

@end
