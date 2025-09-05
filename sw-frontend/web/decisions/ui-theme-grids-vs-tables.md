# Commonalities
The minimum requirement for both tables and grids is that they contain information whose structure is characterized by a two-dimensional relationship[1].
 
# Table
 In essence: a table is a method of displaying information to enable the easy consumption of two-dimensional relationships within that information.

# Grid
Grids differ from tables in how they support interactivity: all cells are focusable and keyboard navigable, and the general idea is that many if not all of the cells will support some type of user action.
Possible user actions within a grid could include editing a cell value (common in a spreadsheet), selecting or deselecting a cell, and reordering, inserting, and deleting rows or columns. If most of the cells are not interactive, then it seems likely that a table would be a better choice than a grid.

Grids should also be a single stop in the tab order regardless of how many interactive elements they contain, since keyboard navigation is handled by the author by listening to arrow keys, home, end, page up, page down, etc. For that reason, keyboard navigation within a grid can be much more efficient than tabbing between focusable elements within a table.
# Resources
[1] https://sarahmhigley.com/writing/grids-part1/