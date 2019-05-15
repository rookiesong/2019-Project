import java.lang.*;
import java.util.*;
import java.io.*;
class Node{
    public double data;   //节点数据
    Node leftChild; //左子节点的引用
    Node rightChild; //右子节点的引用
}

class BinaryTree {
    Node root;

    public BinaryTree() {
        this.root = null;
    }

    public static Node BuildTree(Node node, double S, double u, double d, int N) {
        node = new Node();
        node.data = S;
        //根据步数建立期权二叉树
        if (N > 0) {
            node.leftChild = BuildTree(node.leftChild, S * u, u, d, N - 1);
            node.rightChild = BuildTree(node.rightChild, S * d, u, d, N - 1);
        }
        return node;
    }
}

class findallpaths{

    //每条路径叶子结点向量
    public ArrayList<Double>Endcolumn= new ArrayList<>();
    //每条路径期权向量
    public  ArrayList<Double>Vcolumn=new ArrayList<>();

    public void allpaths(Node root) {

        //储存遍历的路径
        ArrayList<Double> arrayListSingle = new ArrayList<>();
        //先存入根节点
        arrayListSingle.add(root.data);
        traverse(root,arrayListSingle);
    }

    //前序递归遍历
    public void traverse(Node node,ArrayList<Double>arr){
        //遍历左节点
        if(node.leftChild != null) {
            //在遍历的路径中添加马上开始遍历的左节点,开始遍历左节点
            arr.add(node.leftChild.data);
            traverse(node.leftChild,arr);
            //遍历完左节点,从遍历的路径中删除左节点
            arr.remove(arr.size() - 1);
        }
        //遍历右节点
        if(node.rightChild != null){
            //在遍历的路径中添加马上开始遍历的右节点,开始遍历右节点
            arr.add(node.rightChild.data);
            traverse(node.rightChild,arr);
            arr.remove(arr.size() - 1);
        }
        //当左右节点都空时,说明这个节点是叶子节点
        if(node.leftChild == null && node.rightChild == null) {
            Endcolumn.add(arr.get(arr.size()-1));
            Vcolumn.add(Collections.max(arr)-arr.get(arr.size()-1));
        }
    }
}

class TreeApp {

    public static void main(String[] args) {
        //输入参数为现价S0，连续利率R，连续标准差sigma，总步数N，时间跨度t
        double S0 = 1, R = 0.05, sigma = 0.2, t = 0.0833;
        int N;
        //定义输出字符串向量
        ArrayList<String>plotdata=new ArrayList<>();
        for(N=2;N<=20;N++){
            //二叉树参数
            double TimeA=System.currentTimeMillis();
            double sigmaN = Math.sqrt((sigma * sigma * t) / N);
            double rN = Math.pow((1 + R), (t / N)) - 1;
            double u = Math.exp(sigmaN);
            double d = 1 / u;
            double p = (1 + rN - d) / (u - d);

            //建立期权二叉树
            BinaryTree tree = new BinaryTree();
            tree.root = BinaryTree.BuildTree(tree.root, S0, u, d, N);
            //获得每条路径的期权向量Vcolumn和叶子结点向量Endcolumn
            findallpaths find=new findallpaths();
            find.allpaths(tree.root);
            //计算期权价格
            //初始化期权期望价格为V0
            double V=0;
            for (int i=0;i<find.Vcolumn.size();i++){
                /*M为下跌的次数，因此N-M为上涨的次数
                  计算方式为S0*u^(N-M)*d^M=Endcolumn[i]
                  两边取对数，化简计算式为(Nlnu-lnEndcolumn[i]+lnS0)/lnu-lnd;
                * */
                int M=(int)Math.round((N*Math.log(u)-Math.log(find.Endcolumn.get(i))+Math.log(S0))/(Math.log(u)-Math.log(d)));
                //每条路径期权为Vcolumn[I]=p^(N-M)+(1-P)^M
                V+=find.Vcolumn.get(i)*Math.pow(p,(N-M))*Math.pow((1-p),M);
            }
            //期权价格V0,利用期望求解法，V0=E[V]/(1+rN)^N
            double V0=V/Math.pow((1+rN),N);
            double TimeB=System.currentTimeMillis();
            double Time=(TimeB-TimeA)/1000;
            //输出结果
            System.out.println("N="+N+"时，期权价格为："+V0+",运算时间为："+Time+"s。");
            //将结果添加到输出序列
            plotdata.add(N+"  "+V0+"  "+Time);

        }
        //考虑到java绘图并不美观，将计算数据输出到文本"plotdata.txt"中，使用matlab绘图
        FileWriter fileWriter = null;
        try {
            fileWriter = new FileWriter("D:/Documents/GitHub/First/Financial-stochastic-analysis/binplotdata.txt");//创建文本文件
            int i=0;
            while(i<19){//循环写入
                fileWriter.write(plotdata.get(i)+"\r\n");//写入 \r\n换行
                i++;
            }
            fileWriter.flush();
            fileWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

