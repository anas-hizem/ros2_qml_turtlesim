# ROS2 QML Turtlesim Controller

## Description

Le projet ROS2 QML Turtlesim Controller est une application démonstrative qui permet de contrôler une tortue dans le simulateur Turtlesim de ROS2 à l'aide d'une interface utilisateur développée avec Qt Quick et QML. L'application utilise des commandes ROS2 pour publier des messages de commande sur le topic `/turtle1/cmd_vel`, permettant ainsi de déplacer la tortue en avant, en arrière, à gauche, à droite, ainsi que des mouvements diagonaux. Le projet inclut également un contrôle de la vitesse via un `Slider` intégré dans l'interface QML.

## Prérequis

- **ROS 2 Jazzy** : Le projet est compatible avec ROS 2 Foxy ou versions ultérieures. [Instructions d'installation de ROS 2](https://docs.ros.org/en/jazzy/Installation.html)
- **Qt 5** : Installez Qt 5 ainsi que les modules nécessaires : QtCore, QtQuick, et QtGui. [Instructions d'installation de Qt 5](https://doc.qt.io/qt-5/gettingstarted.html)
- **CMake** : Outil de gestion de construction requis pour compiler le projet. [Instructions d'installation de CMake](https://cmake.org/install/)
- **ament_cmake** : Outil de construction pour les projets ROS2, utilisé pour construire les packages ROS2.
- **libqt5-core** et **libqt5-quick** : Bibliothèques Qt5 Core et Qt5 Quick, respectivement.


## Installation

1. **Clonez le dépôt** :
    ```bash
    git clone https://github.com/anas-hizem/ros2_qml_turtlesim.git
    cd ros2_qml_turtlesim
    ```

2. **Construisez le projet** :
    Assurez-vous que vous avez `colcon` installé pour construire les packages ROS2.
    ```bash
    cd ros2_ws
    colcon build
    ```

3. **Sourcez l'espace de travail** :
    ```bash
    source install/setup.bash
    ```

4. **Installez les dépendances Qt** :
    Sur Ubuntu, vous pouvez installer les dépendances requises en utilisant `apt` :
    ```bash
    sudo apt-get install qtbase5-dev qt5-qmake
    ```

## Implémentation

Le projet est structuré de manière à séparer les différentes responsabilités :

- **Interface Utilisateur (QML)** : Développée en QML pour fournir une interface graphique intuitive permettant de contrôler la tortue.
- **Communication ROS2 (C++)** : Code C++ pour la gestion des communications ROS2, incluant la publication des messages de commande.
- **Main Application (C++)** : Point d'entrée de l'application, initialisant l'environnement Qt et chargant l'interface QML.

## Architecture du Projet

La structure du projet est la suivante :

ros2_ws/src/ros2_qml_turtlesim/
├── build # Répertoire généré lors de la construction
├── CMakeLists.txt # Fichier de configuration de CMake
├── package.xml # Déclaration des métadonnées du package ROS2
├── src
│ ├── main.cpp # Point d'entrée de l'application
│ ├── rclcomm.cpp # Implémentation de la communication ROS2
│ ├── rclcomm.h # Déclaration de la classe de communication ROS2
│ ├── qml.qrc # Ressources QML
│ └── main.qml # Interface utilisateur QML



### Architecture ROS

1. **Node** : Un nœud ROS2 appelé `ros2_qt_pub` est créé dans `rclcomm.cpp`.
2. **Publisher** : Un éditeur de messages `geometry_msgs/msg/Twist` est utilisé pour publier les commandes sur le topic `/turtle1/cmd_vel`.
3. **Messages** : Les messages publiés contiennent des commandes de vitesse linéaire et angulaire.

### Réalisation

1. **Interface Utilisateur** :
   - **QML** : Contient des boutons et un `Slider` pour contrôler les mouvements de la tortue. Les boutons envoient des commandes spécifiques, tandis que le `Slider` ajuste la vitesse.
   - **Slider** : Permet de régler la vitesse de la tortue. La valeur du `Slider` est transmise à la méthode `setSpeed` de la classe C++.

2. **Communication ROS2** :
   - **C++** : La classe `RclComm` gère la communication avec ROS2. Les messages de commande sont publiés en fonction des actions des boutons et de la vitesse du `Slider`.

3. **Compilation** :
   - Le projet est compilé en utilisant CMake et les dépendances Qt5.
   - Le binaire résultant est exécuté pour lancer l'application.

## Exécution

1. **Lancez le simulateur Turtlesim** :
    ```bash
    ros2 run turtlesim turtlesim_node
    ```

2. **Exécutez l'application** :
    ```bash
    cd ros2_ws/src/ros2_qml_turtlesim/build
    ./ros2_qml_turtlesim
    ```

Vous devriez voir une interface QML qui vous permet de contrôler la tortue dans le simulateur Turtlesim en utilisant les boutons et le `Slider` pour ajuster la vitesse.

## Contribution

Les contributions sont les bienvenues ! Si vous avez des suggestions ou des corrections, veuillez ouvrir une issue ou soumettre une pull request.

## Licence

Ce projet est sous la licence [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

---

Si vous avez des questions, n'hésitez pas à me contacter à l'adresse suivante : anas.hizem@ensi-uma.tn.
