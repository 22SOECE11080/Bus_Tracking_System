const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    googleId: {
      type: String,
      unique: true,
      sparse: true,
    },
    name: {
      type: String,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: function () {
        // Password only required if googleId is not present
        return !this.googleId;
      },
    },
    role: {
      type: String,
      enum: ["student", "parent", "admin", "driver"],
      required: true,
    },
    status: {
      type: String,
      enum: ["Inactive", "Active"],
      default: function () {
        return this.googleId ? "Active" : "Inactive";
      },
    },
  },
  { timestamps: true }
);

const UserModel = mongoose.model("User", userSchema);

module.exports = UserModel;
