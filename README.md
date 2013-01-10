nmebugs
=======


bug0: see bug0.txt

can not generate font.hash with recent nme version (no error message, compilation just stops)

bug1: bug1/

tap screen once. Expected: red box stays in front of square.
html5 gives the red box behind the square (but only when
created in onClick event).


bug2: bug2/

TextField.height is not set correctly in html5 if you do TextField.height = somevalue;
expected: green box at the top left corner, got: red box.
