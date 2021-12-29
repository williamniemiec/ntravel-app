![](https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/logo/logo.jpg)

<h1 align='center'>nTravel</h1>
<p align='center'>Travel guide built with Flutter Framework.</p>
<p align="center">
	<a href="https://github.com/williamniemiec/ntravel-app/actions/workflows/macos.yml"><img src="https://github.com/williamniemiec/ntravel-app/actions/workflows/macos.yml/badge.svg" alt=""></a>
	<a href="https://github.com/williamniemiec/ntravel-app/actions/workflows/ubuntu.yml"><img src="https://github.com/williamniemiec/ntravel-app/actions/workflows/ubuntu.yml/badge.svg" alt=""></a>
	<a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-2.5.3-D0008F.svg" alt="Flutter compatibility"></a>
	<a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-2.14.4-D0008F.svg" alt="Dart compatibility"></a>
	<a href="https://github.com/williamniemiec/ntravel-app/releases"><img src="https://img.shields.io/github/v/release/williamniemiec/ntravel-app" alt="Release"></a>
	<a href="https://github.com/williamniemiec/ntravel-app/blob/master/LICENSE"><img src="https://img.shields.io/github/license/williamniemiec/ntravel-app" alt="License"></a>
</p>
<p align="center">
	<a href='https://play.google.com/store/apps/details?id=wniemiec.app-ntravel&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width=200/></a>
</p>

<hr />

## ❇ Introduction
nTravel is a mobile travel guide application built with Flutter Framework. This application was made for the sole purpose of learning the Flutter framework better.

## ✔ Requiremens
- [NodeJS](https://nodejs.org/en/download/);
- [Android SDK](https://developer.android.com/studio/install);
- [Android SDK Platform](https://developer.android.com/studio/install);
- [Android Virtual Device](https://developer.android.com/studio/install);
- [JDK 8+](https://www.oracle.com/java/technologies/downloads/);
- [Flutter framework](https://flutter.dev);

## ℹ How to run

Type in your terminal (after connecting a device):

1. flutter pub get

2. flutter run


## 🖼 Gallery

<div style="display: flex; flex-direction: row; justify-content: center; align-items: center; flex-wrap: wrap">

<img height=400 src="https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/screens/screen1.png" alt="image 1" />

<img height=400 src="https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/screens/screen2.png" alt="image 2" />

<img height=400 src="https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/screens/screen3.png" alt="image 3" />

<img height=400 src="https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/screens/images4.png" alt="image 4" />

<img height=400 src="https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/screens/images5.png" alt="image 5" />
</div>

## 🚩 Changelog
Details about each version are documented in the [releases section](https://github.com/williamniemiec/ntravel-app/releases).

## 🗺 Project structure
![architecture](https://raw.githubusercontent.com/williamniemiec/ntravel-app/master/docs/images/design/architecture.jpg

## 📁 Files

### /
|        Name        |Type|Description|
|----------------|-------------------------------|-----------------------------|
|android|`Directory`|Android source files|
|ios|`Directory`|iOS source files|
|docs |`Directory`|Documentation files|
|lib  |`Directory`| Application files|

### /lib
|        Name        |Type|Description|
|----------------|-------------------------------|-----------------------------|
|resources|`Directory`|Static files|
|src|`Directory`|Source files|

### /lib/src
|        Name        |Type|Description|
|----------------|-------------------------------|-----------------------------|
|components|`Directory`|Reusable application widgets|
|config|`Directory`|Configuration classes|
|domain|`Directory`|Application domain classes|
|models|`Directory`|Classes that handle with internal storage|
|screens|`Directory`|Application screen classes|
|services|`Directory`|Classes responsible for providing data|
|app.dart|`File`|Application entry point|
