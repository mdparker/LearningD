import std.stdio;

void main() {
    import std.conv : octal;
    int oct = octal!377;
    writeln("Octal literal:");
    writeln(oct);

    writeln("\nInteger literals:");
    writeln(typeid(2_147_483_647));
    writeln(typeid(2_147_483_648));
    writeln(typeid(2_147_483_648U));
    writeln(typeid(9_223_372_036_854_775_807));
    // Error! Overflow!
    // writeln(typeid(9_223_372_036_854_775_808));
    writeln(typeid(9_223_372_036_854_775_808UL));
    writeln(typeid(10));
    writeln(typeid(10U));
    writeln(typeid(10L));
    writeln(typeid(10UL));

    writeln("\nFloating point literals:");
    writeln(typeid(3.0));
    writeln(typeid(3.0f));
    writeln(typeid(3.0F));
    writeln(typeid(3.0L));
    writeln(typeid(3f));

    writeln("\nExponential notation:");
    writeln(7.1e2);     // 710.0
    writeln(7.1e+2);    // 710.0
    writeln(7.1e-2);    // 0.071
    writeln(7e0);       // 7.0
    writeln(7e-0);      // 7.0
}