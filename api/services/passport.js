// config/passport.js
const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth20").Strategy;

const UserModel = require("../models/user.model"); // your model

passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      // MUST match Google console + your routes:
      callbackURL: `${process.env.SERVER_URL}/api/v1/public/auth/google/callback`,
    },
    async (accessToken, refreshToken, profile, done) => {
      try {
        console.log('Google Profile:', profile);
        console.log('Google Email:', profile.emails?.[0]?.value);
        
        // try existing by googleId
        let user = await UserModel.findOne({ googleId: profile.id });

        if (!user) {
          const email = profile.emails?.[0]?.value;

          // link to existing email account if found
          if (email) {
            const existing = await UserModel.findOne({ email });
            if (existing) {
              existing.googleId = profile.id;
              if (!existing.name) existing.name = profile.displayName;
              existing.status = "Active";
              await existing.save();
              user = existing;
            } else {
              console.log('Creating new Google user...');
              // create new user
              user = await UserModel.create({
                googleId: profile.id,
                name: profile.displayName,
                email,
                role: "student",
                status: "Active", 
              });
              console.log('User created:', user);
            }
          } else {
            console.log('Creating Google user without email...');
            user = await UserModel.create({
              googleId: profile.id,
              name: profile.displayName,
              role: "student",
              status: "Active", 
            });
          }
        }
        

        console.log('Final user object:', user);
        return done(null, user);
      } catch (err) {
        console.error('Passport Google Strategy Error:', err);
        return done(err, null);
      }
    }
  )
);

// (no sessions used, so serialize/deserialize not strictly needed)
module.exports = passport;