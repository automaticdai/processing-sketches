# Processing Sketches
This repository is a collection of my Processing sketches. I don't want to have too many repos so I put everything together. Processing is a programming environment for interactive art. A few of these require dependencies to run and some need hardware (including webcam and Kinect). I have clearly stated in the note.

*Credits*: Some of these are followed tutorials or examples from others, mostly by *Daniel Shiffman* and [OpenProcessing.org](openprocessing.org).

## /Basics

Most are for test and experimental purposes:

| Name              | Description                                                  | Dependency | Note                                                         |
| ----------------- | ------------------------------------------------------------ | ---------- | ------------------------------------------------------------ |
| GettingStart      | some basic graphics in Processing                            |            |                                                              |
| DrawRoute         | draw lines using mouse                                       |            |                                                              |
| DataDisplay       | show point data                                              |            |                                                              |
| mesh_rectangle    | mesh grids (chess board)                                     |            |                                                              |
| plot_2d_gaussian  | 2d gaussian visualization                                    |            |                                                              |
| spiral            | spiral line (animation)                                      |            |                                                              |
| tree_recursive    | binary tree recursive                                        |            |                                                              |
| tree_recursive2   | random generate binary trees with different shape parameters |            |                                                              |
| image_noise       | using PImage to generate 2D noise image                      |            |                                                              |
| svg_test          | using Processing svg with a spinning bone                    |            |                                                              |
| star_field        | star field                                                   |            | [Improved version can be found here](https://github.com/automaticdai/processing-space-travelling) |
| cube_split        | split cubs                                                   |            |                                                              |
| RandomWalker      | random move                                                  |            | Example from The Nature of Code                              |
| 2DNoise           | 2-dimension noise, e.g. for generating cloud                 |            | Example from The Nature of Code                              |
| PerlinNoise       | Demonstrate Perlin noise                                     |            |                                                              |
| Walker_Vector     | Walker following the mouse                                   |            | Example from The Nature of Code                              |
| texture_vertex_2d | Apply transformation to a texture image                      |            |                                                              |

## /Arts

Work that is self-contained and is ready for presentation:

| Name                   | Description                                     | Dependency | Note                 |
| ---------------------- | ----------------------------------------------- | ---------- | -------------------- |
| chaostime              | chaos time                                      |            |                      |
| chaotic                | chaotic function (Lorenz)                       |            |                      |
| mind                   | tree of mind                                    |            |                      |
| mind2                  | tree of mind (v2)                               |            |                      |
| Particles              | firework using particles                        |            |                      |
| rainbowflow            | rainbow generated using Particles and sin waves |            |                      |
| mesh_network           | dynamic mesh network                            |            |                      |
| mesh_triangle_terrain  | mesh to generate terrain with Perlin noise      |            |                      |
| beats                  | music histogram                                 | Minim      |                      |
| beats2                 | music histogram (v2)                            | Minim      |                      |
| lotus_generative       | generate lotus using parametric lines           |            |                      |
| image_generative       | replicate a image using mask and particles      |            |                      |
| image_generative_ascii | replicate a image using ascii                   |            |                      |
| fireworks              | fireworks                                       |            | Tutorial from Daniel |
| Metaball_rolling       | Metaball rolling                                |            | Tutorial from Daniel |
| light_blob             | A Siri-like light blob effect.                  |            |                      |

## /Games

Games that are produced with Processing:

| Name  | Description    | Dependency | Note          |
| ----- | -------------- | ---------- | ------------- |
| SNAKE | The Snake Game |            | Not finished. |

## /Hardware

For interaction with hardware (e.g. Arduino and Raspberry Pi):

| Name             | Description                                | Dependency | Note |
|------------------|--------------------------------------------|------------|------------|
| SerialPort       | serialport communication                   |            |            |
| Ultrasonic       | send ultrasonic data to Processing through serialport   |||

## /Simulation

Involving physics and some magic:

| Name              | Description                          | Dependencies | Note                                                         |
| ----------------- | ------------------------------------ | ------------ | ------------------------------------------------------------ |
| robot_arm         | 2D robot manipulator                 |              |                                                              |
| robot_arm_inverse | Robot arm inverse kinematics         |              |                                                              |
| waterwave         | waterwave (sin wave propagate)       |              |                                                              |
| raindrop          | rain drop falling                    |              |                                                              |
| pendulum_sim      | pendulum simulation                  |              |                                                              |
| multi_robot       | Multi-robot simulator                |              |                                                              |
| Box2D             | Box2D test                           | Box2D        |                                                              |
| gnn               | Genetic Algorithm and Neural Network |              | [Improved version can be found here](https://github.com/automaticdai/ga-optimized-nn-processing) |
| BouncyBubbles     | Bouncy bubbles simulation            |              |                                                              |
| liquid_simu       | Liquid simulation                    |              |                                                              |

## /ComputerVision

Involving computer vision and image sensors:

| Name           | Description                    | Dependencies               | Note                      |
| -------------- | ------------------------------ | -------------------------- | ------------------------- |
| Camera         | capture from a web cam         |                            | Need a webcamera to run.  |
| hands3D        | tracking hand                  | OpenNI                     | Need a Kinect 1 to run.   |
| openni         | skeleton tracking              | OpenNI                     | Need a Kinect 1 to run.   |
| Myron_tracking | Blog tracking using JMyton     | JMyton                     |                           |
| leap_motion    | Example code to use LeapMotion | Leap Motion for Processing | Need a Leap Motion to run |

## /Specials

Special collections:

| Name  | Description              | Dependency | Note |
| ----- | ------------------------ | ---------- | ---- |
| heart | heart                    | Box2D      |      |
| elx   | a talkative and cute elf |            |      |

