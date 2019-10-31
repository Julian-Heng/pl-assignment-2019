#!/usr/bin/env perl

# No way to glob recursively
# Guess we're gonna have to do it the old fashioned way
sub find_conf
{
    # For every file in directory
    for my $node (<"$_[0]/"*>)
    {
        # Print if file ends in .conf
        if ($node =~ /\.conf$/) { print("$node\n"); }

        # If it's not a symbolic link and is a directory, recurse
        if (not -l $node and -d $node) { find_conf($node); }
    }
}

find_conf();
