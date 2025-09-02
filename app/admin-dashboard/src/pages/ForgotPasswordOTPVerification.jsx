import React, { useRef, useState } from "react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import Lottie from "lottie-react";
import forgotAnimation from "../lottie/otp-verification.json";
import { Link } from "react-router-dom";

const ForgotPasswordOTPVerification = ({ className, ...props }) => {
  const [otp, setOtp] = useState(Array(6).fill(""));
  const inputRefs = useRef([]);

  const handleChange = (value, index) => {
    if (/^\d?$/.test(value)) {
      const newOtp = [...otp];
      newOtp[index] = value;
      setOtp(newOtp);

      // Move to next input
      if (value && index < 5) {
        inputRefs.current[index + 1]?.focus();
      }
    }
  };

  const handleKeyDown = (e, index) => {
    if (e.key === "Backspace" && !otp[index] && index > 0) {
      inputRefs.current[index - 1]?.focus();
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const finalOtp = otp.join("");
    console.log("Submitted OTP:", finalOtp);
    // Add your verification logic here
  };

  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6 md:p-10">
      <div className="w-full max-w-sm md:max-w-3xl">
        <div className={cn("flex flex-col gap-6", className)} {...props}>
          <Card className="overflow-hidden">
            <CardContent className="grid p-0 md:grid-cols-2">
              {/* LEFT: FORM */}
              <form
                onSubmit={handleSubmit}
                className="p-6 md:p-8 flex flex-col gap-6"
              >
                <div className="flex flex-col items-center text-center gap-3">
                  <h1 className="text-2xl font-bold">Verify OTP</h1>
                  <p className="text-muted-foreground">
                    Enter the 6-digit code sent to your email
                  </p>
                </div>

                <div className="grid gap-2">
                  <Label>OTP Code</Label>
                  <div className="flex justify-between gap-2">
                    {otp.map((digit, index) => (
                      <Input
                        key={index}
                        ref={(el) => (inputRefs.current[index] = el)}
                        type="text"
                        inputMode="numeric"
                        maxLength={1}
                        value={digit}
                        onChange={(e) => handleChange(e.target.value, index)}
                        onKeyDown={(e) => handleKeyDown(e, index)}
                        className="text-center text-lg font-medium w-10 h-10"
                        required
                      />
                    ))}
                  </div>
                </div>

                <Link to="/resetpassword">
                  <Button type="submit" className="w-full">
                    Verify & Continue
                  </Button>
                </Link>

                <div className="text-center text-sm">
                  Didn't receive the code?{" "}
                  <Link
                    to="#"
                    className="underline underline-offset-4"
                  >
                    Resend OTP
                  </Link>
                </div>
              </form>

              {/* RIGHT: LOTTIE ANIMATION */}
              <div className="relative hidden bg-muted md:flex items-center justify-center">
                <Lottie
                  animationData={forgotAnimation}
                  loop
                  className="w-full h-full max-h-[500px] object-contain"
                />
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default ForgotPasswordOTPVerification;
