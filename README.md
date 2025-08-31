# Air Quality Monitoring and Alert System (FPGA + VHDL)

This repository contains the **complete hand-designed VHDL implementation** of a real-time **Air Quality Monitoring and Alert System** built on an **FPGA (Cyclone V)**.  
The system processes noisy air quality sensor inputs, applies a **regression-based noise filtering model**, and provides **clear real-time outputs** through LEDs and seven-segment displays.

Unlike auto-generated HDL, every single component here has been **carefully written by hand**, line by line, ensuring a deep understanding of the underlying digital design. This project demonstrates not only the technical outcome but also the philosophy of mastering fundamentals without shortcuts.

---

## 🔹 Project Motivation

Air quality has a direct impact on human health and environmental sustainability. However, existing sensors often provide **noisy, unreliable data** that is difficult to interpret in real-time.  
Our goal was to design a **reliable, hardware-level solution** that:

- Filters noise using **regression techniques**.  
- Processes inputs **in real-time** using FPGA parallelism.  
- Displays **precise AQI values** numerically on a seven-segment display.  
- Provides **intuitive visual feedback** with LEDs that change/blink based on severity levels.

---

## 📂 Repository Contents

This repo includes all the core VHDL modules, each **hand-designed** to be modular and reusable:

- **accu.vhd** – Counter/accumulator used for timing and system control.  
- **arch.vhd** – Top-level architecture combining all modules.  
- **bcdtoseven.vhd** – BCD-to-seven-segment decoder for human-readable output.  
- **binaryToBCD.vhd** – Binary-to-BCD converter for AQI display.  
- **blinker.vhd** – Clock divider and blinker for LED signaling.  
- **LEDcontrol.vhd** – State-based LED control with static and blinking modes.  
- **mux8x1.vhd** – 8-to-1 multiplexer for routing signals.  
- **comparator.vhd** – Digital comparator used in multiple decision processes.  
- **reg.vhd** – Regression unit implementing AQI model.  
- **stateDecider.vhd** – State machine mapping AQI to quality levels.

---

## 🛠️ System Design

The system was developed step by step, starting from basic building blocks and moving toward a complete framework:

1. **Basic Components**  
   - Multiplexer, Counter (Accu), Comparator — form the digital backbone.  
2. **Regression Model**  
   - Derived using **Excel** and **MATLAB** from training data.  
   - Finalized as a **parabolic equation** hand-implemented in VHDL using shifts, multipliers, and adders.  
3. **Blinker Module**  
   - Hierarchical counters and comparators to divide 50 MHz clock down to human-visible blinking frequency.  
4. **State Decider**  
   - Maps AQI values into **five categories**: Good, Moderate, Unhealthy for Sensitive Groups, Unhealthy, Very Unhealthy.  
5. **LED Control**  
   - LEDs remain **static** in safe states, but **blink dynamically** in hazardous states.  
6. **Display Pipeline**  
   - AQI is converted from binary → BCD → seven-segment for real-time display.

---

## 🔬 Experimental Testing

- **Testing Environment:** Implemented on **Cyclone V FPGA** using **Quartus II**.  
- **Inputs:** CO₂ levels entered via FPGA switches (8-bit digital input).  
- **Outputs:**  
  - **Seven-segment display** shows exact AQI values.  
  - **LEDs** provide severity indication, with blinking patterns for hazardous levels.  

**Examples:**  
- AQI ≤ 50 → All LEDs ON (Good).  
- AQI 101–150 → Third LED starts blinking (Unhealthy for sensitive groups).  
- AQI > 200 → All LEDs blink (Very Unhealthy).  

The system was validated across multiple test cases and matched the expected AQI categories with high accuracy.

---

## 📊 Training Data and Regression

- Regression coefficients derived from **Excel plots** and solved using **MATLAB** matrix methods.  
- Adjustments made to ensure **no negative AQI values**.  
- Final regression equation implemented entirely with **binary arithmetic** (shifts, adds, multiplies).  
- Training data and coefficient calculations are included in this repository.

---

## 🚀 Key Features

- **100% hand-written VHDL** (no generators, no black-box IPs).  
- Modular structure: each component is reusable in other FPGA projects.  
- Demonstrates **parallel FPGA processing** advantages over microcontrollers.  
- Visual + numerical outputs for clarity.  
- Educational, transparent, and extendable.

---

## 📌 Lessons Learned

Through this project, we learned:  
- How to **design, test, and debug VHDL code** manually.  
- How to translate **mathematical regression models** into efficient digital logic.  
- The power of **modularity**, reusing counters, muxes, and comparators across multiple subsystems.  
- The importance of **systematic testing** using LEDs and seven-segment displays as immediate feedback.  

---

## 🖥️ How to Use

1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
---

## Demo

   https://www.youtube.com/watch?v=dIo4RSy9sFQ&ab_channel=Fares_ja
