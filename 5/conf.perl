#!/usr/bin/env perl

sub find_conf
{
    for my $element (@_)
    {
        for my $node (<"$element/"*[!home]>)
        {
            if (not -l $node)
            {
                if (-d $node)
                {
                    find_conf($node);
                }
                elsif (-f $node and $node =~ /\.conf$/)
                {
                    print "$node\n";
                }
            }
        }
    }
}

find_conf(<"/"*[!home]>);
