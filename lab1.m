clc
clear all
close all

img= [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; 
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
      1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 ;
      2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 ;
      2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 ;
      3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 ;
      4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 ;
      4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 ;
      4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 ;
      4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 ;
      4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 ;
      4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 ;
      5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 ;
      5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 ];
  
  
  %Create unique symbols from 0 to 5
  
  symbols = (0:5);
  
  %Calculate probabilities of six gray levels
  % 0, 1, 2, 3, 4 and 5
  
  p_0 = 100/400;
  p_1 = 72/400;
  p_2 = 41/400;
  p_3 = 27/400;   
  p_4 = 103/400;   
  p_5 = 57/400;
  
  % Create a vector with the probabilities obtained below
  
  p = [p_0 p_1 p_2 p_3 p_4 p_5 ];
  
  %note: p_0 + p_1 + p_2 + p_3 + p_4 +p_5 = 1
  sum(p);
  
   
  %Create a Huffman dictionary based on the symbols and their probabilities
  
  dictionary = huffmandict(symbols,p);
  
  
  % Reshape the original image matrix to a vector 1x400
  
  image_v = reshape(img,[1,400]);
  
  
  %Encode the symbols
  
  encode_image = huffmanenco(image_v,dictionary);
  
  
  %Decode the symbols. Verify that the decoded data matches the original
  %data
  
  decode_image= huffmandeco(encode_image,dictionary);
  
  Flag = isequal(image_v,decode_image); % Flag is equal to 1 if both signals are equal.
  
  
  %Convert the vector (image_v) to binary, and determine its length
  
  image_to_binary = de2bi(image_v);  
  
  length_image_v = numel(image_to_binary);
  
  
  %Convert the huffman encoded signal to binary, and determine its length
  
  Huffman_signal_to_binary = de2bi(encode_image);
  
  length_image_huffman = numel(Huffman_signal_to_binary);
 
  
  %Savings percentage using Huffman 
  
  perc = (length_image_huffman/length_image_v)*100;
  
  
  %How many data required the original signal?____ bits
  %How many data required the Huffman encoded data? ____ bits
  %How much percentage(%) Huffman encoded is saving over the uncoded data?
  %_____ (%)
  
  fprintf('Original signal required %i bits\n', length_image_v)

  fprintf('Huffman encoded required %i bits\n', length_image_huffman)
  
  fprintf('Huffman encoded is saving %f percent over the uncoded signal\n', perc)
  