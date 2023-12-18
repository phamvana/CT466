// eslint-disable-next-line no-undef
exports.create = (req, res) => {
    res.send({message: "create handler"});
};

// eslint-disable-next-line no-undef
exports.findAll = (req, res) => {
    res.send({ message: "Phạm Văn Á thực hiện. findAll handler"});
};

// eslint-disable-next-line no-undef
exports.findOne = (req, res) => {
    res.send({ message: "findOne handler"});
};

// eslint-disable-next-line no-undef
exports.update = (req, res) => {
    res.send({ message: "update handler"});
};

// eslint-disable-next-line no-undef
exports.delete = (req, res) => {
    res.send({message: "delete handler"});
};

// eslint-disable-next-line no-undef
exports.deleteAll = (req, res) => {
    res.send({ message: "deleteAll handker"});
};

// eslint-disable-next-line no-undef
exports.findAllFavorite = (req, res) => {
    res.send({ message: "findAllFavorite handler"});
};