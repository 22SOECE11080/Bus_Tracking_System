import { Routes, Route } from "react-router-dom";
import LoginPage from "@/pages/LoginPage";
import React from "react";
import Dashboard from "@/pages/Dashboard";
import AddStudents from "@/pages/AddStudents";
import Home from "@/pages/Home";
import BusesManagement from "@/pages/BusesManagement";
import AddDrivers from "@/pages/AddDrivers";
import LiveBusMap from "@/pages/LiveBusMap";
import ComplaintsManagement from "@/pages/ComplaintsManagement";
import Settings from "@/pages/Settings";
import ReportsAnalytics from "@/pages/ReportsAnalytics";
import ForgotPasswordEmail from "@/pages/ForgotPasswordEmail";
import ForgotPasswordOTPVerification from "@/pages/ForgotPasswordOTPVerification";
import ResetPassword from "@/pages/ResetPassword";

const AppRoutes = () => {
  return (
    <Routes>
      {/* Login is outside the dashboard layout */}
      <Route path="/login" element={<LoginPage />} />
      <Route path="/forgotpasswordemail" element={<ForgotPasswordEmail />} />
      <Route path="/forgotpasswordotpverification" element={<ForgotPasswordOTPVerification />} />
      <Route path="/resetpassword" element={<ResetPassword />} />

      {/* Dashboard Layout with Outlet */}
      <Route path="/" element={<Dashboard />}>
        <Route index element={<Home />} />
        <Route path="addstudents" element={<AddStudents />} />
        <Route path="addbuses" element={<BusesManagement />} />
        <Route path="adddrivers" element={<AddDrivers />} />
        <Route path="livebusmap" element={<LiveBusMap />} />
        <Route path="complaintmanagement" element={<ComplaintsManagement />} />
        <Route path="settings" element={<Settings />} />
        <Route path="reportanalysis" element={<ReportsAnalytics />} />
      </Route>
    </Routes>
  );
};

export default AppRoutes;
