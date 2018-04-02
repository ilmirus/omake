// Omake meta programming language compiler: dlang runtime support library.
// Copyright (C) 2018  Ilmir Usmanov
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

module omake.error;

import omake.lexer;
import std.exception;
import std.string;

class OmakeException: Exception {
  mixin basicExceptionCtors;
}

void error(string description, Locus locus) {
  throw OmakeException(
    "%s at %s:%s".format(description, locus.raw, locus.column));
}

char check_character_literal(string c, Locus locus) {
  if (c.length() != 1)
    error("wrong character literal: " ~ c, locus);
  else
    return c[0];
}
