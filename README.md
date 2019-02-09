# Todo
Sample project that illustrates how to make a NSTextField in an NSTableView that expands vertically as you type.

The project only contains three source files, and the AppDelegate is of no interest. The remaining two source files implements the complete project.

## NotesViewController
Most of this is boiler plate code that sets up the NSTableView. A lot of the settings is set in Interface Builder.

## DynamicTextField
A custom NSTextField that updates bounds of the control when text is typed into the control. It copies the text from the windows shared Field Editor and tells the control to update the constraints.
