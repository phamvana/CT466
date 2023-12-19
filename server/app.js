// Express
const express = require("express");
// Cors
const cors = require("cors");
const app = express();

const contactsRouter = require("./app/routes/contact.route");
const productsRouter = require("./app/routes/product.route");
const ApiError = require("./app/api-error");

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        messge: "Chào mừng bạn tham gia Niên luận chuyên ngành CNTT (CT466).",
        name: "Phạm Văn Á",
        ketQua: "Đã cài đặt Nodemon, kết nối MongoDB, ...",
        huongDan: "Liên hệ: 0918810284 để được giải đáp tốt hơn!"
    });
});

app.use("/api/contacts", contactsRouter);
app.use("/api/products", productsRouter);
//hanle 404 response
app.use((req, res, next) => {
    return next(new ApiError(404, "Mã nguồn không tìm thấy"));
});

app.use((error, req, res, next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || "Internal Server Error",
    });
});



// eslint-disable-next-line no-undef
module.exports = app;