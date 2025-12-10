/**
* Name: Tp1
* Based on the internal empty template.
* Author: Mame_Khalifa
* Tags:
*/

model Tp1

/* Insert your model definition here */

global {
    /** Insert the global definitions, variables and actions here */
    int nb_tree <- 100 parameter: 'Number of tree' category: 'tree' min: 20 max: 200;
    int nb_pompier <- 10 parameter: 'Number of pompiers' category: 'pompier' min: 1 max: 100;
    int size_of_tree <- rnd(10) parameter: 'size of tree' category: 'Tree';
    int number_in_burnet <- 2 + rnd(20);
    float speed_of_pompier <- 5.0 parameter: 'Speed of pompier' category: 'pompier';
    int width_and_height_of_environment <- 100;
    
    init {
        create tree number: nb_tree {
        }
        
        create pompier number: nb_pompier {
            speed <- rnd(speed_of_pompier - 1) + 1;
            color <- rgb('blue');
            size <- 2.0;
            location <- {rnd(width_and_height_of_environment - 2 * size), rnd(width_and_height_of_environment - 2 * size)};
        }
        
        ask number_in_burnet among list(tree) {
            state <- 'burning';
        }
    }
}

species pompier skills: [moving] {
    rgb color <- rgb('blue');
    float size <- 3.0;
    
    reflex patrolling {
        do wander amplitude: 180;
    }
    
    aspect basic {
        draw triangle(size) color: color;
    }
}

species tree skills: [] control: fsm {
    rgb color <- rgb([0, rnd(55) + 200, 0]);
    int size <- rnd(9) + 1;
    int threshold <- rnd(100);
    int deuil_duration <- 500;
    int duration <- 0;
    int range <- 100;
    
    state intact initial: true {
        transition to: burning when: flip(0.01);
    }
    
    state burning {
        duration <- duration + 1;
        color <- rgb([255, rnd(255), 0]);
        transition to: destroyed when: (threshold < duration);
    }
    
    state destroyed {
        size <- 3;
        color <- rgb('black');
    }
    
    aspect basic {
        draw circle(size) color: color;
    }
}

experiment moniteur type: gui {
    /** Insert here the definition of the input and output of the model */
    output {
        display Forest {
            species tree aspect: basic;
            species pompier aspect: basic;
        }
        
        inspect name: 'Agent' type: agent;
        
        display tree_distribution {
            chart "td_diagram" type: pie {
                data "under_4m" value: length(list(tree) where (each.size < 4)) color: rgb('red');
                data "under_7m" value: length(list(tree) where ((each.size < 7) and (each.size > 4))) color: rgb('yellow');
                data "over_7m" value: length(list(tree) where (each.size >= 7)) color: rgb('green');
            }
        }
    }
}