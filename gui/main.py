import sys
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import QtCore, QtGui, QtWidgets
from mainWindow import Ui_MainWindow

def main():
    app = QApplication(sys.argv)

    window = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(window)
    
    window.show()
    sys.exit(app.exec())

if __name__ == "__main__":
    main()

