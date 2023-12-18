class ApiError extends Error {
    constructor(statusCode, message) {
        super();
        this.statusCode = statusCode;
        this.message = message;
    }
}


// ApiError --> khi xuất hiện lỗi.
module.exports = ApiError;