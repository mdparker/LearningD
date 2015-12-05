import std.stdio;

class Robot {
    int health;
    this(int health) { this.health = health; }
    // Other members
}

// Assumes a squad size of 5 for simplicity
void healthBasedSwap(Robot[] squad1, Robot[] squad2) {
    import std.algorithm : partition;
    import std.range : chain;
    squad1.chain(squad2).partition!("a.health >= 30");
}

void main() {
    Robot[] makeRobots(int[] healthVals) {
        Robot[] bots;
        foreach(val; healthVals)
            bots ~= new Robot(val);
        return bots;
    }
    import std.algorithm : equal;
    auto squad1 = makeRobots([10, 76, 22, 67, 55]);
    auto squad2 = makeRobots([33, 94, 17, 27, 16]);
    healthBasedSwap(squad1, squad2);
    foreach(robot; squad1)
        writeln(robot.health);
}
