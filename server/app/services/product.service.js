const { ObjectId } = require("mongodb");
// const MongoDB = require("../utils/mongodb.util");
// const ApiError = require("../api-error");
class ProductService {
    constructor(client) {
        const database = client.db("CT466");
        this.Product = database.collection("products");
    }

    // Định nghĩa các phương thức truy xuất CSDL sử dụng mongoDB API
    extractProductData(payload) {
        const product = {
            name: payload.name,
            description: payload.description,
            price: payload.price,
            countInStock: payload.countInStock,
            imageUrl: payload.imageUrl,
            favorite: payload.favorite,
        };
        // Remove undefined fields  
        Object.keys(product).forEach(
            (key) => product[key] === undefined && delete product[key]
        );
        return product;
    }
    async create(payload) {
        const product = this.extractProductData(payload);
        const result = await this.Product.findOneAndUpdate(
            product,
            { $set: { favorite: product.favorite === true } },
            { returnDocument: "after", upsert: true }
        );
        return result;
    }

    //find
    async find(filter) {
        const cursor = await this.Product.find(filter);
        return await cursor.toArray();
    }
    //findByName
    async findByName(name) {
        return await this.find({
            name: { $regex: new RegExp(new RegExp(name)), $options: "i" },
        });
    }
    // Tìm theo id
    async findById(id) {
        return await this.Product.findOne({
            _id: ObjectId.isValid(id) ? new ObjectId(id) : null,
        });
    }

    // update
    async update(id, payload) {
        const filter = {
            _id: ObjectId.isValid(id) ? new ObjectId(id) : null,
        };
        const update = this.extractProductData(payload);
        const result = await this.Product.findOneAndUpdate(
            filter,
            { $set: update },
            { returnDocument: "after" }
        );
        return result;
    }

    //delete
    async delete(id) {
        const result = await this.Product.findOneAndDelete({
            _id: ObjectId.isValid(id) ? new ObjectId(id) : null,
        }); return result;
    }

    //Favorite
    async findAllFavorite() {
        return await this.find({ favorite: true });
    }

    //deleteAll
    async deleteAll() {
        const result = await this.Product.deleteMany({});
        return result.deletedCount;
    }

}
module.exports = ProductService;