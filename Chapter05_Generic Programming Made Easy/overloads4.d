import std.stdio;

struct Vector3 {
    float x, y, z;
    Vector3 opBinary(string op)(auto ref const(Vector3) rhs)
        if(op == "+" || op == "-")
    {
        mixin(`return Vector3(
                           x` ~ op ~ `rhs.x,
                           y` ~ op ~ `rhs.y,
                           z` ~ op ~ `rhs.z);`
            );
    }

    Vector3 opBinary(string op : "/")(float scalar) {
        return this * (1.0f/scalar);
    }

    Vector3 opBinary(string op : "*")(float scalar) {
        return Vector3(x*scalar, y*scalar, z*scalar);
    }

    Vector3 opBinaryRight(string op : "*")(float scalar) {
        return this * scalar;
    }
    
    ref Vector3 opOpAssign(string op)(auto ref Vector3 rhs)
        if(op == "+" || op == "-")
    {
        mixin("x" ~ op ~ "= rhs.x;
               y" ~ op ~ "= rhs.y;
               z" ~ op ~ "= rhs.z;"
        );
        return this;
    }
}


void main() {
    auto vec1 = Vector3(1.0f, 2.0f, 3.0f);
    auto vec2 = Vector3(4.0f, 2.0f, 5.0f);
    writeln(vec1 + vec2);
    writeln(vec1 - vec2);
    writeln(vec2 * 2.0f);
    writeln(2.0f * vec2);
    writeln(vec1 / 2.0f);

    writeln(vec1 += vec2);
}