НЕОБХОДИМЫЕ СРЕДСТВА ДЛЯ РАЗРАБОТКИ

==== Java Development Kit 17 ====
1. Установить jdk-17_windows-x64_bin

==== Java FX 17.0.10 ====
1. Распаковать openjfx-17.0.10_windows-x64_bin-sdk и openjfx-17.0.10_windows-x64_bin-jmods (Extract Here) куда следует в путь %EXTRACTION%
2. Создать переменные среды:
	PATH_TO_FX_MODS
	%EXTRACTION%\javafx-jmods-17.0.10

	PATH_TO_FX
	%EXTRACTION%\javafx-sdk-17.0.10\lib

==== Microsoft Java Development Kit 17.0.10 ==== 
1. Установить microsoft-jdk-17.0.10-windows-x64

==== Intellij IDEA ====
1. Установить Intellij IDEA 2021.3.2

РАБОТА НАД ПРОЕКТОМ

Используемые библиотеки для отладки подключены к проекту в обход системы сборки Maven напрямую в настройках структуры проекта IntellijIDEA. Оффлайн-версии библиотек расположены в папке ext_libs.

Выходные файлы (JAR, JRE, exe) генерируются в папку out. Для генерации исполняемого файла необходимо сделать следующие шаги:
- сгенерировать JAR (из IntellijIDEA);
- сгенерировать образ среды исполнения JRE (с помощью утилиты JLink из состава Microsoft SDK);
- из имюещихся JAR и образа JRE собрать .exe (launch4j или JPackage из состава Microsoft SDK).

Создание JAR: в IntellijIDEA File->Project Structure, вкладка Artifacts. Удостовериться в наличии Artifact с именем <OUTPUT_NAME>. В случае отсутствия
Add -> JAR -> From module with dependencies. Далее:
- MainClass - указать класс, который содержит psvm, вызывающий метод Application.launch();
- copy to the out directory and link via manifest;
- directory for MET-INF/MANIFEST.MF должен указывать на путь resources в проекте
После создания Artifact убедиться, что Output directory соответствует out\<OUTPUT_NAME>, а имя - <OUTPUT_NAME>. Сохранить изменения
Затем в IntellijIDEA Build -> Build Artifacts -> Build/Rebuild для генерации JAR, Clean для очистки.

Создание образа среды выполнения (Java Runtime Environment):
- Выполнить jlink_pack.bat.
При добавлении новых зависимостей убедиться, что пути их расположения прописаны в разделе --module-path через ";" или просто сложить их в папку ext_libs\jars, а также проверить
перечисление в разделе --add-modules через ",". Выходной каталог установлен как out\<OUTPUT_NAME>\jre.
После выполнения jlink_pack.bat можно удостовериться в корректности сборки, запустив launch_local.bat, который запускает созданный ранее JAR-архив через java.exe из созданного ранее JRE.
ПРИМЕЧАНИЕ: javafx.graphics,javafx.media,javafx.swing,javafx.web из %PATH_TO_FX_MODS% исключены, так как в текущей реализации проекта не используются.

Создание .exe
Можно использовать утилиту launch4j, указав:
- *JAR - выбрать сгенерированный <OUTPUT_NAME>.jar;
- *Output file - скопировать путь <OUTPUT_NAME>.jar и заменить расширение файла на .exe;
- Icon - использовать файл src\main\resources\ru\vniirt\<OUTPUT_NAME>\favicon.ico/
Также во вкладке JRE указать путь к образу среды исполнения. Путь относителен к исполняемому JAR, то есть достаточно прописать "jre" в строке Bundle JRE paths.
Далее нажать на кнопку шестерёнки и сохранить .xml с настройками в папке с Jar, после чего должен появиться .exe.