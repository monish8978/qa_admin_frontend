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

## ⚙️ Environment Configuration (`.env`)

Create a `.env` file in the `qa_admin_frontend` folder or the root directory:

```env
# Runs the application in development/production mode
NODE_ENV=development

# The port where the frontend Next.js dev server runs
PORT=3001

# The address of the backend server (FastAPI) where Next.js forwards API requests
API_URL=http://localhost:8005

# Client-facing API URL prefix. Prevents CORS errors by proxying browser requests
NEXT_PUBLIC_API_URL=/api/v1
```

> [!NOTE]
> IP addresses do **NOT** need to be hardcoded in the client code. The frontend uses relative paths (`/api/v1`) which automatically bind to whichever server IP or domain the user visits in their browser.

---

## 💻 Development Setup

This project is part of a **pnpm monorepo**. You must compile the shared package before starting the development server.

```bash
# 1. From the monorepo root directory, build the shared package
pnpm --filter @qa/shared build

# 2. Start the Next.js development server
pnpm run dev
```

The frontend application will be available at: **`http://localhost:3001`**

---

## 📦 Production Build & Deployment

### 1. Build the Standalone Production Bundle
Use the automated production build script to compile TypeScript, verify types, link assets, and create the standalone archive:

```bash
# Go to the frontend directory
cd qa_admin_frontend

# Run the automated build script
./create_build.sh
```

### 2. Deployment & Starting PM2 Production Process
Deploy the compiled bundle to the target server directory `/usr/share/Czentrix/qa_admin_frontend`, install production dependencies, and start the application:

```bash
# 1. Navigate to the deployment directory
cd /usr/share/Czentrix/qa_admin_frontend

# 2. Install production dependencies
npm install --production

# 3. Start the application using PM2 on port 3001
PORT=3001 pm2 start .next/standalone/qa_admin_frontend/server.js --name "qa-frontend"
```

### 3. Server Management Commands

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