import vibe.d;

version(Windows) {
    // When compiling with -m64
    version(Win64)
        enum sqliteLib = "lib\\sqlite3-ms64.lib";
    // When compiling with -m32mscoff
    else version(CRuntime_Microsoft)
        enum sqliteLib = "lib\\sqlite3-ms32.lib";
    // The default, or when compiling with -m32
    else
        enum sqliteLib = "lib\\sqlite3-dm-dll.lib";

    pragma(lib, sqliteLib);
}

shared static this()
{
    import mmweb.web : MovieMan;

    auto router = new URLRouter;
    router.registerWebInterface(new MovieMan);
    router.get("/forms/add", staticTemplate!"add.dt");
    router.get("/forms/find", staticTemplate!"find.dt");
    router.get("*", serveStaticFiles("./public/"));

	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	listenHTTP(settings, router);
}
