#!/usr/bin/env perl

sub find_conf
{
    for my $node (<"$_[0]/"*>)
    {
        if (not $node =~ "^/home")
        {
            if ($node =~ /\.conf$/)
            {
                print "$node\n";
            }

            if (not -l $node and -d $node)
            {
                find_conf($node);
            }
        }
    }
}

find_conf();
