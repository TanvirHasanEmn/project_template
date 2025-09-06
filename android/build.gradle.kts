allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
//* firebase
buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // ✅ Add this classpath for Google Sign-In support
        classpath ("com.google.gms:google-services:4.4.2")  //* change version from 4.4.3 to 4.3.15
    }
}
//* firebase

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
