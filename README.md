# Test‑Driven Development (TDD) Exercise – Strict Naming Convention

## Overview
Students will practice **Test‑Driven Development** in Java while adhering to a **strict naming convention** for packages, classes, and test files. The repository can be **cloned automatically** by clicking the **Start Exercise** badge.

## Repository Structure
```
week1-tdd-exercise/
├── pom.xml                     # Maven build file (JUnit 5)
├── README.md                  # This file (you are reading it)
├── start_exercise.sh          # Script that clones the repo for the student
├── src/
│   ├── main/java/vehicles/
│   │   └── Vehicle.java        # Production stub (empty initially)
│   └── test/java/vehicles/
│       └── VehicleTest.java   # Test file (student writes first)
└── .github/workflows/ci.yml   # GitHub Actions CI workflow
```

## Naming Convention Rules
| Element | Required Pattern |
|---------|-------------------|
| **Package** | All source files must be under `vehicles` package. Example: `package vehicles;` |
| **Production Class** | Class name must be **PascalCase** and describe the entity, e.g., `Vehicle`. The file name must match the class name (`Vehicle.java`). |
| **Test Class** | Test class name must be the production class name followed by `Test`, e.g., `VehicleTest`. File name must be identical (`VehicleTest.java`). |
| **Test Method** | Method names should be `should<Behavior>` in camelCase, e.g., `shouldAddTwoNumbers`. |
| **Directory Layout** | `src/main/java/<package>/` for production code, `src/test/java/<package>/` for tests. |
| **Maven Coordinates** | GroupId: `com.example.tdd`, ArtifactId: `week1-tdd-exercise`. |

## Exercise Flow
1. **Start the exercise** by clicking the badge below. This runs `start_exercise.sh`, which clones the repo into a fresh directory on your machine.
2. **Create a feature branch** (e.g., `tdd‑calculator`).
3. **Write the failing test** in `src/test/java/vehicles/VehicleTest.java` following the naming rules above.
4. **Commit & push** – the CI workflow will run and **fail** because `Vehicle` is not implemented.
5. **Implement the `Vehicle` class** in `src/main/java/vehicles/Vehicle.java` so the test passes.
6. **Commit & push** – CI should now **pass**.
7. (Optional) Add more tests (e.g., `shouldTurnOnEngine`) and repeat the red‑green‑refactor cycle.

---
### Start Exercise Badge
[![Open Exercise](https://img.shields.io/badge/Open-Exercise-blue?logo=github)](https://github.com/your-org/week1-tdd-exercise)

> **Note:** This badge links to the public repository in the organization. Students can fork or clone it directly from GitHub.

---
## CI Workflow (`.github/workflows/ci.yml`)
```yaml
name: Java CI

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: "17"
          distribution: "temurin"
      - name: Build with Maven
        run: mvn -B test
```

---
### Helpful Tips
- Keep commits small after each TDD step (Red → Green → Refactor) so the CI history shows the transition clearly.
- Use the naming convention strictly; the CI will fail the build if files are mis‑named (you can add a Maven Checkstyle plugin later to enforce this).

Happy coding!
