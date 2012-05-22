package Data::Serializer::JSON::Any;

use strict;
use warnings;
use base 'Data::Serializer';
use JSON::Any;

our $VERSION = '0.01';

sub serialize {
  return JSON::Any->VERSION < 2 ?
    JSON::Any->new->objToJson($_[1])
    : JSON::Any->new->utf8->encode($_[1]);
}

sub deserialize {
  $_[1] and return JSON::Any->VERSION < 2 ?
    JSON::Any->new->jsonToObj($_[1])
    : JSON::Any->new->utf8->decode($_[1]);
}

1;
