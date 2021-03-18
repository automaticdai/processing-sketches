
public class CSnake
{
	CPoint2D 	pos;
	int			direction;	
	int			bodyLen;		
	CPoint2D[]	body;		

	CSnake() {
		pos = new CPoint2D(0, 0);
		body = new CPoint2D[18 * 18];
		
        for (int i = 0; i < 18 * 18; i++) {
			body[i] = new CPoint2D(0,0);
		}
		
		bodyLen = 1;
		body[0].x = 0;
		body[0].y = 0;

	}

	void move(int theKey) {
		switch ( theKey ) {
			case UP:
				body[0].y -= 1;
				break;
			
			case DOWN:
				body[0].y += 1;
				break;
			
			case LEFT:
				body[0].x -= 1;
				break;
			
			case RIGHT:
				body[0].x += 1;
				break;
				
			default:
				;
		}

	}

	int getSize() {
		return bodyLen;
	}
	
	CPoint2D getBody(int index) {
		return body[index]; 
	}
}
