// eslint-disable-next-line no-undef
const express = require("express");
// eslint-disable-next-line no-undef
const cors = require("cors");
const app = express();

const contactsRouter = require("./app/routes/contact.route");
const ApiError = require("./app/api-error");

app.use(cors());
app.use(express.json());

app.get("/",(req,res) => {
    res.json({
        messge: "Welcome to contact book application.",
        name: "Phạm Văn Á",
        ketQua: "Đã cài đặt Nodemon"
    });
});

app.use("/api/contacts",contactsRouter);

//hanle 404 response
app.use((req,res,next) => {
    return next(new ApiError(404,"Mã nguồn không tìm thấy"));
});

app.use((error,req,res,next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || "Internal Server Error",
    });
});



// eslint-disable-next-line no-undef
module.exports = app;