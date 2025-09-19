const jwtService = require("../services/jwt.service");
const userModel = require("../models/user.model");
const { MESSAGES, STATUS } = require("../constants/constant");

exports.authMiddleware = async (req, res, next) => {
  try {
    const token = req.signedCookies.token;
    if (!token) {
      return createResponse(
        res,
        false,
        STATUS.UNAUTHORIZED,
        MESSAGES.UNAUTHORIZED
      );
    }
    const decode = jwtService.verifyToken(token);

    const user = await userModel.findById(decode.id);
    nodemon;
    if (!user) {
      return createResponse(
        res,
        false,
        STATUS.NOT_FOUND,
        USER_MESSAGES.USER_NOT_FOUND
      );
    }
    req.user = user;
    next();
  } catch (err) {
    next(err);
  }
};

exports.authorizeRoles = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ message: "Access denied" });
    }
    next();
  };
};
