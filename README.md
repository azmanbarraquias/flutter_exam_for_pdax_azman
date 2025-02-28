# Flutter Exam for PDAX
<img src="https://github.com/azmanbarraquias/flutter_exam_for_pdax_azman/blob/main/assets/gif_sample.gif" width=30% height=30%> <img src="https://github.com/azmanbarraquias/flutter_exam_for_pdax_azman/blob/main/assets/browser_build.png" width=35% height=30%>  <img src="https://github.com/azmanbarraquias/flutter_exam_for_pdax_azman/blob/main/assets/desktop_build.png" width=30% height=30%>
<br>
 This is my Flutter exam for PDAX, where I created an application using FakeAPI (https://fakerapi.it/en) to fetch and display data in a list or table. The exam showcases my skills in fetching API responses and implementing features such as page refresh, end-of-list detection, and data display.

<br>

# Flutter Exam

## Task Description
This is a Flutter application that retrieves a list of persons from **FakeAPI** ([fakerapi.it](https://fakerapi.it/en)) and displays them in a list/table. The application supports **infinite scrolling**, **pull-to-refresh**, and **detailed item views**.

This task was completed to demonstrate the ability to fetch, display, and manage data efficiently in a Flutter application.

## 🛠 Features
- ✅ **Fetch & Display Data** from FakeAPI
- ✅ **Infinite Scrolling** (Mobile) & **Load More Button** (Web)
- ✅ **Pull-to-Refresh (Mobile) & Refresh Button (Web)**
- ✅ **Detailed View for Each Person**
- ✅ **Pagination Handling** (Since FakeAPI lacks real pagination)

## 📌 Requirements
### **1. Platforms Supported**
- 📱 **Android** ✅
- 🍏 **iOS** (no device, available on March 15)
- 🌍 **Web** ✅
- 🖥️ **Windows** ✅
- 💻 **MacOS** (no device, available on March 15)
- ⌚ **WearOS** ✅(Protoype)

### **2. Data Fetching**
- Fetch **20 persons** per request. ✅
- Initial load fetches data from the first page. ✅
- **Infinite scrolling** to fetch more data. ✅
- If no more data is available, display a **"No more data"** message. ✅

### **3. Displaying Data** 
- Initial load fetches the **first 10 persons**. ✅
- Infinite scrolling loads more persons. ✅
- On the **4th load attempt**, show **"No more data available"** instead of fetching more. ✅
- Implement **pull-to-refresh (mobile)** and **refresh button (web)** to reload the first page. ✅

### **4. Data Fields Displayed**
- 👤 **Name** ✅
- 📧 **Email** ✅
- 🖼️ **Profile Image** ✅

## 🚀 Getting Started
<img src="https://miro.medium.com/v2/resize:fit:3840/1*-XHpdhmBoEU-K3pSPWTX3g.png" width=10% height=10%>

### **1. Use the Latest Flutter 3.29**
- https://docs.flutter.dev/get-started/install

### **2. Clone the Repository**
```sh
git clone https://github.com/azmanbarraquias/flutter_exam_for_pdax_azman.git
cd flutter_exam_for_pdax_azman
run flutter_exam_for_pdax_azman
```

## ⭐ Bonus: example flutter using RestAPI for WearOS
Android WearOS using flutter 3.29 <br>
<img src="https://github.com/azmanbarraquias/flutter_exam_for_pdax_azman/blob/main/assets/build_wearos.jpg" width=50% height=50%>
