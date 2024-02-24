const ProductService = require("../services/product.service");
const MongoDB = require("../utils/mongodb.util");
const ApiError = require("../api-error");
// Tạo mới
exports.create = async (req, res, next) => {
    if (!req.body?.name) {
        return next(new ApiError(400, "Tên không để trống!"));
    }
    try {
        const productService = new ProductService(MongoDB.client);
        const document = productService.create(req.body);
        return res.send(document);
    } catch (error) {
        return next(
            new ApiError(500, "An error occured while creating the connect")
        );
    }

};
// Tìm tất cả
exports.findAll = async (req, res, next) => {
    let documents = [];

    try {
        const productService = new ProductService(MongoDB.client);
        const { name } = req.query;
        if (name) {
            documents = await productService.findByName(name);
        } else {
            documents = await productService.find({});
        }
    } catch (error) {
        return next(
            new ApiError(500, "Có lỗi trong khi cập nhật nhật dữ liệu")
        );
    }

    return res.send(documents);
};
// Tìm một
exports.findOne = async (req, res, next) => {
    try {
        const productService = new ProductService(MongoDB.client);
        const document = await productService.findById(req.params.id);
        if (!document) {
            return next(new ApiError(404, "Không tìm thấy"));
        }
        return res.send(document);
    } catch (error) {
        return next(
            new ApiError(
                500, `Lỗi tìm contact với id=${req.params.id}`
            )
        );
    }
};

// Cập nhật sản phẩm
exports.update = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, "Dữ liệu cập nhật không được rỗng!!!"));
    }
    try {
        const productService = new ProductService(MongoDB.client);
        const document = await productService.update(req.params.id, req.body);
        console.log(productService);
        if (!document) {
            return next(new ApiError(404, "Không tìm thấy thông tin!!"));
        }
        return res.send({ message: "Thông tin đã được cập nhật!!" });
    } catch (error) {
        return next(
            new ApiError(500, ` Lỗi đang cập nhật với id = ${req.params.id} `)
        );
    }

};

// Xoá toàn bộ sản phẩm
exports.deleteAll = async (_req, res, next) => {
    try {
        const productService = new ProductService(MongoDB.client);
        const deletedCount = await productService.deleteAll(); // gọi hàm từ contact.server.js
        return res.send({
            message: `${deletedCount} đã được xóa thành công!!`,
        });
    } catch (error) {
        return next(
            new ApiError(500, "Có lỗi trong khi xóa tất cả dữ liệu!!")
        );
    }
};
// Xoá 1 sản phẩm
exports.delete = async (req, res, next) => {
    try {
        const productService = new ProductService(MongoDB.client);
        const document = await productService.delete(req.params.id);
        if (!document) {
            return next(new ApiError(404, "Không tìm thấy!!"))
        }
        return res.send({ message: "Sản phẩm đã xóa thành công!!" });
    } catch (error) {
        return next(
            new ApiError(500, `Không thể xóa sản phẩm với id = ${req.params.id}`)
        );
    }

};
// Yêu thích
exports.findAllFavorite = async (req, res, next) => {
    try {
        const productService = new ProductService(MongoDB.client);
        const documents = await productService.findAllFavorite();
        return res.send(documents);
    } catch (error) {
        return next(new ApiError(500, "Có lỗi trong khi gửi faorite sản phẩm!!"));
    }

};