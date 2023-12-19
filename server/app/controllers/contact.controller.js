const ContactService = require("../services/contact.service");
const MongoDB = require("../utils/mongodb.util");
const ApiError = require("../api-error");

// Tạo và Lưu một Contact mới - Phạm Văn Á
exports.create = async (req, res, next) => {
    if (!req.body?.name) {
        return next(new ApiError(400, "Tên không để trống!"));
    }
    try {
        const contactService = new ContactService(MongoDB.client);
        const document = contactService.create(req.body);
        return res.send(document);
    } catch (error) {
        return next(
            new ApiError(500, "An error occured while creating the connect")
        );
    }

};

// Trả về tất cả contact của một user từ database
exports.findAll = async (req, res, next) => {
    let documents = [];

    try {
        const contactService = new ContactService(MongoDB.client);
        const { name } = req.query;
        if (name) {
            documents = await contactService.findByName(name);
        } else {
            documents = await contactService.find({});
        }
    } catch (error) {
        return next(
            new ApiError(500, "Có lỗi trong khi cập nhật nhật dữ liệu")
        );
    }

    return res.send(documents);
};

// findOne
exports.findOne = async (req, res, next) => {
    try {
        const contactService = new ContactService(MongoDB.client);
        const document = await contactService.findById(req.params.id);
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

// Update - Phạm Văn Á thực hiện
exports.update = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, "Dữ liệu cập nhật không được rỗng!!!"));
    }
    try {
        const contactService = new ContactService(MongoDB.client);
        const document = await contactService.update(req.params.id, req.body);
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

// Xóa dữ liệu theo id
exports.delete = async (req, res, next) => {
    try {
        const contactService = new ContactService(MongoDB.client);
        const document = await contactService.delete(req.params.id);
        if (!document) {
            return next(new ApiError(404, "Không tìm thấy!!"))
        }
        return res.send({ message: "Contact đã xóa thành công!!" });
    } catch (error) {
        return next(
            new ApiError(500, `Không thể xóa contact với id = ${req.params.id}`)
        );
    }

};

// Xoas toàn bộ dữ liệu
exports.deleteAll = async (_req, res, next) => {
    try {
        const contactService = new ContactService(MongoDB.client);
        const deletedCount = await contactService.deleteAll(); // gọi hàm từ contact.server.js
        return res.send({
            message: `${deletedCount} đã được xóa thành công!!`,
        });
    } catch (error) {
        return next(
            new ApiError(500, "Có lỗi trong khi xóa tất cả dữ liệu!!")
        );
    }
    //res.send({ message: "deleteAll handker" });
};

// find All favorite
exports.findAllFavorite = async (req, res, next) => {
    try {
        const contactService = new ContactService(MongoDB.client);
        const documents = await contactService.findAllFavorite();
        return res.send(documents);
    } catch (error) {
        return next(new ApiError(500, "Có lỗi trong khi gửi faorite contacts!!"));
    }

};