package nat;

import kiss.Prelude;
import kiss.List;
import haxe.Constraints;
import uuid.Uuid;
import nat.systems.*;

enum CommandArgType {
    // When called interactively, automatically pass the currently selected Entry(s) to the function
    // TODO eventually these will also be passed automatically when called programatically
    SelectedEntry;
    SelectedEntries(min:Null<Int>, max:Null<Int>);
    // String input
    Text(maxLength:Null<Float>); // max length is a float so Math.POSITIVE_INFINITY can be used
    // Any number of string inputs:
    VarText(maxLength:Null<Float>);
    // Numerical input, can be forced to align with a fixed step from the minimum
    Number(min:Null<Float>, max:Null<Float>, inStepsOf:Null<Float>);
    // Make the user select Entry(s) when called interactively
    OneEntry; // This constructor must be disambiguated from the typedef "Entry"
    Entries(min:Null<Int>, max:Null<Int>);
    // TODO Tag -- make sure a tag input is a valid haxe variable name for tagsMatch compatibility
    // TODO VarTag
}

typedef CommandArg = {
    name:String,
    type:CommandArgType
};

typedef Command = {
    args:Array<CommandArg>,
    handler:Function
    // Command handlers need to return a ChangeSet
};

typedef ChangeSet = Array<Entry>;

@:build(kiss.Kiss.build())
class ArchiveController {}
