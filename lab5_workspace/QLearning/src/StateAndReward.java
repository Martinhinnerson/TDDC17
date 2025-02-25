public class StateAndReward {

	
	private static int angleStates = 15;
	private static double minAngle = -Math.PI/6;
	private static double maxAngle = Math.PI/6;
	
	private static int velocityStatesX = 5; 
	private static int velocityStatesY = 10;
	
	//velocities has to be less than the value that makes the reward function used cross the x-axis.
	private static double minVelocityX = -0.5;
	private static double maxVelocityX = 0.5;
	private static double minVelocityY = -0.5;
	private static double maxVelocityY = 0.5;
	
	private static double scaleFactor = 1; //Factor to scale the reward function
	
	/* State discretization function for the angle controller */
	public static String getStateAngle(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */

		String state = "angleState: " + discretize(angle, angleStates, minAngle, maxAngle);
		
		return state;
	}

	/* Reward function for the angle controller */
	public static double getRewardAngle(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */

		double reward  = 0; //initial reward is 0, (if outside of max/min angle.
		
		if(angle >= minAngle && angle <= maxAngle) {
			//reward = 1 - Math.pow(Math.abs(angle), 2); //Exponentially worse with bigger angels
			//reward = 1 - Math.abs(angle); //linearly worse with bigger angles
			reward = 1 - scaleFactor*Math.sqrt(Math.abs(angle)); //EXPERIMENTAL
		}
		
		return reward;
	}

	/* State discretization function for the full hover controller */
	public static String getStateHover(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */

		String vxState = " vxState: " + discretize(vx, velocityStatesX, minVelocityX, maxVelocityX);
		String vyState = " vyState: " + discretize(vy, velocityStatesY, minVelocityY, maxVelocityY);
		
		String state = getStateAngle(angle,vx,vy) + vxState + vyState;
		
		return state;
	}

	/* Reward function for the full hover controller */
	public static double getRewardHover(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */
		
		double reward = getRewardAngle(angle,vx,vy);

		if(vx <= maxVelocityX && vx >= minVelocityX) {
			//reward += 1 - Math.pow(Math.abs(vx), 2);
			//reward += 1 - Math.abs(vx);
			reward += 1 - scaleFactor*Math.sqrt(Math.abs(vx));
		}
		if(vy <= maxVelocityY && vy >= minVelocityY) { // Velocity Y seems much more important than X since angle helps X velocity.
			//reward += 1 - Math.pow(Math.abs(vy), 2);
			//reward += 1 - Math.abs(vy);
			reward += 1 - scaleFactor*Math.sqrt(Math.abs(vy));
		}
		
		return reward;
	}

	// ///////////////////////////////////////////////////////////
	// discretize() performs a uniform discretization of the
	// value parameter.
	// It returns an integer between 0 and nrValues-1.
	// The min and max parameters are used to specify the interval
	// for the discretization.
	// If the value is lower than min, 0 is returned
	// If the value is higher than min, nrValues-1 is returned
	// otherwise a value between 1 and nrValues-2 is returned.
	//
	// Use discretize2() if you want a discretization method that does
	// not handle values lower than min and higher than max.
	// ///////////////////////////////////////////////////////////
	public static int discretize(double value, int nrValues, double min,
			double max) {
		if (nrValues < 2) {
			return 0;
		}

		double diff = max - min;

		if (value < min) {
			return 0;
		}
		if (value > max) {
			return nrValues - 1;
		}

		double tempValue = value - min;
		double ratio = tempValue / diff;

		return (int) (ratio * (nrValues - 2)) + 1;
	}

	// ///////////////////////////////////////////////////////////
	// discretize2() performs a uniform discretization of the
	// value parameter.
	// It returns an integer between 0 and nrValues-1.
	// The min and max parameters are used to specify the interval
	// for the discretization.
	// If the value is lower than min, 0 is returned
	// If the value is higher than min, nrValues-1 is returned
	// otherwise a value between 0 and nrValues-1 is returned.
	// ///////////////////////////////////////////////////////////
	public static int discretize2(double value, int nrValues, double min,
			double max) {
		double diff = max - min;

		if (value < min) {
			return 0;
		}
		if (value > max) {
			return nrValues - 1;
		}

		double tempValue = value - min;
		double ratio = tempValue / diff;

		return (int) (ratio * nrValues);
	}

}
