"""
Author: rdbende
License: MIT license
"""

import tkinter as tk
from tkinter import ttk


root = tk.Tk()
root.title("Beauty")

root.tk.call("source", "./theme.tcl")
root.tk.call("ttk::style", "theme", "use", "sun-valley")


big_frame = ttk.Frame(root)
big_frame.pack(fill="both", expand=True)


sun_valley_sun = tk.PhotoImage(file="./sun_valley_sun.png")
sun_valley_trees = tk.PhotoImage(file="./sun_valley_trees.png")
default = tk.PhotoImage(file="./default.png")
ribbon = tk.PhotoImage(file="./ribbon.png")


variable = tk.IntVar(value=0)

image_1 = ttk.Radiobutton(big_frame, value=0, variable=variable, image=sun_valley_trees)
image_1.grid(row=0, column=0)

image_2 = ttk.Radiobutton(big_frame, value=1, variable=variable, image=sun_valley_sun)
image_2.grid(row=0, column=1)

image_3 = ttk.Radiobutton(big_frame, value=2, variable=variable, image=default)
image_3.grid(row=1, column=0)

image_4 = ttk.Radiobutton(big_frame, value=3, variable=variable, image=ribbon)
image_4.grid(row=1, column=1)


root.mainloop()