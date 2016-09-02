var mongoose = require("mongoose"),
    Schema   = mongoose.Schema;
mongoose.connect('mongodb://localhost/my_database');
var UserSchema = new Schema({
  name: {type: String, trim: true, required: true},
  email: {type: String, trim: true, required: true}
});

module.exports = mongoose.model("User", UserSchema);
