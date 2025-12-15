1. Project Purpose

A simple To-Do app where users can:

Add tasks

View tasks

Mark tasks as completed

Delete tasks

Store everything locally

2. Folder Structure (1-line each)

models/ – Task model

providers/ – State management (tasks & theme)

services/ – Local storage (SharedPreferences)

screens/ – UI pages

widgets/ – Reusable components

config/theme/ – Light/Dark theme setup

3. Key Functionality
✔ Add a Task

From AddTaskScreen → TaskProvider → Saved via SharedPreferences.

✔ View Tasks

TodoListScreen displays tasks from provider.

✔ Mark as Completed

Toggling icon updates task state and saves instantly.

✔ Delete Task

Delete icon or swipe-to-delete → removes task → updates storage.

4. State Management

Using Provider + ChangeNotifier for:

Automatic UI updates

Clean separation of logic

5. Local Storage

Used SharedPreferences with JSON encoding:

Fast

Lightweight

Easy to migrate later

6. Theme Support

Light/Dark mode toggle with saved preference.