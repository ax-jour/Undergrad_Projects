package application;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.Scanner;

public class board {

	private static int length = 0;
	private static String s = " ";
	private static ForwardAStar fa = new ForwardAStar();
	private static BackwardAStar ba = new BackwardAStar();
	private static AdaptiveAStar aa = new AdaptiveAStar();
	private static testPath test = new testPath();
	private static GridNode[][] map;

	public static GridNode[][] initial() {
		map = new GridNode[length][length];
//		long beforeUsedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();

		for (int i = 0; i < length; i++) {
			for (int j = 0; j < length; j++) {
				GridNode n = new GridNode(i, j, "_");
				if (Math.random() <= 0.3) {
					n.setStatus("X");
				}
				map[i][j] = n;
			}
		}
//		long afterUsedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
//		long actualMemUsed = afterUsedMem - beforeUsedMem;
//		pl("Memory used !!!!!!!: " + actualMemUsed + "");

		ATposition("A").setStatus("A");
		ATposition("T").setStatus("T");
		if (test.ForwardMethod(map) == 0) {
			pl("Unreachable map. Recreating!");
			initial();
		}
		return map;
	}

	public static GridNode ATposition(String AT) {
		Random r = new Random();
		if (AT.equals("A")) {
			int col = r.nextInt(3);
			int row = r.nextInt(3);
			if (!map[col][row].getStatus().equals("X")) {
				return map[col][row];
			} else {
				return ATposition(AT);
			}
		} else if (AT.equals("T")) {
			int col = length - r.nextInt(3) - 1;
			int row = length - r.nextInt(3) - 1;
			if (!map[col][row].getStatus().equals("X")) {
				return map[col][row];
			} else {
				return ATposition(AT);
			}
		}
		return null;
	}

	public static void printMap(GridNode[][] gridBoard) {
		for (int k = 0; k < length; k++) {
			p(k + " ");
//			p("- ");
		}
		pl("");
		for (int i = 0; i < length; i++) {
			for (int j = 0; j < length; j++) {
				if (gridBoard[i][j].getStatus().equals("A")) {
					System.out.printf("A ");
				} else if (gridBoard[i][j].getStatus().equals("T")) {
					System.out.printf("T ");
				} else if (gridBoard[i][j].getStatus().equals("X")) {
					System.out.printf("X ");
				} else if (gridBoard[i][j].getStatus().equals("_")) {
					System.out.printf("_ ");
				}
			}
			p(i + "");
			pl("");
		}
		for (int k = 0; k < length; k++) {
			p("--");
		}
	}

	public static void printAIMap(GridNode[][] gridBoard, GridNode A, GridNode T) {
		for (int k = 0; k < length; k++) {
			p("--");
		}
		pl("");
		for (int i = 0; i < length; i++) {
			for (int j = 0; j < length; j++) {

				if (gridBoard[i][j].getnID() == A.getnID()) {
					System.out.printf("A ");
				} else if (gridBoard[i][j].getnID() == T.getnID()) {
					System.out.printf("T ");
				} else if (gridBoard[i][j].isBlocked()) {
					System.out.printf("X ");
				} else if (gridBoard[i][j].getStatus().equals("*")) {
					System.out.printf("* ");
//					p(gridBoard[i][j].getParent().getnID()+" ");
				} else if (!gridBoard[i][j].isBlocked()) {
					System.out.printf("_ ");
//					p(gridBoard[i][j].getH()+" ");
				}

//				p("ID: " + gridBoard[i][j].getnID() + "	");
//				p("h" + gridBoard[i][j].getH() + "	");
//				p("g" + gridBoard[i][j].getG() + "	|");

			}
			pl("");
		}
		for (int k = 0; k < length; k++) {
			p("--");
		}
		pl("");
	}

	public static void FileOut(GridNode[][] gridBoard, String k, int subNum, int length) throws IOException {
		try {
			s = "src/TestCases/Test" + k + "-" + subNum + "-" + length + ".txt";
			PrintWriter fileWriter = new PrintWriter(s, "UTF-8");
			for (int i = 0; i < length; i++) {
				for (int j = 0; j < length; j++) {
					fileWriter.write(gridBoard[i][j].getStatus() + " ");
				}
				fileWriter.write("\n");
			}
			fileWriter.close();
			pl("File: " + s + " has been created!");
		} catch (IOException ex) {
			pl("IOException");
		}
	}

	public static GridNode[][] fileIn(String address) throws IOException {
		GridNode[][] testCase = new GridNode[length][length];
		try {
			Scanner fr = new Scanner(new File(address));
			for (int i = 0; i < length; i++) {
				for (int j = 0; j < length; j++) {
					String status = fr.next();
					testCase[i][j] = new GridNode(i, j, status);
				}
			}
			fr.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return testCase;
	}

	public static void oneMapGeneralRuntime() {
//		long fstime = System.nanoTime();
//		if (fa.ForwardMethod(map, 4) == 1) {
//			pl("Forward A* Searching success!");
//		} else {
//			pl("Searching Fail!");
//		}
//		long fetime = System.nanoTime();
//		long bstime = System.nanoTime();
		if (ba.BackwardMethod(map, 4) == 1) {
			pl("Backward A* Searching success!");
		} else {
			pl("Searching Fail!");
		}
//		long betime = System.nanoTime();
//		long aastime = System.nanoTime();
//		if (aa.AdaptiveMethod(map, 4) == 1) {
//			pl("Adaptive Forward A* Searching success!");
//		} else {
//			pl("Searching Fail!");
//		}
//		long aaetime = System.nanoTime();
//		long fnstime = (fetime - fstime);
//		long bnstime = (betime - bstime);
//		long anstime = (aaetime - aastime);
//		double fsecond = Math.pow(10, -9) * fnstime;
//		double bsecond = Math.pow(10, -9) * bnstime;
//		double asecond = Math.pow(10, -9) * anstime;
//		pl(" ");
//		pl("Forward time:	" + fnstime + " ns\n" + "Backward time:	" + bnstime + " ns\n" + "Adaptive time:	" + anstime
//				+ " ns");
//		pl(" ");
//		pl("Forward  second:	" + fsecond + " s\n" + "Backward second:	" + bsecond + " s\n"
//				+ "Adaptive second:	" + asecond + " s");
	}

	public static void main(String[] args) throws IOException {
		Scanner order = new Scanner(System.in);
		p("What do you want today?\n" 
				+ "1. Comparing Runtime of one map under 3 types of A* searching.\n"
				+ "2. Comparing Runtime from different two types from mulitple maps.\n"
				+ "3. Generating new map sets.\n" 
				+ "4. Testing option\n");
		int yn = order.nextInt();
		if (yn == 1) {
			Scanner sn = new Scanner(System.in);
			p("Please enter file's name: ");
			String name = sn.next();
			p("Please enter file's Sub-name: ");
			int subName = sn.nextInt();
			p("Please enter length: ");
			length = sn.nextInt();
			s = "src/TestCases/Test" + name + "-" + subName + "-" + length + ".txt";
			map = fileIn(s);
				long beforeUsedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
				oneMapGeneralRuntime();
				long afterUsedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
				long actualMemUsed = afterUsedMem - beforeUsedMem;
				pl("Memory used: " + actualMemUsed + "");
			sn.close();
		} else if (yn == 2) {
			Scanner sn2 = new Scanner(System.in);
			pl("Please select two searching methods you want to compare: \n" 
					+ "1. Forward vs. Backward Searching\n"
					+ "2. Backward vs. Adaptive Searching\n" 
					+ "3. Forward vs. Adaptive Searching\n");
			int select = sn2.nextInt();
			p("Please enter file's name: ");
			String name = sn2.next();
			p("Please enter map's length: ");
			length = sn2.nextInt();
			p("How many maps do you want to test? ");
			int numofmap = sn2.nextInt();
			p("How many tests for one map? ");
			int num = sn2.nextInt();
			p("What kind of value you want to depend when visited neighours? \n" 
					+ "1. Smaller F-value\n"
					+ "2. Smaller g while f-value remain the same\n" 
					+ "3. Smaller h while f-value remain the same\n"
					+ "4. Larger g while f-value multiply a large enough constant\n");
			int value = sn2.nextInt();
			long startnano1, endnano1, diff1, ave1;
			long accum1 = 0;
			long accum2 = 0;
			long startnano2, endnano2, diff2, ave2;
			double second1, second2, diffsecond;
			long difference;
//			long beforeUsedMem;
//			long afterUsedMem;
//			long actualMemUsed;
//			long a=0;
			if (select == 1) {
				for (int i = 0; i < numofmap; i++) {
					s = "src/TestCases/Test" + name + "-" + (i + 1) + "-" + length + ".txt";
					for (int j = 1; j <= num; j++) {
						pl(s);
						map = fileIn(s);
						startnano1 = System.nanoTime();
//						beforeUsedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
						fa.ForwardMethod(map, value);
//						afterUsedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
//						actualMemUsed = afterUsedMem - beforeUsedMem;
//						a = a + actualMemUsed;
						endnano1 = System.nanoTime();
						diff1 = endnano1 - startnano1;
						accum1 = accum1 + diff1;
						startnano2 = System.nanoTime();
						ba.BackwardMethod(map, value);
						endnano2 = System.nanoTime();
						diff2 = endnano2 - startnano2;
						accum2 = accum2 + diff2;
					}
				}
//				pl("aveage:"+a/(num * numofmap)+" byte");
				ave1 = accum1 / (num * numofmap);
				ave2 = accum2 / (num * numofmap);
				second1 = Math.pow(10, -9) * ave1;
				second2 = Math.pow(10, -9) * ave2;
				difference = ave2 - ave1;
				diffsecond = Math.pow(10, -9) * difference;
				pl("Aveage Forward A* Searching runtime: \n" + ave1 + " ns\n" + second1 + " s\n");
				pl("Aveage Backward A* Searching runtime: \n" + ave2 + " ns\n" + second2 + " s\n");
				pl("Two method difference(Rear - Front): \n" + difference + " ns\n" + diffsecond + " s\n");

			} else if (select == 2) {
				for (int i = 0; i < numofmap; i++) {
					s = "src/TestCases/Test" + name + "-" + (i + 1) + "-" + length + ".txt";
					for (int j = 1; j <= num; j++) {
						pl(s);
						map = fileIn(s);
						startnano1 = System.nanoTime();
						ba.BackwardMethod(map, value);
						endnano1 = System.nanoTime();
						diff1 = endnano1 - startnano1;
						accum1 = accum1 + diff1;
						startnano2 = System.nanoTime();
						aa.AdaptiveMethod(map, value);
						endnano2 = System.nanoTime();
						diff2 = endnano2 - startnano2;
						accum2 = accum2 + diff2;
					}
				}
				ave1 = accum1 / (num * numofmap);
				ave2 = accum2 / (num * numofmap);
				second1 = Math.pow(10, -9) * ave1;
				second2 = Math.pow(10, -9) * ave2;
				difference = ave2 - ave1;
				diffsecond = Math.pow(10, -9) * difference;
				pl("Aveage Backward A* Searching runtime: \n" + ave1 + " ns\n" + second1 + " s\n");
				pl("Aveage Adaptive Forward A* Searching runtime: \n" + ave2 + " ns\n" + second2 + " s\n");
				pl("Two method difference(Rear - Front): \n" + difference + " ns\n" + diffsecond + " s\n");
			} else if (select == 3) {
				for (int i = 0; i < numofmap; i++) {
					s = "src/TestCases/Test" + name + "-" + (i + 1) + "-" + length + ".txt";
//					map = fileIn(s);
					for (int j = 1; j <= num; j++) {
						map = fileIn(s);
						pl(s);
						startnano1 = System.nanoTime();
						fa.ForwardMethod(map, value);
						endnano1 = System.nanoTime();
						diff1 = endnano1 - startnano1;
						accum1 = accum1 + diff1;
						startnano2 = System.nanoTime();
						aa.AdaptiveMethod(map, value);
						endnano2 = System.nanoTime();
						diff2 = endnano2 - startnano2;
						accum2 = accum2 + diff2;
					}
				}
				ave1 = accum1 / (num * numofmap);
				ave2 = accum2 / (num * numofmap);
				second1 = Math.pow(10, -9) * ave1;
				second2 = Math.pow(10, -9) * ave2;
				difference = ave2 - ave1;
				diffsecond = Math.pow(10, -9) * difference;
				pl("Aveage Forward A* Searching runtime: \n" + ave1 + " ns\n" + second1 + " s\n");
				pl("Aveage Adaptive Forward A* Searching runtime: \n" + ave2 + " ns\n" + second2 + " s\n");
				pl("Two method difference(Rear - Front): \n" + difference + " ns\n" + diffsecond + " s\n");
			} else {
				pl("Wrong input. Please right number.");
				sn2.close();
				return;
			}
			sn2.close();
		} else if (yn == 3) {
			Scanner sc = new Scanner(System.in);
			p("Please enter file name: ");
			String name = sc.next();
			p("Please enter map length: ");
			length = sc.nextInt();
			p("How many maps do you want to create? ");
			int num = sc.nextInt();
			for (int i = 1; i <= num; i++) {
				map = initial();
				FileOut(map, name, i, length);
			}
			sc.close();
		} else if (yn == 4) {

		} else {
			pl("Wrong input. Please right number.");
			order.close();
			return;
		}
		order.close();
	}

	public static void p(String msg) {
		System.out.print(msg);
	}

	public static void pl(String msg) {
		System.out.println(msg);
	}

}
