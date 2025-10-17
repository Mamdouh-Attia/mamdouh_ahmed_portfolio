# 📱 Mamdouh Ahmed Portfolio

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Web-blue?logo=flutter&logoColor=white" alt="Flutter Web" />
  <img src="https://img.shields.io/badge/Supabase-Connected-3ECF8E?logo=supabase&logoColor=white" alt="Supabase Connected" />
  <img src="https://img.shields.io/badge/Bloc-State%20Management-7D3C98?logo=bloc&logoColor=white" alt="Bloc State Management" />
  <img src="https://img.shields.io/badge/CI-GitHub%20Actions-24292F?logo=github-actions&logoColor=white" alt="GitHub Actions" />
  <img src="https://img.shields.io/badge/License-MIT-green?logo=open-source&logoColor=white" alt="MIT License" />
  <img src="https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square" alt="Project Status" />
</p>

<p align="center">
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio">
    <img src="https://img.shields.io/github/stars/Mamdouh-Attia/mamdouh_ahmed_portfolio?style=social" alt="GitHub stars" />
  </a>
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio/fork">
    <img src="https://img.shields.io/github/forks/Mamdouh-Attia/mamdouh_ahmed_portfolio?style=social" alt="GitHub forks" />
  </a>
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio/issues">
    <img src="https://img.shields.io/github/issues/Mamdouh-Attia/mamdouh_ahmed_portfolio?color=yellow" alt="GitHub issues" />
  </a>
</p>

<p align="center">
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio">
    <img src="https://img.icons8.com/color/48/000000/flutter.png" alt="Flutter" height="32"/>
  </a>
  <a href="https://supabase.com/">
    <img src="https://img.icons8.com/color/48/000000/database.png" alt="Supabase" height="32"/>
  </a>
  <a href="https://bloclibrary.dev/#/">
    <img src="https://img.icons8.com/ios-filled/50/7D3C98/flow-chart.png" alt="Bloc" height="32"/>
  </a>
  <a href="https://github.com/features/actions">
    <img src="https://img.icons8.com/color/48/000000/github.png" alt="GitHub Actions" height="32"/>
  </a>
</p>

<p align="center">
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio">
    <img src="https://img.shields.io/badge/✨-Explore%20the%20Code-blueviolet?style=for-the-badge" alt="Explore the Code" />
  </a>
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio/fork">
    <img src="https://img.shields.io/badge/🚀-Fork%20and%20Contribute-success?style=for-the-badge" alt="Fork and Contribute" />
  </a>
  <a href="https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio/issues/new">
    <img src="https://img.shields.io/badge/🐞-Report%20an%20Issue-orange?style=for-the-badge" alt="Report an Issue" />
  </a>
</p>

> A professional portfolio built with **Flutter Web** — showcasing my **projects, learning journey, and teaching experience**.  
> Powered by **Bloc**, **Supabase**, and **Clean Architecture**.  
> Designed for scalability, performance, and clarity.

---

## 🚀 Overview

This project represents **Mamdouh Ahmed Attia’s** personal portfolio website.  
It highlights real projects, learning experiences, and teaching contributions — all implemented with Flutter Web and connected to a live Supabase backend.

---

## ✅ Current Features (Completed)

- **Flutter Web setup** with clean architecture  
- **Folder structure** inspired by scalable app design  
- **Bloc & Cubit integration** (ThemeCubit / LanguageCubit / Logger + BlocObserver)  
- **AppShell layout** (Header, Drawer, Footer)  
- **Routing** implemented using `go_router`  
- **Responsive design** across mobile / tablet / desktop  
- **Light / Dark theme toggle**  
- **English / Arabic localization support**  
- **Supabase connected successfully** with:
  - Postgres database (`projects`, `users` tables)
  - Row Level Security (RLS) + policies  
  - Storage bucket (`portfolio-assets`)  
  - API keys integration through `.env`
- **Logger** configured for structured logs  
- **GitHub integration**:
  - Repository initialized with CI  
  - Actions running for `flutter analyze`  
  - Issues, Milestones & Project board configured  
  - Scripts organized in `scripts/` directory  

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-------------|
| **Frontend** | Flutter (Web) |
| **State Management** | Bloc & Cubits |
| **Routing** | go_router |
| **Backend / BaaS** | Supabase (Postgres + Auth + Storage + Realtime) |
| **Logging** | Logger + BlocObserver |
| **Version Control** | Git + GitHub |
| **CI** | GitHub Actions |

---

## 📂 Project Structure


The project follows a clean architecture approach with a well-defined folder structure:
```
lib/
├── app.dart
├── main.dart
├── core/
│   ├── routing/
│   ├── theme/
│   ├── localization/
│   ├── observers/
│   └── utils/
├── features/
│   ├── home/
│   ├── projects/
│   ├── other/
│   ├── learning/
│   ├── teaching/
│   ├── certificates/
│   └── admin/
├── shared/
│   ├── widgets/
│   ├── models/
│   ├── repositories/
│   └── services/
assets/
├── images/
├── rive/
└── 3d_models/
scripts/
├── create_issues_from_md.ps1
└── assign_milestones.ps1
.env.example
README.md
```

## 🔐 Environment Setup

1. Add your `.env` file (not tracked by git):
   ```bash
   SUPABASE_URL=your_project_url
   SUPABASE_ANON_KEY=your_anon_key
    ```
2. Ensure `.env` is listed in `.gitignore` (✅ already configured).
3. Use `.env.example` for CI or collaborators.

---

## 🧪 CI Integration

* GitHub Actions configured for:

  * `flutter pub get`
  * `flutter analyze`
* Workflow triggers on `push` and `pull_request` to main branch.

---

## 👤 Author

**Mamdouh Ahmed Attia**
💼 [GitHub](https://github.com/Mamdouh-Attia)
🔗 [LinkedIn](https://www.linkedin.com/in/mamdouh-attia)

---

## 🗂️ Project Tracking

* [🐛 Issues](https://github.com/Mamdouh-Attia/mamdouh_ahmed_portfolio/issues)

---

## 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

**Made with ❤️ in Flutter**
