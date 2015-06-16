<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<?xml-stylesheet ekr_test ?>
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="2014fall.20141212095015.1784"><vh>@settings</vh>
<v t="2014fall.20141212095015.1785"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="2014fall.20141212095015.1786"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="2015.20150330144929.1714"><vh>以下為協同產品開發程式</vh></v>
<v t="2014fall.20141212095015.1774" a="E"><vh>@path ./</vh>
<v t="2014fall.20141212095015.1775" a="E"><vh>@clean wsgi.py</vh>
<v t="2014fall.20141212095015.1776"><vh>&lt;&lt;declarations&gt;&gt; (wsgi)</vh></v>
<v t="2014fall.20141212095015.1777" a="E"><vh>class Hello</vh>
<v t="2014fall.20141212095015.2004"><vh>__init__</vh></v>
<v t="2014fall.20141212095015.1778"><vh>index_orig</vh></v>
<v t="2014fall.20141212095015.1779"><vh>a_40223138</vh></v>
<v t=".20150519112521.1"><vh>index</vh></v>
</v>
</v>
<v t=".20150526101807.1"><vh>@edit man.py</vh></v>
<v t=".20150609102829.1"><vh>@edit man3.py</vh></v>
<v t=".20150526102341.1" a="E"><vh>@path static</vh>
<v t=".20150526102357.1"><vh>@edit axuploader.js</vh></v>
<v t=".20150526102414.1" a="E"><vh>@path weblink</vh>
<v t=".20150526102429.1"><vh>@edit pfcUtils.js</vh></v>
<v t=".20150526102445.1"><vh>@edit wl_header.js</vh></v>
</v>
<v t=".20150428191028.1819" a="E"><vh>@path Brython3.1.1-20150328-091302</vh>
<v t=".20150428191028.1820"><vh>@edit spur.py</vh></v>
</v>
<v t=".20150526102651.1" a="E"><vh>@path Brython3.1.3-20150514-095342</vh>
<v t=".20150526102704.1" a="E"><vh>@path Lib/site-packages/</vh>
<v t=".20150526102717.1"><vh>@edit spur.py</vh></v>
</v>
</v>
</v>
<v t="2014fall.20141212095015.1780"><vh>@edit setup.py</vh></v>
</v>
<v t=".20150428201639.1887"
expanded=".20150428201639.1889,"><vh>@file gear.py</vh></v>
<v t=".20150526103145.1" a="E"><vh>以下為參考檔案</vh>
<v t=".20150526103155.1"><vh>asciitbinary</vh></v>
</v>
<v t="2015.20150330144929.1715"><vh>以下為專案報告相關檔案</vh>
<v t="2015.20150330144929.1716"><vh>@edit SUMMARY.md</vh></v>
<v t="2015.20150330144929.1717"><vh>@edit README.md </vh></v>
<v t="2015.20150330144929.1720"><vh>@edit _建立分組協同報告.md</vh></v>
<v t="2015.20150330144929.1721"><vh>@edit _新產品開發流程.md</vh></v>
</v>
<v t="2015.20150330144929.1763" a="E"><vh>以下為參考資料</vh>
<v t="2015.20150330144929.1764"><vh>Brython 正齒輪程式</vh></v>
</v>
</vnodes>
<tnodes>
<t tx=".20150428191028.1819"></t>
<t tx=".20150519112521.1">@cherrypy.expose
def index(self, guess=None):
     outstring = '''
&lt;!DOCTYPE html&gt; 
&lt;html&gt;
&lt;head&gt;
&lt;meta http-equiv="content-type" content="text/html;charset=utf-8"&gt;
&lt;/head&gt;
        &lt;body&gt;
        40223138 黃道明&lt;br /&gt;
        &lt;a href="a_40223138"&gt;列印學號&lt;/a&gt;&lt;br /&gt;
        &lt;a href="man3"&gt;自動組立&lt;/a&gt;&lt;br /&gt;
        &lt;/body&gt;
        &lt;/html&gt;
 '''

     return outstring
#@+node:2014fall.20141215194146.1791: *3* index2
</t>
<t tx=".20150526102341.1"></t>
<t tx=".20150526102414.1"></t>
<t tx=".20150526102651.1"></t>
<t tx=".20150526102704.1"></t>
<t tx=".20150526103145.1"></t>
<t tx=".20150526103155.1">import struct
normals = []
points = []
triangles = []
triangle_number = 0
def load_binary_stl(fp):
    '''
    二位元 STL 檔案格式如下:
    檔案標頭共有 80 個字元(bytes), 內容通常省略, 但是內容不可使用 solid, 以免與文字檔案 STL 混淆
    UINT8[80] – Header
    UINT32 – Number of triangles (I:佔 4 bytes 的 unsigned integer)
      
    foreach triangle
    REAL32[3] – Normal vector (f:每一座標分量為一佔 4 bytes 的 float, 共佔 12 bytes)
    REAL32[3] – Vertex 1
    REAL32[3] – Vertex 2
    REAL32[3] – Vertex 3
    UINT16 – Attribute byte count (H:兩個 bytes 的 unsigned short, 表示 attribute byte count)
    end
      
    '''
    # 已經在外部開檔
    #fp=open(filename,'rb')
    header=fp.read(80)
    triangle_number = struct.unpack('I',fp.read(4))[0]
    #print(triangle_number)
    count=0
    while True:
        try:
            p=fp.read(12)
            if len(p)==12:
                n=[struct.unpack('f',p[0:4])[0],struct.unpack('f',p[4:8])[0],struct.unpack('f',p[8:12])[0]]
                normals.append(n)
                l = len(points)
                #print(n)
            p=fp.read(12)
            if len(p)==12:
                p1=[struct.unpack('f',p[0:4])[0],struct.unpack('f',p[4:8])[0],struct.unpack('f',p[8:12])[0]]
                points.append(p1)
                #print(p1)
            p=fp.read(12)
            if len(p)==12:
                p2=[struct.unpack('f',p[0:4])[0],struct.unpack('f',p[4:8])[0],struct.unpack('f',p[8:12])[0]]
                points.append(p2)
            p=fp.read(12)
            if len(p)==12:
                p3=[struct.unpack('f',p[0:4])[0],struct.unpack('f',p[4:8])[0],struct.unpack('f',p[8:12])[0]]
                points.append(p3)
                triangles.append((l, l+1, l+2))
            # 使用 count 來計算三角形平面個數
            # triangle_number 為 STL 檔案中的三角形個數
            count += 1
            #print(count)
            # 在前面 12*4 個 bytes 的 normal 與三個點資料後, 為
            # 一個 2 bytes 長的 unsigned short, 其值為零, 為 attribute
            fp.read(2)
            # 讀完所有三角平面後, 即跳出 while
            if count &gt; triangle_number:
                break
        except EOFError:
            break
    #fp.close()
def read_length(f):
    length = struct.unpack("@i", f.read(4))
    return length[0]
def read_header(f):
    f.seek(f.tell()+80)
def write_as_ascii(outfilename):
    f = open(outfilename, "w")
    f.write ("solid "+outfilename+"\n")
    for n  in range(len(triangles)):
        f.write ("facet normal {} {} {}\n".format(normals[n][0],normals[n][1],normals[n][2]))
        f.write ("outer loop\n")
        f.write ("vertex {} {} {}\n".format(points[triangles[n][0]][0],points[triangles[n][0]][1],points[triangles[n][0]][2]))
        f.write ("vertex {} {} {}\n".format(points[triangles[n][1]][0],points[triangles[n][1]][1],points[triangles[n][1]][2]))
        f.write ("vertex {} {} {}\n".format(points[triangles[n][2]][0],points[triangles[n][2]][1],points[triangles[n][2]][2]))
        f.write ("endloop\n")
        f.write ("endfacet\n")
    f.write ("endsolid "+outfilename+"\n")
    f.close()
def main():
    infilename = "spikeball_bin.stl"
    outfilename = "spikeball_ascii.stl"
    try:
        f = open(infilename, "rb")
        #read_header(f)
        #l = read_length(f)
        try:
            load_binary_stl(f)
            l = len(normals)
        except Exception as e:
            print("Exception",e)
        print(len(normals), len(points), len(triangles), l)
        write_as_ascii(outfilename)
        print("done")
    except Exception as e:
        print(e)
if __name__ == '__main__':
    main()</t>
<t tx="2014fall.20141212095015.1774"></t>
<t tx="2014fall.20141212095015.1775"># coding=utf-8
# 上面的程式內容編碼必須在程式的第一或者第二行才會有作用

################# (1) 模組導入區
# 導入 cherrypy 模組, 為了在 OpenShift 平台上使用 cherrypy 模組, 必須透過 setup.py 安裝


@language python
@tabwidth -4

&lt;&lt;declarations&gt;&gt;
@others
################# (4) 程式啟動區
# 配合程式檔案所在目錄設定靜態目錄或靜態檔案
application_conf = {'/static':{
        'tools.staticdir.on': True,
        # 程式執行目錄下, 必須自行建立 static 目錄
        'tools.staticdir.dir': _curdir+"/static"},
        '/downloads':{
        'tools.staticdir.on': True,
        'tools.staticdir.dir': data_dir+"/downloads"},
        '/images':{
        'tools.staticdir.on': True,
        'tools.staticdir.dir': data_dir+"/images"}
    }

root = Hello()
root.man = man.MAN()
root.man2 = man2.MAN()
root.man3 = man3.MAN()

if 'OPENSHIFT_REPO_DIR' in os.environ.keys():
    # 表示在 OpenSfhit 執行
    application = cherrypy.Application(root, config=application_conf)
else:
    # 表示在近端執行
    cherrypy.quickstart(root, config=application_conf)
</t>
<t tx="2014fall.20141212095015.1776">import cherrypy
# 導入 Python 內建的 os 模組, 因為 os 模組為 Python 內建, 所以無需透過 setup.py 安裝
import os
# 導入 random 模組
import random
import math
from cherrypy.lib.static import serve_file
# 導入 gear 模組
#import gear
import man
import man2
import man3

################# (2) 廣域變數設定區
# 確定程式檔案所在目錄, 在 Windows 下有最後的反斜線
_curdir = os.path.join(os.getcwd(), os.path.dirname(__file__))
# 設定在雲端與近端的資料儲存目錄
if 'OPENSHIFT_REPO_DIR' in os.environ.keys():
    # 表示程式在雲端執行
    download_root_dir = os.environ['OPENSHIFT_DATA_DIR']
    data_dir = os.environ['OPENSHIFT_DATA_DIR']
else:
    # 表示程式在近端執行
    download_root_dir = _curdir + "/local_data/"
    data_dir = _curdir + "/local_data/"

'''以下為近端 input() 與 for 迴圈應用的程式碼, 若要將程式送到 OpenShift 執行, 除了採用 CherryPy 網際框架外, 還要轉為 html 列印
# 利用 input() 取得的資料型別為字串
toprint = input("要印甚麼內容?")
# 若要將 input() 取得的字串轉為整數使用, 必須利用 int() 轉換
repeat_no = int(input("重複列印幾次?"))
for i in range(repeat_no):
    print(toprint)
'''

</t>
<t tx="2014fall.20141212095015.1777">################# (3) 程式類別定義區
# 以下改用 CherryPy 網際框架程式架構
# 以下為 Hello 類別的設計內容, 其中的 object 使用, 表示 Hello 類別繼承 object 的所有特性, 包括方法與屬性設計
class Hello(object):

    # Hello 類別的啟動設定
    _cp_config = {
    'tools.encode.encoding': 'utf-8',
    'tools.sessions.on' : True,
    'tools.sessions.storage_type' : 'file',
    #'tools.sessions.locking' : 'explicit',
    # session 以檔案儲存, 而且位於 data_dir 下的 tmp 目錄
    'tools.sessions.storage_path' : data_dir+'/tmp',
    # session 有效時間設為 60 分鐘
    'tools.sessions.timeout' : 60
    }

    #@+others
    #@+node:2014fall.20141212095015.2004: *3* __init__
    @others
</t>
<t tx="2014fall.20141212095015.1778"># 以 @ 開頭的 cherrypy.expose 為 decorator, 用來表示隨後的成員方法, 可以直接讓使用者以 URL 連結執行
@cherrypy.expose
# index 方法為 CherryPy 各類別成員方法中的內建(default)方法, 當使用者執行時未指定方法, 系統將會優先執行 index 方法
# 有 self 的方法為類別中的成員方法, Python 程式透過此一 self 在各成員方法間傳遞物件內容
def index_orig(self, toprint="Hello World!"):
    return toprint
#@+node:2014fall.20141212095015.1779: *3* hello
</t>
<t tx="2014fall.20141212095015.1779">@cherrypy.expose
def a_40223138(self, toprint="a_40223138"):
    return toprint
#@+node:.20150518203620.1: *3* index
</t>
<t tx="2014fall.20141212095015.1784"></t>
<t tx="2014fall.20141212095015.1785">QSplitter::handle {
    background-color: #CAE1FF; /* lightSteelBlue1 */
}

QStackedWidget {
    /* background-color:lightpink; */
    border-color: red;
    padding: 0px;
    /* border-width: 0px; */
    /* background-color: yellow; */
}

QSplitter {
    border-color: white;
    background-color: white;
    border-style: solid;
}

QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="2014fall.20141212095015.1786">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="2014fall.20141212095015.2004">def __init__(self):
    # 配合透過案例啟始建立所需的目錄
    if not os.path.isdir(data_dir+'/tmp'):
        os.mkdir(data_dir+'/tmp')
    if not os.path.isdir(data_dir+"/downloads"):
        os.mkdir(data_dir+"/downloads")
    if not os.path.isdir(data_dir+"/images"):
        os.mkdir(data_dir+"/images")
#@+node:2014fall.20141212095015.1778: *3* index_orig
</t>
<t tx="2015.20150330144929.1714"></t>
<t tx="2015.20150330144929.1715"></t>
<t tx="2015.20150330144929.1763"></t>
<t tx="2015.20150330144929.1764">@language python
from math import *

# 準備在 id="plotarea" 的 canvas 中繪圖
canvas = doc["plotarea"]
ctx = canvas.getContext("2d")

def create_line(x1, y1, x2, y2, width=3, fill="red"):
	ctx.beginPath()
	ctx.lineWidth = width
	ctx.moveTo(x1, y1)
	ctx.lineTo(x2, y2)
	ctx.strokeStyle = fill
	ctx.stroke()

# 導入數學函式後, 圓周率為 pi
# deg 為角度轉為徑度的轉換因子
deg = pi/180.
#
# 以下分別為正齒輪繪圖與主 tkinter 畫布繪圖
#
# 定義一個繪正齒輪的繪圖函式
# midx 為齒輪圓心 x 座標
# midy 為齒輪圓心 y 座標
# rp 為節圓半徑, n 為齒數
def gear(midx, midy, rp, n, 顏色):
    # 將角度轉換因子設為全域變數
    global deg
    # 齒輪漸開線分成 15 線段繪製
    imax = 15
    # 在輸入的畫布上繪製直線, 由圓心到節圓 y 軸頂點畫一直線
    create_line(midx, midy, midx, midy-rp)
    # 畫出 rp 圓, 畫圓函式尚未定義
    #create_oval(midx-rp, midy-rp, midx+rp, midy+rp, width=2)
    # a 為模數 (代表公制中齒的大小), 模數為節圓直徑(稱為節徑)除以齒數
    # 模數也就是齒冠大小
    a=2*rp/n
    # d 為齒根大小, 為模數的 1.157 或 1.25倍, 這裡採 1.25 倍
    d=2.5*rp/n
    # ra 為齒輪的外圍半徑
    ra=rp+a
    print("ra:", ra)
    # 畫出 ra 圓, 畫圓函式尚未定義
    #create_oval(midx-ra, midy-ra, midx+ra, midy+ra, width=1)
    # rb 則為齒輪的基圓半徑
    # 基圓為漸開線長齒之基準圓
    rb=rp*cos(20*deg)
    print("rp:", rp)
    print("rb:", rb)
    # 畫出 rb 圓 (基圓), 畫圓函式尚未定義
    #create_oval(midx-rb, midy-rb, midx+rb, midy+rb, width=1)
    # rd 為齒根圓半徑
    rd=rp-d
    # 當 rd 大於 rb 時
    print("rd:", rd)
    # 畫出 rd 圓 (齒根圓), 畫圓函式尚未定義
    #create_oval(midx-rd, midy-rd, midx+rd, midy+rd, width=1)
    # dr 則為基圓到齒頂圓半徑分成 imax 段後的每段半徑增量大小
    # 將圓弧分成 imax 段來繪製漸開線
    dr=(ra-rb)/imax
    # tan(20*deg)-20*deg 為漸開線函數
    sigma=pi/(2*n)+tan(20*deg)-20*deg
    for j in range(n):
        ang=-2.*j*pi/n+sigma
        ang2=2.*j*pi/n+sigma
        lxd=midx+rd*sin(ang2-2.*pi/n)
        lyd=midy-rd*cos(ang2-2.*pi/n)
        #for(i=0;i&lt;=imax;i++):
        for i in range(imax+1):
            r=rb+i*dr
            theta=sqrt((r*r)/(rb*rb)-1.)
            alpha=theta-atan(theta)
            xpt=r*sin(alpha-ang)
            ypt=r*cos(alpha-ang)
            xd=rd*sin(-ang)
            yd=rd*cos(-ang)
            # i=0 時, 繪線起點由齒根圓上的點, 作為起點
            if(i==0):
                last_x = midx+xd
                last_y = midy-yd
            # 由左側齒根圓作為起點, 除第一點 (xd,yd) 齒根圓上的起點外, 其餘的 (xpt,ypt)則為漸開線上的分段點
            create_line((midx+xpt),(midy-ypt),(last_x),(last_y),fill=顏色)
            # 最後一點, 則為齒頂圓
            if(i==imax):
                lfx=midx+xpt
                lfy=midy-ypt
            last_x = midx+xpt
            last_y = midy-ypt
        '''
        the line from last end of dedendum point to the recent
        end of dedendum point
        '''
        # lxd 為齒根圓上的左側 x 座標, lyd 則為 y 座標
        # 下列為齒根圓上用來近似圓弧的直線
        create_line((lxd),(lyd),(midx+xd),(midy-yd),fill=顏色)
        #for(i=0;i&lt;=imax;i++):
        for i in range(imax+1):
            r=rb+i*dr
            theta=sqrt((r*r)/(rb*rb)-1.)
            alpha=theta-atan(theta)
            xpt=r*sin(ang2-alpha)
            ypt=r*cos(ang2-alpha)
            xd=rd*sin(ang2)
            yd=rd*cos(ang2)
            # i=0 時, 繪線起點由齒根圓上的點, 作為起點
            if(i==0):
                last_x = midx+xd
                last_y = midy-yd
            # 由右側齒根圓作為起點, 除第一點 (xd,yd) 齒根圓上的起點外, 其餘的 (xpt,ypt)則為漸開線上的分段點
            create_line((midx+xpt),(midy-ypt),(last_x),(last_y),fill=顏色)
            # 最後一點, 則為齒頂圓
            if(i==imax):
                rfx=midx+xpt
                rfy=midy-ypt
            last_x = midx+xpt
            last_y = midy-ypt
        # lfx 為齒頂圓上的左側 x 座標, lfy 則為 y 座標
        # 下列為齒頂圓上用來近似圓弧的直線
        create_line(lfx,lfy,rfx,rfy,fill=顏色)

gear(400,400,300,41,"blue")

</t>
</tnodes>
</leo_file>
