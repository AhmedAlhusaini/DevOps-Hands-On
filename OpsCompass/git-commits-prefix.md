

## 📖 Git Commit Prefixes Explained

### **feat:** → *Feature*
- **Meaning:** Introduces a new feature or capability to the project.
- **Use case:** Adding a new API endpoint, implementing a new dashboard, or enabling a new configuration option.
- **Example:**  
  `feat: add user authentication with JWT`

---

### **fix:** → *Bug Fix*
- **Meaning:** Corrects an error, bug, or unintended behavior in the code.
- **Use case:** Resolving a crash, fixing a typo that breaks functionality, or correcting logic in a function.
- **Example:**  
  `fix: resolve null pointer exception in login flow`

---

### **docs:** → *Documentation*
- **Meaning:** Changes only to documentation files (README, guides, tutorials, inline comments).
- **Use case:** Updating installation instructions, adding usage examples, or fixing typos in docs.
- **Example:**  
  `docs: update setup guide with Kubernetes steps`

---

### **chore:** → *Maintenance*
- **Meaning:** Routine tasks, configuration, or setup changes that don’t affect application logic.
- **Use case:** Updating dependencies, modifying build scripts, or adjusting project settings.
- **Example:**  
  `chore: update npm dependencies to latest versions`

---

### **refactor:** → *Code Restructuring*
- **Meaning:** Improving code structure without changing its external behavior.
- **Use case:** Renaming variables, reorganizing functions, splitting large files into modules.
- **Example:**  
  `refactor: simplify alertmanager config parsing`

---

### **style:** → *Code Style*
- **Meaning:** Formatting, whitespace, linting, or stylistic changes that don’t affect logic.
- **Use case:** Fixing indentation, applying Prettier/ESLint rules, or adjusting naming conventions.
- **Example:**  
  `style: apply consistent spacing in YAML configs`

---

### **test:** → *Testing*
- **Meaning:** Adding or updating tests to ensure code quality.
- **Use case:** Writing unit tests, integration tests, or updating test cases for new features.
- **Example:**  
  `test: add unit tests for PromQL parser`

---

### **perf:** → *Performance*
- **Meaning:** Improving speed, efficiency, or resource usage.
- **Use case:** Optimizing queries, reducing memory usage, or improving response times.
- **Example:**  
  `perf: optimize Prometheus scrape interval for large clusters`

---

### **ci:** → *Continuous Integration*
- **Meaning:** Changes to CI/CD pipelines, workflows, or build configurations.
- **Use case:** Updating GitHub Actions, Jenkins pipelines, or Docker build scripts.
- **Example:**  
  `ci: add GitHub Actions workflow for automated testing`

---

## 🔑 Why Use These Prefixes?
- **Consistency:** Makes commit history easier to read and understand.  
- **Automation:** Tools can generate changelogs automatically based on prefixes.  
- **Clarity:** Team members instantly know the purpose of each commit.  
- **Best Practice:** Widely adopted across open-source and enterprise projects.  
