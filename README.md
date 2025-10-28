
# 📊 TablePluse

**TablePluse** is an integrated application designed to help developers and teams **visualize and understand SQL database tables** with clarity. It provides tools to explore table structures, analyze relationships, and gain insights into your data schema — laying the groundwork for future enhancements like UI screen mapping and app design integration.

---

## 🚀 Features (Current)

- ✅ Explore table structure: columns, data types, constraints, keys  

---

## 🔭 Future Plans

While TablePluse currently focuses on schema exploration, future updates will introduce:

- 🖼️ Screen planning linked to database entities  
- 📐 Auto-generated ER diagrams with customization  
- 📋 Documentation generation and export options  
- 👥 Collaboration features for teams  
- 🔄 Schema version tracking and history
- ✅ Visualize SQL tables and their relationships
- ✅ Easy-to-navigate interface for understanding database schemas  
- ✅ Supports common relational databases (e.g., MySQL, PostgreSQL, SQL Server) 

---
## ⚙️ Installation

Clone or download the repository:

```bash
git clone https://github.com/AshokThangavel/Interop-LookupTable.git
````

Build the Docker container:

```bash
docker compose --progress plain build
```

Start the container:

```bash
docker compose up -d && docker compose logs -f
```

Access the InterSystems IRIS **System Management Portal** at:

👉 [http://localhost:52773/csp/sys/UtilHome.csp](http://localhost:52773/csp/sys/UtilHome.csp)

**Access the TablePluse**:

👉 http://localhost:52773/csp/user/TablePluse.Home.cls



## 📁 Project Structure (Early Phase)

```
TablePluse/
├── csp/                # CSP web pages (.csp)
│   └── TablePluse/     # Main CSP application folder
├── src/                # ObjectScript source (.cls, .int, .mac), optional if needed
│   └── TablePluse/     # Package namespace (e.g., TablePluse.Data, TablePluse.Utils)
├── resources/          # Static assets (JS, CSS, images)
├── tests/              # Unit or UI test code (can include TestProduction classes)
├── docs/               # Documentation (markdown, diagrams, etc.)
├── README.md
└── LICENSE
```

---

## 🤝 Contributing

Contributions are welcome! If you have ideas, bug reports, or suggestions, feel free to:

* Submit an [issue](https://github.com/your-username/TablePluse/issues)
* Fork the repo and create a pull request
* Discuss features via GitHub Discussions (coming soon)

---

## 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

*TablePluse — Understand your data before you build with it.*

