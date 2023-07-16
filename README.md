# My Next Book

This is an application to give you a new book to read. We're using the Google Books API.

## 🏛 Architecture

This demo architecture is strongly based on
the [Hexagonal Architecture](https://alistair.cockburn.us/hexagonal-architecture/) by Alistair
Cockburn. 
The application also relies heavily in modularization for better separation of concerns
and encapsulation.

Let's take a look in each major module of the application:

* **app** - The Application module. It contains all the initialization logic for the app.
* **features** - The module containing all the visual from the application, separated by features
* **domain** - The modules containing the most important part of the application: the business
  logic. This module depends only on itself and all interaction it does is via _dependency
  inversion_.
* **data** - The module containing the data (local, remote, light etc) from the app

This type of architecture protects the most important modules in the app. To achieve this, all the
dependency points to the center, and the modules are organized in a way that
_the more the module is in the center, more important it is_.

Also, we have a couple modules to work make everything easy:
* **cloudservices** - To create genereric classes for cloud services, such as Firebase.
* **common** - Classes who every module can use.
* **designsystem** - Where we put your common components for presentation, such as themes, views, colors and etc.
* **navigation** - The module where we handle all application navigation. 

## Packages in use

- [riverpod](https://pub.dev/packages/riverpod) for state management
- [freezed](https://pub.dev/packages/freezed) for code generation
- [retrofit](https://pub.dev/packages/retrofit) for talking to the REST API
- [hive](https://pub.dev/packages/hive) for ligth data
- [floor](https://pub.dev/packages/floor) for local data
- [getit](https://pub.dev/packages/get_it) for dependency injection
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images



## 📃 License

```
Copyright 2023 Luan Silva

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
