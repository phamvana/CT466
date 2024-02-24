// Tạo mới
exports.create = (req, res) => {
    res.send({ message: "create handler -  Tạo mới 1 Dịch vụ" });
};

// Tìm tất cả
exports.findAll = (req, res) => {
    res.send({ message: "Phạm Văn Á thực hiện. findAll handler -  Tìm nhiều Dịch vụ" });
};

// Tìm một
exports.findOne = (req, res) => {
    res.send({ message: "findOne handler - Tìm 1 dịch vụ" });
};

// Cập nhật
exports.update = (req, res) => {
    res.send({ message: "update handler - Cập nhật dịch vụ" });
};

// Xoá
exports.delete = (req, res) => {
    res.send({ message: "delete handler - Xoá dịch vụ - Hãy cẩn thận" });
};

// Xoá toàn bộ
exports.deleteAll = (req, res) => {
    res.send({ message: "deleteAll handker - Xoá toàn bộ dịch vụ, hãy cẩn thận" });
};

// Yêu thích
exports.findAllFavorite = (req, res) => {
    res.send({ message: "findAllFavorite handler - Tất cả dịch vụ được yêu thích!" });
};