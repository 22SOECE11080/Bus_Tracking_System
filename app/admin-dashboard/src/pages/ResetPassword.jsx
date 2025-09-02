import React, { useState } from "react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Eye, EyeOff } from "lucide-react";
import Lottie from "lottie-react";
import forgotAnimation from "../lottie/Reset-Password-Animation.json";
import { Link } from "react-router-dom";

const ResetPassword = ({ className, ...props }) => {
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);

  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6 md:p-10">
      <div className="w-full max-w-sm md:max-w-3xl">
        <div className={cn("flex flex-col gap-6", className)} {...props}>
          <Card className="overflow-hidden">
            <CardContent className="grid p-0 md:grid-cols-2">
              {/* LEFT: LOTTIE ANIMATION */}
              <div className="relative hidden bg-muted md:flex items-center justify-center">
                <Lottie
                  animationData={forgotAnimation}
                  loop
                  className="w-full h-full max-h-[500px] object-contain"
                />
              </div>
              {/* RIGHT: FORM */}
              <form className="p-6 md:p-8 flex flex-col gap-6">
                <div className="flex flex-col items-center text-center">
                  <h1 className="text-2xl font-bold">Reset Password</h1>
                  <p className="text-muted-foreground">
                    Enter your new password below
                  </p>
                </div>

                {/* New Password */}
                <div className="grid gap-2">
                  <Label htmlFor="new-password">New Password</Label>
                  <div className="relative">
                    <Input
                      id="new-password"
                      type={showPassword ? "text" : "password"}
                      placeholder="Enter your new password"
                      className="pr-10"
                      required
                    />
                    <button
                      type="button"
                      onClick={() => setShowPassword(!showPassword)}
                      className="absolute inset-y-0 right-3 flex items-center text-muted-foreground"
                    >
                      {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
                    </button>
                  </div>
                </div>

                {/* Confirm Password */}
                <div className="grid gap-2">
                  <Label htmlFor="confirm-password">Confirm Password</Label>
                  <div className="relative">
                    <Input
                      id="confirm-password"
                      type={showConfirm ? "text" : "password"}
                      placeholder="Enter your password again"
                      className="pr-10"
                      required
                    />
                    <button
                      type="button"
                      onClick={() => setShowConfirm(!showConfirm)}
                      className="absolute inset-y-0 right-3 flex items-center text-muted-foreground"
                    >
                      {showConfirm ? <EyeOff size={18} /> : <Eye size={18} />}
                    </button>
                  </div>
                </div>

                {/* Submit Button */}
                <Link to="/login">
                  <Button type="submit" className="w-full">
                    Update Password
                  </Button>
                </Link>

                {/* OTP Link */}
                <div className="text-center text-sm">
                  Go back to{" "}
                  <Link
                    to="/forgotpasswordotpverification"
                    className="underline underline-offset-4"
                  >
                    OTP Verification
                  </Link>
                </div>

                {/* Login Link */}
                <div className="text-center text-sm">
                  Back to{" "}
                  <Link to="/login" className="underline underline-offset-4">
                    Login
                  </Link>
                </div>
              </form>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default ResetPassword;
