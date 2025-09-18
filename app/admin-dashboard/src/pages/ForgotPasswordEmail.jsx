import React from "react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import Lottie from "lottie-react";
import forgotAnimation from "../lottie/Email-successfully-sent.json";
import { Link } from "react-router-dom";

const ForgotPasswordEmail = ({ className, ...props }) => {
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
                <div className="flex flex-col items-center text-center gap-3">
                  <h1 className="text-2xl font-bold">Forgot Password?</h1>
                  <p className="text-muted-foreground">
                    Enter your registered email to receive a reset code
                  </p>
                </div>

                <div className="grid gap-2">
                  <Label htmlFor="email">Email</Label>
                  <Input
                    id="email"
                    type="email"
                    placeholder="you@example.com"
                    required
                  />
                </div>

                <Link to="/forgotpasswordotpverification" className="w-full">
                  <Button type="submit" className="w-full">
                    Send OTP
                  </Button>
                </Link>

                <div className="text-center text-sm">
                  Remembered your password?{" "}
                  <Link to="/login" className="underline underline-offset-4">
                    Back to Login
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

export default ForgotPasswordEmail;
