#!/usr/bin/env perl

# No way to glob recursively
# Guess we're gonna have to do it the old fashioned way
sub find_conf
{
    for my $node (<"$_[0]/"*>)
    {
        if ($node =~ /\.conf$/) { print("$node\n"); }
        if (not -l $node and -d $node) { find_conf($node); }
    }
}

find_conf();
