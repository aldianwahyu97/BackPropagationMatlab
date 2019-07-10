clc;clear;close all;
 
%input1 = xlsread('D:\Aldian\Proyek\data\data_train','Sheet1');
input3 = xlsread('D:\Aldian\Proyek\data\data_uji','Sheet1');
target = xlsread('D:\Aldian\Proyek\data\data_uji','Sheet2');
input3 = transpose(input3);
target = transpose(target);
load 'D:\Aldian\Proyek\data\net.mat'
output = round(sim(net,input3));
[m,n] = find(output==target);
akurasi = (sum(m)/240)*100