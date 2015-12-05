class Robot {
    int health;
    this(int health) { this.health = health; }
    // Other members
}

// Assumes a squad size of 5 for simplicity
void healthBasedSwap(Robot[] squad1, Robot[] squad2) {
    import std.algorithm : sort;
    import std.range : chain;
    squad1.chain(squad2).sort!((a,b) => a.health > b.health)();
}

unittest {
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
    assert(squad1.equal!((a,b) => a.health == b.health)
        (makeRobots([94, 76, 67, 55, 33])));
    assert(squad2.equal!((a,b) => a.health == b.health)
        (makeRobots([27, 22, 17, 16, 10])));
}
