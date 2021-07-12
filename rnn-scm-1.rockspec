package = "rnn"
version = "scm-1"

source = {
   url = "git://github.com/kanno-go/rnn",
   branch = "2017-06-01"
}

description = {
   summary = "A recurrent neural network library for Torch",
   detailed = [[
A library to build RNNs, LSTMs, GRUs, BRNNs, BLSTMs, and so forth and so on.
   ]],
   homepage = "https://github.com/kanno-go/cutorch",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "nn >= 1.0",
   "torchx >= 1.0",
   "moses"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)"  -DLUA_INCDIR="$(LUA_INCDIR)" -DLUA_LIBDIR="$(LUA_LIBDIR)" && $(MAKE)
]],
   install_command = "cd build && $(MAKE) install"
}
