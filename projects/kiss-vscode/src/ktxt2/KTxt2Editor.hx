package ktxt2;

import js.html.Document;
import js.html.Window;
import js.html.Element;
import ktxt2.EditorExterns;
import ktxt2.KTxt2;
import kiss.Prelude;
import kiss.Stream;

using StringTools;

typedef MessageToEditor = {
    type:String,
    ?text:String
};

@:build(kiss.Kiss.build())
class KTxt2Editor {}