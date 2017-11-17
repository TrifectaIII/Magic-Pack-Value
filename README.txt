data11_24.txt thru data11_30.txt:

This is data collected everyday between 11/24/16 and 11/30/16. First column contains pack value data, second column is pack simulation speed.


get_pack.m:

takes a set name and returns a cell array that contains card name, card set, and card frequency for a simulated pack of that set.

get_price.m:

takes a card name and set and returns market value of that card in USD.

get_pack_values:

Takes a set and a # of packs to simulate, and returns a list of the values of those packs. Uses get_price.m and get_pack.m functions

simpacks.m:

A wrapper script, this prompts the user for a number of packs to simulate, and generate graphs using the data

graphs.m

Generates graphs using recorded data, for use on poster and ppt