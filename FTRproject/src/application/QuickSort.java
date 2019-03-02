package application;

import java.util.ArrayList;

public class QuickSort {
	private int length;
	private ArrayList<GridNode> list;

	public void sort(ArrayList<GridNode> list, int c, int cpow) {

		if (list == null || list.isEmpty()) {
			return;
		}
		this.list = list;
		length = list.size();
		quickSort(0, (length - 1), c, cpow);
	}

	private void quickSort(int lowerIndex, int higherIndex, int c, int cpow) {

		int i = lowerIndex;
		int j = higherIndex;
		int pivotNum = lowerIndex + (higherIndex - lowerIndex) / 2;
		int pivotNode;

		if (c == 1) {
			// find smaller f-value
			pivotNode = list.get(pivotNum).getF();
			while (i <= j) {
				while (list.get(i).getF() < pivotNode) {
					i++;
				}
				while (list.get(j).getF() > pivotNode) {
					j--;
				}
				if (i <= j) {
					exchangeNumbers(i, j);
					i++;
					j--;
				}
			}
		} else if (c == 2) {
			// find smaller g while f-value time a constant
			pivotNode = list.get(pivotNum).getF() * cpow + list.get(pivotNum).getG();
			while (i <= j) {
				while ((list.get(i).getF() * cpow + list.get(i).getG()) < pivotNode) {
					i++;
				}
				while ((list.get(j).getF() * cpow + list.get(j).getG()) > pivotNode) {
					j--;
				}
				if (i <= j) {
					exchangeNumbers(i, j);
					i++;
					j--;
				}
			}
		} else if (c == 3) {
			// find smaller h while f-value is in the same
			pivotNode = list.get(pivotNum).getH();
			while (i <= j) {
				while (list.get(i).getH() < pivotNode) {
					i++;
				}
				while (list.get(j).getH() > pivotNode) {
					j--;
				}
				if (i <= j) {
					exchangeNumbers(i, j);
					i++;
					j--;
				}
			}
		} else if (c == 4) {
			// find larger g while f-value time a constant
			pivotNode = list.get(pivotNum).getF() * cpow + list.get(pivotNum).getG();
			while (i <= j) {
				while ((list.get(i).getF() * cpow + list.get(i).getG()) < pivotNode) {
					i++;
				}
				while ((list.get(j).getF() * cpow + list.get(j).getG()) > pivotNode) {
					j--;
				}
				if (i <= j) {
					exchangeNumbers(i, j);
					i++;
					j--;
				}
			}
		}
		if (lowerIndex < j)
			quickSort(lowerIndex, j, c, cpow);
		if (i < higherIndex)
			quickSort(i, higherIndex, c, cpow);
	}

	private void exchangeNumbers(int i, int j) {
		GridNode temp = list.get(i);
		list.set(i, list.get(j));
		list.set(j, temp);
	}
}
