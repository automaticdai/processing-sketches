
public class CGui
{
	int guiWidth;            		// 屏幕宽度
	int guiHeight;            		// 屏幕高度
    int dashboardWidth = 200;		// 记分板宽度 
	int gridSize;			        // 网格大小
    int gridAxisNum;				// 网格在单轴上的个数
	int margin = 30;				// 留边宽度


	CGui(int x, int y, int size) {
		guiWidth = x;
		guiHeight = y;
		gridSize = size;
		gridAxisNum = (guiHeight - margin * 2) / gridSize;
	}

	void showDashboard() {
		;
	}

	void showGrid() {
		translate(margin, margin);

		for (int i = 0; i < gridAxisNum + 1; i++ ) {
			line(gridSize * i, 0, gridSize * i, guiHeight - (margin * 2));
		}
		
		for (int i = 0; i < gridAxisNum + 1; i++ ) {
			line(0, gridSize * i, guiWidth - (margin * 2) - dashboardWidth, gridSize * i);
		}
	}

	void showSnake(CSnake theSnake) {
        fill(0, 50);
		
		for ( int i = 0; i < theSnake.getSize(); i++ ) {
			rect(theSnake.getBody(i).x * gridSize, theSnake.getBody(i).y * gridSize, gridSize, gridSize);
		}
	}
	
	int getKeyPressed() {
		if ( keyPressed ) {
			if ( key == CODED ) {
				return keyCode;
			}
		}
		
		return 0;
	}

}
