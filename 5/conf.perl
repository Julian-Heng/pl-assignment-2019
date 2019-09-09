#!/usr/bin/env perl

# No way to glob recursively
# Guess we're gonna have to do it the old fashioned way
sub find_conf
{
    for my $node (<"$_[0]/"*>)
    {
        # Exclude home dir
        if (not $node =~ "^/home")
        {
            if ($node =~ /\.conf$/)
            {
                print("$node\n");
            }

            if (not -l $node and -d $node)
            {
                # Recurse every directory
                find_conf($node);
            }
        }
    }
}

find_conf();
