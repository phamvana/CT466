// Tạo mới
exports.create = (req, res) => {
    res.send({ message: "create handler -  Tạo mới 1 sản phẩm" });
};

// Tìm tất cả
exports.findAll = (req, res) => {
    res.send({ message: "Phạm Văn Á thực hiện. findAll handler -  Tìm nhiều sản phẩm" });
};

// Tìm một
exports.findOne = (req, res) => {
    res.send({ message: "findOne handler - Tìm 1 sản phẩm" });
};

// Cập nhật
exports.update = (req, res) => {
    res.send({ message: "update handler - Cập nhật sản phẩm" });
};

// Xoá
exports.delete = (req, res) => {
    res.send({ message: "delete handler - Xoá sản phẩm - Hãy cẩn thận" });
};

// Xoá toàn bộ
exports.deleteAll = (req, res) => {
    res.send({ message: "deleteAll handker - Xoá toàn bộ sản phẩm, hãy cẩn thận" });
};

// Yêu thích
exports.findAllFavorite = (req, res) => {
    res.send({ message: "findAllFavorite handler - Tất cả sản phẩm được yêu thích!" });
};