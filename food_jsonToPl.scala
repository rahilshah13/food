import ujson.*
import java.io.{File, PrintWriter}

@main def runConverter(): Unit =
  try {
    val content = scala.io.Source.fromFile("food.json").mkString
    val json = ujson.read(content)
    val writer = new PrintWriter(new File("food.pl"))
    val foods = json("FoundationFoods").arr
    
    foods.foreach { food =>
      val desc = food("description").str.replace("'", "\\'")
      val id = food.obj.get("fdcId").map(_.num.toLong).getOrElse(0L)
      
      val nutrientList = food("foodNutrients").arr.flatMap { n =>
        if (n.obj.contains("nutrient")) {
          val name = n("nutrient")("name").str.replace("'", "\\'")
          val raw = n.obj.get("amount").map(_.num).getOrElse(0.0)
          val unit = n("nutrient")("unitName").str
          
          val g = unit match {
            case "mg" => raw / 1000.0
            case "µg" => raw / 1000000.0
            case "g"  => raw
            case _    => raw
          }
          Some(s"nutrient('$name', $g)")
        } else None
      }.mkString(", ")
      
      // Write the fact to the file
      writer.println(s"food_data($id, '$desc', [$nutrientList]).")
    }
    
    writer.close()
    println("Successfully wrote facts to food.pl")
    
  } catch {
    case e: Exception => println("Error: " + e.getMessage)
  }