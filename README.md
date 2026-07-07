# 🧺 EasyWash App

EasyWash is an IoT-based smart laundry application that allows users to remotely control washing machines, monitor washing status in real time, schedule washing sessions, and receive notifications through a mobile application.

## 📖 Overview

EasyWash was developed to improve the experience of using self-service washing machines. Instead of manually operating the machine, users can start, monitor, and manage the washing process directly from their smartphones.

The system communicates with an ESP32 microcontroller through the MQTT protocol, enabling real-time control and status updates.

## ✨ Features

- 📱 User authentication (Sign In / Sign Up)
- 🧺 Select an available washing machine
- ⚙️ Choose washing programs
- ▶️ Start washing remotely
- ⏰ Schedule washing time
- 📡 Real-time washing status monitoring
- 🔔 Push notifications when washing is complete
- 👤 User profile management

## 🛠️ Technologies

### Mobile
- Flutter
- Dart

### Backend / IoT
- ESP32
- MQTT Protocol
- Relay Module
- 7-Segment Display

### Tools
- Firebase (Optional)
- Git & GitHub
- Arduino IDE

## 🏗️ System Architecture

```
Mobile App
      │
      ▼
    MQTT Broker
      │
      ▼
     ESP32
      │
      ▼
 Relay Module
      │
      ▼
 Washing Machine
```

## 📂 Project Structure

```
EasyWash_App/
│── lib/
│── assets/
│── images/
│── hardware/
│── docs/
│── README.md
│── pubspec.yaml
```

## 🚀 How It Works

1. User signs in to the EasyWash application.
2. Select an available washing machine.
3. Choose the desired washing program.
4. The mobile application sends commands to ESP32 through MQTT.
5. ESP32 controls the relay module to start the washing machine.
6. Users can monitor the washing status in real time.
7. A notification is sent when the washing process is completed.

## 📸 Screenshots

> Add application screenshots here.

## 🔮 Future Improvements

- QR Code machine selection
- Online payment integration
- Machine reservation system
- Laundry usage history
- Admin dashboard
- Energy consumption monitoring
- Multi-language support

## 👨‍💻 Author

**Your Name**

Computer Engineering Student  
Kasetsart University, Sakon Nakhon Campus

---

⭐ If you find this project useful, please consider giving it a star.
