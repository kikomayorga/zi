require "tablesaveload"

readtable = {}

readtable = table.load("usuarios.db")

readtable[#readtable +1] = {"usuario_N", "1234", "user"}

table.save(readtable, "usuarios.db")