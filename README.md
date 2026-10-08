# Banking Management System

A full-stack web application built using Java Servlets, JSP, and SQL to manage core banking operations, user roles, and account transactions efficiently.

---

## 📌 Project Overview

The **Banking Management System** provides a secure platform with role-based access for Administrators, Staff, and Customers (Users). It streamlines daily banking operations such as account creation, profile modifications, deposit/withdrawal processing, and administrative approvals.

---

## ✨ Key Features

### 🔑 Authentication & Portals
* **Secure Access:** Centralized login (`login.html`) verified via backend servlet logic (`verify`).
* **Admin Portal (`Admin`, `aoptions`, `awelcome`):** System management, staff onboarding, and approval workflows.
* **Staff Portal (`Staff`, `soptions`, `swelcome`):** Day-to-day customer service, record tracking, and account adjustments.
* **User Portal (`User`, `uoptions`, `uwelcome`):** Customer dashboard to view profile details, check balances, and review transaction history.

### 👥 Customer & Staff Operations
* **Customer Management:** Full CRUD capabilities (`addcustomer`, `viewcustomer`, `modifycustomer`, `deletecustomer`).
* **Staff Management:** Onboard, inspect, and manage staff accounts (`addstaff`, `viewstaff`, `deletestaff`, `staffinfo`).
* **Approval Pipeline:** Admin control to review and approve customer requests (`approvals`, `approved`).

### 💳 Transaction Management
* **Deposits & Withdrawals:** Process financial transactions (`deposit`, `withdraw`).
* **Balance & Logs:** Fetch real-time account balances (`balance`) and inspect detailed transaction histories (`transaction`, `transactions`).

---

## 🛠️ Tech Stack

* **Frontend:** HTML5, CSS3, JavaScript
* **Backend:** Java Servlets, JSP (JavaServer Pages)
* **Database:** SQL Database (MySQL / Oracle DB via JDBC)
* **Web Server:** Apache Tomcat
