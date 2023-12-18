const config = {
    app: {
        // Cổng của trang 3000
        port: process.env.PORT || 3000
    },
    //mongdb
    db: {
        uri: process.env.MONGODB_URI || "mongodb+srv://phamvana:hdFUr42W%40LPNxKQ@cluster0.jgahqp8.mongodb.net/?retryWrites=true&w=majority"
    }
};


// xuất ra tên config
module.exports = config;