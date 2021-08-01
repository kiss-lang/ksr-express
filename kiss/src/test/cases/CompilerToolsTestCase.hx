package test.cases;

import utest.Assert;
import utest.Test;
import kiss.CompilerTools;
import kiss.Prelude;
#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
#end

class CompilerToolsTestCase extends Test {
    // Skip these tests on C# for now because they will fail due to this haxe bug:
    // https://github.com/HaxeFoundation/haxe/issues/10332
    #if ((sys || hxnodejs) && !cs)
    function testCompileHelloWorldJs() {
        Assert.equals("Hello world!", _testCompileHelloWorldJs()());
    }

    static macro function _testCompileHelloWorldJs() {
        return CompilerTools.compileFileToScript(
            "kiss/template/src/template/Main.kiss", JavaScript, {
                outputFolder: "bin/helloWorldJsTest",
            });
    }

    function testCompileHelloWorldPy() {
        Assert.equals("Hello world!", _testCompileHelloWorldPy()());
    }

    static macro function _testCompileHelloWorldPy() {
        return CompilerTools.compileFileToScript(
            "kiss/template/src/template/Main.kiss", Python, {
                outputFolder: "bin/helloWorldPyTest",
            });
    }

    // TODO test what happens when passing more arguments/files
    #end
}