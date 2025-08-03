
# 🐧 Bash Scripting Mastery – DevOps Hands-On

This directory is part of the **DevOps-Hands-On** repository and contains a structured, 
example-driven journey through Bash scripting fundamentals, shell logic, stream editing, and task automation. Ideal for beginners and intermediate learners looking to enhance scripting fluency and automation literacy in Unix-like environments.

---

## 📁 Folder Overview

All examples and lessons are housed in:

```bash
2BashScripting/
└── Codes/
    ├── *.sh 
	├── *.yaml    # Annotated command breakdowns and usage docs
```

Your primary script (`00-Learning Basics.sh`) introduces the fundamentals where I try and test and adding script notes, while the `.yaml` files explain Bash concepts from basic file handling to stream editing and task scheduling.

---

## 🧭 Topics Map

Grouped for learning progression:

### 🟩 Bash Fundamentals
- `00-Learning Basics.sh`: Syntax, permissions, execution
- `01- create file.yaml`: File creation via shell
- `02- Local Variable.yaml`: Local scope handling
- `03- Envirment Variable.yaml`: Exporting environment variables
- `04- Exit status.yaml`: Interpreting exit codes
- `05- Specific (Predefined) Variables.yaml`: `$HOME`, `$USER`, etc.
- `06- Arithmetic Operations.yaml`: Math operators

### 🟨 Input, Output & Substitution
- `07- Command Substitution.yaml`
- `08- Brace Expansion.yaml`
- `09- Read User Input.yaml`
- `21- Read Line By line.yaml`

### 🟧 Conditions & Control Flow
- `10- Conditional Operators.yaml`
- `11- if statement.yaml`
- `12- if statment using File Operators.yaml`
- `13- Regular Expressions.yaml`
- `14- Case Statement.yaml`

### 🟦 Looping Constructs
- `15- Array.yaml`
- `16- For Loop.yaml`
- `17- Continue And Break.yaml`
- `18- Select Command.yaml`
- `19- While Loop.yaml`
- `22- Until Loop.yaml`

### 🟨 Modular Scripting
- `20- Shift Command.yaml`
- `23- Functions.yaml`
- `24- Source command.yaml`

### 🟥 Stream Editing & Parsing
- `25- Sed.yaml`, `26- Addressing.yaml`, `27- SED Operator.yaml`, `28- Scripts with SED.yaml`
- `29- Explain AWK.yaml`, `30- AWK Variables.yaml`, `31- Opreatins in AWK.yaml`, `32- If statement in Awk.yaml`, `33- For Loop in AWK.yaml`

### ⏱ Scheduling & Automation
- `34- at command.yaml`
- `35- Crontab.yaml`

---

## 🚀 How to Use

### 🔧 Setup
```bash
chmod +x Codes/*.sh
bash Codes/00-Learning\ Basics.sh  | ./Codes/00-Learning\ Basics.sh
```

You can also execute YAML breakdowns by reading comments and running the matching commands interactively.

---

## 🧪 Learning Methodology

Each topic follows:
- ✅ Concept breakdown (via `.yaml`)
- 🧠 Annotated command lines
- 🛠 Mini challenges
- 🔁 Suggested exercises


---

## 🔄 Contribution & Version Control

To extend or correct a topic:
```bash
git clone https://github.com/AhmedAlhusaini/DevOps-Hands-On.git
cd 2BashScripting/Codes
# Create a branch
git checkout -b patch-topic-XYZ
# Add your file
git add "Codes/36-NewTopic.yaml"
git commit -m "Add new Bash topic XYZ"
git push origin patch-topic-XYZ
```

---

## 🌐 Localization

Arabic/Bilingual versions of key files are coming soon.
If you'd like to contribute to translation or structure files for dual-language learners, open an issue or pull request.

---

## 📖 License

This project is openly accessible for **educational and personal use**. For commercial reuse or course integration, contact the author directly.

---

## ✅ Recommended Next Steps

- Clone the repo
- Follow the files in order (`00` ➡ `35`)
- Pair YAML explanations with shell execution
- Build your own exercises from templates
- Share your progress on GitHub
- Follow Me 

---
## ☕ Support My Work

If this repo helped you, consider supporting my mission:  
Empowering **Careers**, building the **Next Generation Spatial Infrastructure**, and advancing **GIS DevOps & Cloud Learning** 🚀

![Buy Me A Coffee](../../Assets/buyme.gif)

- [☕ Buy Me a Coffee](https://buymeacoffee.com/ahmedalhusainy)  
- 📺 [Subscribe to My YouTube – GISOverflow](https://www.youtube.com/@GISOverflow)  
- 💻 [Follow Me on GitHub](https://github.com/AhmedAlhusaini)  
- 📅 [Book a 1:1 Mentorship Session](https://tidycal.com/ahmedtarekalhusainy)