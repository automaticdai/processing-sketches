# Processing Sketches
This repository contains a collection of my Processing sketches, consolidated to avoid managing multiple repositories. *Processing* is a programming environment designed for interactive art. Some sketches require dependencies to run, and a few need hardware, such as a webcam or Kinect. Detailed notes are included for clarity on these requirements.

*Credits*: Some of these are followed tutorials or examples from others, mostly by [Daniel Shiffman](https://github.com/shiffman) and from [OpenProcessing.org](openprocessing.org).

## Basics

Most are for test and experimental purposes:

| Name              | Description                                                  | Dependency | Note                                                         |
| ----------------- | ------------------------------------------------------------ | ---------- | ------------------------------------------------------------ |
| GettingStart      | some basic graphics in Processing                            |            |                                                              |
| DrawRoute         | draw lines using a mouse                                     |            |                                                              |
| DataDisplay       | show point data                                              |            |                                                              |
| mesh_rectangle    | mesh grids (chess board)                                     |            |                                                              |
| plot_2d_gaussian  | 2D gaussian visualization                                    |            |                                                              |
| spiral            | spiral line (animation)                                      |            |                                                              |
| tree_recursive    | binary tree recursive                                        |            |                                                              |
| tree_recursive2   | random generate binary trees with different shape parameters |            |                                                              |
| image_noise       | using PImage to generate an image composed of 2D noise       |            |                                                              |
| svg_test          | using Processing SVG with a spinning bone                    |            |                                                              |
| star_field        | star field                                                   |            | [An improved version can be found here](https://github.com/automaticdai/processing-space-travelling) |
| cube_split        | split cubs                                                   |            |                                                              |
| RandomWalker      | random move                                                  |            | Example from The Nature of Code                              |
| Noise2D           | 2-dimension noise, e.g. for generating realistic cloud       |            | Example from The Nature of Code                              |
| PerlinNoise       | demonstrate Perlin noise                                     |            |                                                              |
| Walker_Vector     | a walker trying to follow the mouse                          |            | Example from The Nature of Code                              |
| texture_vertex_2d | apply transformation to a texture image                      |            |                                                              |

## Arts

Work that is self-contained and is ready for presentation:

| Name                   | Description                                     | Dependency | Note                                                         |
| ---------------------- | ----------------------------------------------- | ---------- | ------------------------------------------------------------ |
| chaostime              | chaos time                                      |            |                                                              |
| chaotic                | chaotic function (Lorenz)                       |            |                                                              |
| mind                   | tree of mind                                    |            |                                                              |
| mind2                  | tree of mind (v2)                               |            |                                                              |
| Particles              | firework using particles                        |            |                                                              |
| rainbowflow            | rainbow generated using Particles and sin waves |            |                                                              |
| mesh_network           | dynamic mesh network                            |            |                                                              |
| mesh_triangle_terrain  | mesh to generate terrain with Perlin noise      |            |                                                              |
| beats                  | music histogram                                 | Minim      |                                                              |
| beats2                 | music histogram (v2)                            | Minim      |                                                              |
| lotus_generative       | generate lotus using parametric lines           |            |                                                              |
| image_generative       | replicate a image using mask and particles      |            |                                                              |
| image_generative_ascii | replicate a image using ascii                   |            |                                                              |
| fireworks              | fireworks                                       |            | Tutorial from Daniel Shiffman, [Coding Challenge #27: Fireworks!](https://www.youtube.com/watch?v=CKeyIbT3vXI&ab_channel=TheCodingTrain) |
| Metaball_rolling       | Metaball rolling                                |            | Tutorial from Daniel Shiffman, [Coding Challenge #28: Metaballs](https://www.youtube.com/watch?v=ccYLb7cLB1I&ab_channel=TheCodingTrain) |
| light_blob             | A Siri-like light blob effect.                  |            |                                                              |

## Games

Games that are produced with Processing:

| Name  | Description    | Dependency | Note          |
| ----- | -------------- | ---------- | ------------- |
| SNAKE | The Snake Game |            | Not finished. |


## Simulation

Involving physics and some magic:

| Name              | Description                          | Dependency | Note                                                         |
| ----------------- | ------------------------------------ | ---------- | ------------------------------------------------------------ |
| robot_arm         | 2D robot manipulator                 |            |                                                              |
| robot_arm_inverse | Robot arm inverse kinematics         |            |                                                              |
| waterwave         | waterwave (sin wave propagate)       |            |                                                              |
| raindrop          | rain drop falling                    |            |                                                              |
| pendulum_sim      | pendulum simulation                  |            |                                                              |
| multi_robot       | Multi-robot simulator                |            |                                                              |
| Box2D             | Box2D test                           | Box2D      |                                                              |
| gnn               | Genetic Algorithm and Neural Network |            | [An improved version can be found here](https://github.com/automaticdai/ga-optimized-nn-processing) |
| BouncyBubbles     | Bouncy bubbles simulation            |            |                                                              |
| liquid_simu       | Liquid simulation                    |            |                                                              |

## ComputerVision

Involving computer vision and image sensors:

| Name           | Description                    | Dependency                   | Note                                 |
| -------------- | ------------------------------ | ---------------------------- | ------------------------------------ |
| Camera         | capture from a web cam         | Video Library for Processing | Require a web camera to run.         |
| hands3D        | tracking hand                  | OpenNI                       | Require a Microsoft Kinect 1 to run. |
| openni         | skeleton tracking              | OpenNI                       | Require a Microsoft Kinect 1 to run. |
| Myron_tracking | Blob tracking using JMyton     | JMyton                       |                                      |
| leap_motion    | Example code to use LeapMotion | Leap Motion for Processing   | Require a Leap Motion to run         |

## Hardware

For interaction with hardware (e.g. Arduino and Raspberry Pi):

| Name             | Description                                | Dependency | Note |
|------------------|--------------------------------------------|------------|------------|
| SerialPort       | serialport communication                   |            |            |
| Ultrasonic       | send ultrasonic data to Processing through serialport   |||

## Specials

Special collections:

| Name  | Description              | Dependency | Note |
| ----- | ------------------------ | ---------- | ---- |
| heart | heart                    | Box2D      |      |
| elx   | a talkative and cute elf |            |      |

