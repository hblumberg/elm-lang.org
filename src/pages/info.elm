
import Html exposing (..)

import Center
import Skeleton


port title : String
port title =
  "More Information"


main =
  Skeleton.skeleton "info" [ Center.markdown "600px" info ]



info = """
<br><br>
My name is Hannah Blumberg, and I am a senior at Harvard College studying computer science. For my senior thesis, I am developing an introductory computer science curriculum using a programing language called Elm. The course is planned for one semester (~12 weeks), with one hour-long class each week. It is aimed towards high school students with no prior experience with computer science or programming. The only background knowledge assumed is a basic understanding of the Cartesian coordinate system. The course will provide students with the skills necessary to program in Elm and explore other programming languages and topics in computer science, independently or in future courses. The course is also designed to foster students’ creativity and problem solving skills. Each week, students will have the opportunity to create web-based graphics, including drawings, animations, and games.
"""
