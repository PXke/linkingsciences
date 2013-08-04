import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {

  val appName         = "linkingscience"
  val appVersion      = "0.0.1-SNAPSHOT"

  val appDependencies = Seq(
    // Add your project dependencies here,
    javaCore,
    javaJdbc,
    javaEbean,
    "mysql" % "mysql-connector-java" % "5.1.18",
    "commons-io" % "commons-io" % "2.3"
  )

  val main = play.Project(appName, appVersion, appDependencies).settings(
    // Add your own project settings here      
  )

}
