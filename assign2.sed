#!/bin/sed

##### assign2.sed #####
## Author: Aidan Chang  rnl094
## this is a sed program that uses mostly subsitution commands of sed, when called by assign2.bash, that
## deletes lines marked for deletion, and certain pieces of private information about a student
## the replacements are only made for matches that are independent words and not part of a larger word

#### THESE ARE STRINGS TO BE REPLACED:
# Student myUTSA ID’s consist of abc123, where abc123 represents an actual myUTSA ID.
# These ID’s should be redacted by simply replacing them with the sequence XYZ000.

# Student Banner ID numbers must be redacted, and are identifiable as consisting of a sequence
# beginning with an “at-sign“ (@) followed by precisely eight (8) digits, as in: @83098247.
# These ID numbers should be replaced simply with the sequence @XXXXXXXX.

# Student Grades should be similarly obliterated. Grade letters will consist of a single letter
# (case-insensitive) from the set {A, B, C, D, F}, optionally followed by a symbol from the set
# {+, −}. Grades should be redacted through simple substitution with the character X.

# Student Grade Point Averages will consist of a single digit from the set {0, 1, 2, 3, 4}, followed
# by a period / dot (.) and ending with one to three digit decimal places. GPA’s should simply be
# replaced with the sequence “X.X”.

# Lines slated for redaction will consist of a line that begins with one or more “X” characters.
# When these lines are encountered, they should be deleted in their entirety

# HINT: use \W character class, covers multiple groups & can be used instead of using beginning of line, middle, end of line
# \W basically matches: [^a-zA-Z0-9_]


# delete redaction lines, this is at top in case beginning of line is replaces with "XYZ000" for example
/^[X]/d

## The logic for repeating lines here is to solve 1 specific problem:
## whenever "\W" makes a match on a non-word character, it uses that match so the space for example cannot be used in another match
## if two abc123's are separated by a single space, the command runs twice in order to match the odd ones first time and the even ones second time

## () separates capture groups by before target, target, after target
## replacement echoes before target, replacement, after target

# replace abc123 (lowercase)
s/(^|\W)([a-z]{3}[0-9]{3})($|\W)/\1XYZ000\3/g
s/(^|\W)([a-z]{3}[0-9]{3})($|\W)/\1XYZ000\3/g

# replace banner ID
s/(^|\W)(@[0-9]{8})($|\W)/\1@XXXXXXXX\3/g
s/(^|\W)(@[0-9]{8})($|\W)/\1@XXXXXXXX\3/g

# replace grade (+/-) optional
s/\b[A-DF]\b[+-]?/X/gi
### s/(^|\W)([A-DF][-+]?)($|\W)/\1X\3/g         having trouble with this logic... doesn't capture some "+ or -"

# replace GPA
s/(^|\W)([0-4]\.[0-9]{1,3})($|\W)/\1X.X\3/g
s/(^|\W)([0-4]\.[0-9]{1,3})($|\W)/\1X.X\3/g