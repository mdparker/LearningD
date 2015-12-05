enum alwaysTrue = is(int);
static assert(alwaysTrue);

enum alwaysTrueToo = is(typeof(1+1));
static assert(alwaysTrueToo);

enum isFloat = is(typeof(1+1) == float);
static assert(!isFloat);

enum canBeFloat = is(typeof(1+1) : float);
static assert(canBeFloat);


void main() {}