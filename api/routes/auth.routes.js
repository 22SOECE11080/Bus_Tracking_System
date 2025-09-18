const express = require("express");
const userController = require("../controllers/user.controller");
const router = express.Router();
const passport = require("passport");

router.post("/register", userController.signUp);
router.post("/login", userController.signIn);

// Step 1: Ask Google for login
router.get(
  "/google",
  passport.authenticate("google", { scope: ["openid","profile", "email"] })
);


// Step 2: Google redirects here
router.get(
  "/google/callback",
  passport.authenticate("google", {
    failureRedirect: `${process.env.CLIENT_URL}/login`,
    session: false,
  }),
  userController.GoogleLogin
);

router.get("/activate-account", userController.ActiveAccount);

router.post("/forgot-password", userController.forgotPassword);

router.patch("/reset-password/:id/:token", userController.resetPassword);
module.exports = router;
