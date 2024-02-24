const { MongoClient } = require("mongodb");
//Tạo lớp MongoDB --> kết nối dữ liệu từ MongoDB
class MongoDB {
    static connect = async (uri) => {
        if (this.client) return this.client;
        this.client = await MongoClient.connect(uri);
        return this.client;
    };
}

module.exports = MongoDB;

