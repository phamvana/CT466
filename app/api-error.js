class ApiError extends Error {
    constructor (statusCode, message){
        super();
        this.statusCode = statusCode;
        this.message = message;
    }
}


// eslint-disable-next-line no-undef
module.exports = ApiError;