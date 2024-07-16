local salt = require("salt")

t1 = {
    name = "teste",
    id = 0,
    post = "abcd"
}
t2 = {
    name = "teste",
    id = 0,
    post = "abcd"
}
tColl = {}
tColl[1] = t1
tColl[2] = t2

salt.save(tColl, "/teste.txt")
