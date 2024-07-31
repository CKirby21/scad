
// Constants
ANGLE=-33.4;

// Functions

function rotate_point(point, angle_degrees) = [
    point.x * cos(angle_degrees) + point.y * -sin(angle_degrees),
    point.x * sin(angle_degrees) + point.y * cos(angle_degrees) 
];

function my_rotate(p, a) = [
    p[0] + rotate_point(p[0]-p[0], a),
    p[0] + rotate_point(p[1]-p[0], a),
    p[0] + rotate_point(p[2]-p[0], a),
    p[0] + rotate_point(p[3]-p[0], a)
];

function my_translate(p, t) = [
    p[0]+t, 
    p[1]+t, 
    p[2]+t, 
    p[3]+t
];


p=[[0,0], [1.65,-5.51], [9.65,-5.51], [11.3,0]];

Circle(p, 11);

module Circle(p, blocks_to_make) {
    if (blocks_to_make > 0) {
        
        color("gray") polygon(p);

        topleft=p[0];
        topright=p[3];
        top=topright-topleft;
        echo("Top Magnitude", norm(top));
        r_top=rotate_point(top,ANGLE);
        t_top=topright+r_top;

        bottomleft=p[1];
        bottomright=p[2];
        bottom=bottomright-bottomleft;
        echo("Bottom Magnitude", norm(bottom));
        r_bottom=rotate_point(bottom,ANGLE);
        t_bottom=bottomright+r_bottom;

        left=bottomleft-topleft;
        right=bottomright-topright;
        echo("Left Magnitude", norm(left));
        echo("Right Magnitude", norm(right));

        t_p=[topright,bottomright,t_bottom,t_top];

        Circle(
            p=t_p,
            blocks_to_make=blocks_to_make-1
        );
    }
}


