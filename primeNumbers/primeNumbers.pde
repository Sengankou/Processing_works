import java.util.Arrays;

int n = 1001;
int mid = (n-1)/2;
//3×3を一ますとする
int block = 3;
int half = (block-1)/2;
int upper = int(sq(n/block+10));
int cnt;

size(1001, 1001);;
background(255);
noStroke();

  boolean[] isprime = new boolean[upper+1];
  //初期化
  Arrays.fill(isprime, true);
  //for(int i = 0; i < num; i++) isprime[i] = true; 
  for(int i = 2; i <= upper; i++){
    if(!isprime[i]) continue;
    for(int j = i*2; j <= upper; j += i){
      isprime[j] = false;
    }
  }
  //素数生成多項式
  boolean[] isPoly = new boolean[upper+1];
  Arrays.fill(isPoly, false);
  for(int i = 1; i < sqrt(upper); i++){
    isPoly[int(sq(i))-i+41] = true;
  }
  //素数生成多項式2
  boolean[] isPoly2 = new boolean[upper+1];
  Arrays.fill(isPoly2, false);
  for(int i = 1; i < sqrt(upper)/2; i++){
    isPoly2[int(sq(2*i))-2*i+41] = true;
  }

cnt = 1;

for(int i = 0; i < upper; i++){
  if(upper <= cnt) { save("images/primes.jpg"); noLoop(); println("描画やめ");}
  fill(0);
  if(isprime[cnt]) fill(100);
  if(isPoly[cnt]) fill(255, 69, 0);
  if(isPoly2[cnt]) fill(0, 255, 207);
  
  int s_can =int(sqrt(cnt));
  int s;
  if((s_can % 2) == 0){
    s = s_can - 1;
  }else{
    s = s_can;
  }
  
  int diff = cnt - int(sq(s));
  int dx = 0, dy = 0;
  /*冗長かと思ったけど、結局どの位置にあるか判定しないといけないので、必要な量かな？*/
  if(diff > 3*s+3){ dx += (diff - (3*s+3)); diff = 3*s+3;}
  if(diff > 2*s+2){ dy += (diff - (2*s+2)); diff = 2*s+2;}
  if(diff > s+1){ dx -= (diff - (s+1)); diff = s+1;}
  if(diff > 1){ dy -= (diff - 1); diff = 1;}
  if(diff > 0){ dx++;}
  //println(cnt+" "+s+" "+diff + "["+dx+","+dy+"]");
  int corner = int((s-1)/2);
  rect(mid-half+block*(corner+dx), mid-half+block*(corner+dy), block, block);
  cnt++;
}



//以下はvoid draw()使うバージョン
//import java.util.Arrays;

//int n = 1001;
//int mid = (n-1)/2;
////3×3を一ますとする
//int block = 3;
//int half = (block-1)/2;
//int upper = int(sq(n/block+10));
//boolean[] isprime = new boolean[upper];
//int cnt;

//void setup(){
//  size(1001, 1001);
//  frameRate(500000000);
//  //rectMode(CENTER); //centerの設定にするとなぜか、大きさがちょっと小さくなって、升目に見えちゃう
//  noStroke();
//  background(0);
//  isprime = eratosthenes(upper);
//  cnt = 1;
//}
//void draw(){
//  if(upper <= cnt) { save("data/primes.jpg"); noLoop(); println("描画やめ");}
//  fill(255);
//  if(isprime[cnt]) fill(255, 0, 0);
//  int s = finds(cnt);
//  int diff = cnt - int(sq(s));
//  int dx = 0, dy = 0;
//  /*冗長かと思ったけど、結局どの位置にあるか判定しないといけないので、必要な量かな？*/
//  if(diff > 3*s+3){ dx += (diff - (3*s+3)); diff = 3*s+3;}
//  if(diff > 2*s+2){ dy += (diff - (2*s+2)); diff = 2*s+2;}
//  if(diff > s+1){ dx -= (diff - (s+1)); diff = s+1;}
//  if(diff > 1){ dy -= (diff - 1); diff = 1;}
//  if(diff > 0){ dx++;}
//  //println(cnt+" "+s+" "+diff + "["+dx+","+dy+"]");
//  int corner = int((s-1)/2);
//  rect(mid-half+block*(corner+dx), mid-half+block*(corner+dy), block, block);
//  cnt++;
//}

//int finds(int num){
//  int s_can =int(sqrt(num));
//  int s;
//  if((s_can % 2) == 0){
//    s = s_can - 1;
//  }else{
//    s = s_can;
//  }
//  return s;
//};

//boolean[] eratosthenes(int num){
//  boolean[] isprime = new boolean[num+1];
//  //初期化
//  Arrays.fill(isprime, true);
//  //for(int i = 0; i < num; i++) isprime[i] = true; 
//  for(int i = 2; i <= num; i++){
//    if(!isprime[i]) continue;
//    for(int j = i*2; j <= num; j += i){
//      isprime[j] = false;
//    }
//  }
//  return isprime;
//}
