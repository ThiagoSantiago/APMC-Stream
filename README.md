# APMC-Stream: Project Structure & Architecture

This project adopts the **MVVM (Model-View-ViewModel)** architecture, with a strong emphasis on **separation of concerns** and **testability**. It leverages a modular approach to building SwiftUI apps by breaking responsibilities into clear, maintainable layers.

---

### 🔄 Why MVVM?

- **Testability** at every layer
- **Clean abstractions** (e.g. swap real services with mocks for tests)
- **Future scalability**: easy to add persistence, caching, or multiple data sources
- **Two-way binding** with `@StateObject`, `@Published`, and `@Binding` makes it easy to manage state across the View and ViewModel.
- Encourages **modularity** and **reusability** of components.

### Each layer in the MVVM stack has a distinct and focused responsibility:

- **View** (`SwiftUI View`): Handles UI presentation and binds directly to the `ViewModel`. 

- **ViewModel**: Acts as a bridge between the View and Repository. It manages UI state, performs transformations, and handles user interactions. The ViewModel never directly deals with low-level networking or data persistence.

- **Repository**: Responsible for business logic and data coordination. It abstracts away data sources, deciding whether to fetch from cache, local database, or remote API.

- **Network Service**: Handles raw API calls, parsing responses, and dealing with networking errors. This layer is cleanly separated from business logic and UI.

## 📊 Architecture Diagram

<img src="https://github.com/user-attachments/assets/5dc6dc46-ef54-4fa0-8261-d2df8173b63e" width=600/>


---

## 🔧 Dependencies Used

### 📸 [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing)

This project uses **SnapshotTesting** to verify the visual output of SwiftUI views.

**Benefits:**
- Quickly detect **UI regressions**.
- Ensures layout, spacing, and content look correct across different states (loading, empty, error, etc.).
- Great for validating views that depend on dynamic data or conditional rendering.
  

### 🎨 [SwiftGen](https://github.com/SwiftGen/SwiftGen)

**SwiftGen** is used to manage all assets, strings, colors, and icons in a **type-safe** way.

**Benefits:**
- No more strongly-typed asset or color references.
- Compile-time safety for:
  - Color assets
  - Localized strings
  - SF Symbols or custom image assets
- Improves **code autocomplete**, readability, and **reduces runtime crashes** due to typos or missing assets.

---

## ✅ Summary

This architecture + tooling combination results in a clean, maintainable, and scalable SwiftUI codebase with:

- 💡 Clear responsibility boundaries  
- 🧪 Excellent test coverage opportunities  
- 🎯 Type-safe asset access  
- 📸 Visual regression confidence  

---

## ‼️ Assumptions, limitations or problems faced

The only problem found was the endpoint provided (https://run.mocky.io/v3/8419df8e-0160-4a35-a1e6-0237a527c566) that was returning an error, however as the json content was also made available I was able to map the callback using **Proxyman** and continue with the implementation without any other problems.

---
