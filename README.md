# Bash Automation Tools 🚀

A collection of production-ready Bash scripts designed to automate system administration, DevOps tasks, and environment management.

## 🛠️ Included Tools

### 1. System Health & Performance Monitor (`system_monitor.sh`)
A real-time script that inspects infrastructure health metrics and acts as an automated system administrator.

* **Monitors:** Core hard drive (`/`) disk capacity.
* **Alert System:** Automatically triggers a warning if storage thresholds cross **80%**.
* **Logging:** Appends detailed timestamped alerts to a permanent `system_alerts.log` file for continuous monitoring.
* **Cron-Ready:** Architected to run entirely headless in the background via Cron scheduling.

## 🚀 Getting Started

### Prerequisites
Ensure you are running a Linux/Unix environment (including macOS or Windows Subsystem for Linux - WSL) with Bash installed.

### Installation & Execution
1. Clone the repository:
   ```bash
   git clone https://github.com
   cd bash-automation-tools
   ```

2. Grant execution permissions to the script:
   ```bash
   chmod +x system_monitor.sh
   ```

3. Run the monitor manually:
   ```bash
   ./system_monitor.sh
   ```

## 📅 Automation with Cron
To automate this monitor to inspect your system every 10 minutes during standard business hours (9 AM - 5 PM), add the following entry to your `crontab -e`:

```text
*/10 9-17 * * 1-5 /bin/bash /absolute/path/to/system_monitor.sh >> /absolute/path/to/system_alerts.log 2>&1
```

## 🛠️ Built With & Key Concepts Applied
* **Text Filtering Engine:** Applied `awk` columns slicing and `tr` character deletion to sanitize live system metrics.
* **Output Redirection:** Managed standard output buffers (`>`) and append flows (`>>`) to isolate logs.
* **Error Tracking:** Utilized the dynamic exit code status variable (`$?`) to handle logical conditional branches.
* **Debugging Traces:** Integrated `set -x` flag architecture to trace execution paths.
