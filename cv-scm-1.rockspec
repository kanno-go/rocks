package = "cv"
version = "scm-1"

source = {
   url = "git://github.com/kanno-go/torch-opencv",
   tag = "master"
}

description = {
   summary = "OpenCV bindings for LuaJIT+Torch",
   detailed = [[
   	    OpenCV bindings for LuaJIT+Torch
   ]],
   homepage = "https://github.com/kanno-go/torch-opencv",
   license = "MIT"
}

dependencies = {
   "torch >= 7.0"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)";
$(MAKE) -j5
   ]],
   platforms = {
      windows = {
        build_command = [[
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
        ]]
      }
   },

   install_command = "cd build && $(MAKE) install"
}
