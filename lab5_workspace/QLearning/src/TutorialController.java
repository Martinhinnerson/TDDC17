public class TutorialController extends Controller {

    public SpringObject object;

    ComposedSpringObject cso;

    /* These are the agents senses (inputs) */
	DoubleFeature x; /* Positions */
	DoubleFeature y;
	DoubleFeature vx; /* Velocities */
	DoubleFeature vy;
	DoubleFeature angle; /* Angle */

    /* Example:
     * x.getValue() returns the vertical position of the rocket 
     */

	/* These are the agents actuators (outputs)*/
	RocketEngine leftRocket;
	RocketEngine middleRocket;
	RocketEngine rightRocket;

    /* Example:
     * leftRocket.setBursting(true) turns on the left rocket 
     */
	
	public void init() {
		cso = (ComposedSpringObject) object;
		x = (DoubleFeature) cso.getObjectById("x");
		y = (DoubleFeature) cso.getObjectById("y");
		vx = (DoubleFeature) cso.getObjectById("vx");
		vy = (DoubleFeature) cso.getObjectById("vy");
		angle = (DoubleFeature) cso.getObjectById("angle");

		leftRocket = (RocketEngine) cso.getObjectById("rocket_engine_left");
		rightRocket = (RocketEngine) cso.getObjectById("rocket_engine_right");
		middleRocket = (RocketEngine) cso.getObjectById("rocket_engine_middle");
	}

    public void tick(int currentTime) {

    	/* TODO: Insert your code here */
    	System.out.print("Position X = ");
    	System.out.print(x.getValue());
    	System.out.print(" Position Y = ");
    	System.out.print(y.getValue());
    	System.out.print(" Velocity X = ");
    	System.out.print(vx.getValue());
    	System.out.print(" Velocity Y = ");
    	System.out.print(vy.getValue());
    	System.out.print(" Angle = ");
    	System.out.println(angle.getValue());    
    	
    	if(y.getValue() > 100){
    		middleRocket.setBursting(true);
    	} else
    	{
    		middleRocket.setBursting(false);
    	}
    }

}
