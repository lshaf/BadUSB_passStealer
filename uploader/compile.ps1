poetry install | Out-Null
poetry run pyinstaller --onefile core.py | Out-Null
rm ..\other_files\uploader.exe | Out-Null
mv .\dist\core.exe ..\other_files\uploader.exe | Out-Null
