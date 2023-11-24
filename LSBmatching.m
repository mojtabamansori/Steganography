function I = LSBmatching(image,alpha)
    Image    = double(image);
    S        = size(Image);
    location = rand(S(1),S(2));
    location(location<=alpha)=1;
    location(location~=1)=0;
    lsb_Image= mod(Image,2);
    message  = randi([0 1],S(1),S(2));
    message(location==0)=lsb_Image(location==0);
    D_I      = 2*(randi([0 1],S(1),S(2))-.5);
    Image(lsb_Image~=message)=Image(lsb_Image~=message)+D_I(lsb_Image~=message);
    I = Image;