# lab3

`Yiyang Wang`

## for exercise 1 :
* ex1.m    EllipsePoints.mat
![ex1](ex1.png)


## for exercise 2:
* ex2.m
   renderim.m
   sincos_basis.mat
`run: wait each figure stop moving`

* Q&A </br>
Question:What is the effect of changing b ? </br>
If we change the value of b, it will effect the speed of moving images.To be precisely, the larger b will result the faster moving speed.
If we change the sign, the direction of moving images will change as well. 


## for exercise 3 :
* ex3.m
    immotion_basis.mat
    Kakashi.jpg

* Q&A</br>
Question:What happens if you pick larger Y values (e.g. 5:10)? Why? What type of image does this procedure work best for?</br>
The larger Y values will trigger a faster image moving speed.
According to Talyor Expansion, I(u+du,v+dv) = I(u,v) + [Ix(u,v) Iy(u,v)][du dv]' + hot, the smaller the du and dv are, the less effect they will cause. 
du and dv can be larger because of a larger Y, and the larger Y make the image perform worse.
The peocedure works best for images have clear edges because images having clear edges will have better gradient.


## for exercise 5 :
* ex5_light.m
* ex5_light_verify.m    this is for question5 part 6
* ex5_obj.m
* function: `renderim.m
light_pca.mat
obj_pca.mat`

* Q&A</br>
Question:Compare this to piecewise linear interpolation.</br>
Does the interpolation correctly recover the Y? (ie how close is Y_new(:,t) to the dropped Y(:,t)?) </br>
Render the image at t and compare with the original. How close do they look?</br>

Compare to polynomial method, linear methosd works better.
Yes. Y_new(:,t) is very similar(close) to the dropped Y(:,t).
The image at t and the orignal image are quite same. So my method correctly approximates the images.   
