clc;clear;close all;
 
%input1 = xlsread('D:\Aldian\Proyek\data\data_train','Sheet1');
input3 = xlsread('D:\Aldian\Proyek\data\data_train','Sheet1');
target = xlsread('D:\Aldian\Proyek\data\data_train','Sheet6');

input3 = transpose(input3);
target = transpose(target);

net = newff(input3,target,[10 5],{'logsig','logsig'},'trainlm');
net.performFcn = 'mse';
net.trainParam.goal = 0.01;
net.trainParam.show = 20;
net.trainParam.epochs = 1000;
net.trainParam.mc = 0.95;
net.trainParam.lr = 0.1;
%net = train(net,input3,target);

[net,tr,Y,E] = train(net,input3,target);
 
% Hasil setelah pelatihan
bobot_hidden = net.IW{1,1};
bobot_keluaran = net.LW{2,1};
bias_hidden = net.b{1,1};
bias_keluaran = net.b{2,1};
jumlah_iterasi = tr.num_epochs;
nilai_keluaran = Y;
nilai_error = E;
output = round(sim(net,input3));
output2 = transpose(output)

save 'D:\Aldian\Proyek\data\net.mat' net

[m,n] = find(output==target);
akurasi = (sum(m)/1200)*100