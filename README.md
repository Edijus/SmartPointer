# SmartPointer
SmartPointer for Delphi
A lightweight generic smart pointer implementation in Delphi using interfaces for automatic memory management.
No more manual Free calls—let the compiler handle cleanup via interface reference counting.

🚀 Features
Automatic object lifetime management using Delphi's interface reference counting.

Generic and type-safe.

Supports optional external ownership of objects.

Clean and easy to use.
 Lifetime Safety
No need to Free the object manually—when _List goes out of scope, the underlying TStringList is automatically released.

📦 Installation
Simply add the SmartPointer.pas unit to your project.

📘 API
TSmartPointer<T: class, constructor>
Method	Description
Create	Creates a smart pointer with a new instance of T.
Create(AValue: T)	Wraps an existing instance. If AValue is nil, creates a new one.
Invoke: T	Returns the underlying object of type T.
ISmartPointer<T> = reference to function: T
A functional interface to enable direct method calls on the wrapped object, e.g.:
_SmartList.Add('Hello World');
🛠 Internals
Uses TInterfacedObject for reference-counted management.

FreeAndNil is used for safety during destruction.

🤓 Notes
This is a simplified smart pointer pattern—ideal for objects that follow typical ownership patterns.

Be mindful when using this with objects that are managed elsewhere or have circular references.

