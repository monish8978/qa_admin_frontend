# 🚀 SmartQA Platform - Admin Frontend (`qa_admin_frontend`)

Modern, multi-tenant Web Interface for the **SmartQA Evaluation Suite**. Built with Next.js 14, React, TypeScript, and Tailwind CSS.

---

## 🛠️ Tech Stack

* **Framework:** Next.js 14 (App Router)
* **UI & Styling:** Tailwind CSS, Lucide Icons, UI Standards
* **State & Data Fetching:** TanStack React Query v5
* **Form Management:** React Hook Form + Zod Validation
* **Authentication:** JWT, MFA Support, Multi-Tenant Workspace Routing
* **Process Manager:** PM2 (Production)

---

### 1. Deployment & Starting PM2 Production Process
Deploy the compiled bundle to the target server directory `/usr/share/Czentrix/qa_admin_frontend`, install production dependencies, and start the application:

```bash
# 1. Navigate to the deployment directory
cd /usr/share/Czentrix/qa_admin_frontend

# 2. Install production dependencies
npm install --production

# 3. Start the application using PM2 on port 3001
PORT=3001 pm2 start .next/standalone/qa_admin_frontend/server.js --name "qa-frontend"
```

### 2. Server Management Commands

```bash
# Check running status
pm2 status

# View live logs
pm2 logs qa-frontend

# Restart frontend server
pm2 restart qa-frontend

# Stop frontend server
pm2 stop qa-frontend
```

---

## 📂 Directory Structure

```text
qa_admin_frontend/
├── public/                 # Static assets & branding logos
└── src/
    ├── app/                # Next.js App Router pages
    │   ├── (app)/          # Protected app routes (Dashboard, QA Queue, Settings, etc.)
    │   └── (auth)/         # Public auth routes (Login, Signup, Reset Password)
    ├── components/         # Reusable UI components & Page Shells
    ├── context/            # Global Auth & Tour contexts
    ├── lib/                # API Client, standard utilities & UI tokens
    ├── middleware.ts       # Route gating and auth guards
    ├── create_build.sh     # Automated production build & packaging script
    ├── next.config.js      # Next.js configuration & API rewrites
    ├── tailwind.config.js  # Tailwind CSS configuration
    └── tsconfig.json       # TypeScript configuration
```

---

## 📄 License
Internal Proprietary Software - C-Zentrix / Towards Vision Technologies.
