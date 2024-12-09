# ICGFinal


Lecture/Tutorial Class Assets Used:
Glass Texture from lecture, modified in photoshop.
Toon Ramp Texture.
default LUT, modified in photoshop.

Softwares Used:
Unity
Aseprite for Textures (coin, trees)
Photoshop for Texture (yoshi, LUT)

# Color Correction
\n
A color correction is applied on the camera through a post-process effect. This is done through a LUT to look up replacement colors during runtime. A LUT holds a collection of the color data the screen might use and alters it toward the new values we desire.

I wanted to try and create a bright or pastel effect with the LUT, because the image im looking at for the game appears to be very homogenous in color, so i want to raise the levels uniformly. I also wanted to inject some uniform color, so i picked yellow. my aim was to 'wash out' the image, with the intention of using low contribution to make everything feel united.

Implementation Process:
Step 1, open photoshop and place the LUT and our Scene.
<img width="680" alt="preModified" src="https://github.com/user-attachments/assets/11b48cfc-171a-424b-9319-dc68901e9c7f">


Step 2, I chose to use the levels channel to lower the midpoint, effectively adding some amount of white to all color. I also added a bit of yellow as well.
<img width="596" alt="postmodify" src="https://github.com/user-attachments/assets/e9b38a68-714c-496e-96e7-5b98d3fa090a">

Step 3, crop and export LUT
![LevelledLUT3](https://github.com/user-attachments/assets/fc6f5cb0-cc43-4b43-9153-241be9c2c361)

Step 4, create color correction Shader:
<img width="513" alt="image" src="https://github.com/user-attachments/assets/becec6cb-5f89-419c-ae6e-d5747fdd1983">

Step 5, apply script to the camera
<img width="444" alt="image" src="https://github.com/user-attachments/assets/7d89711f-b403-4afa-97d8-d714c4f5119b">

Step 6, tweak contribution value to satisfaction.
<img width="1200" alt="image" src="https://github.com/user-attachments/assets/2f92ad48-f146-4fa0-84cc-ae71e6e92dca">



