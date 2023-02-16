function [watermarked] = dwt_cdma_embed_section(image_object, message_image, key_image, k)
thresh = 0.5; %used for testing of different thresholds
% determine size of watermarked image
[Mw Nw]=size(image_object);
% read in the message image
message = message_image;
[Mm Nm] = size(message);
message_vector=round(reshape(message,Mm*Nm,1)./256);
% read in key for PN generator
%key = imread(key_image);
key=double(imread(key_image))./256;
% reset MATLAB's PN generator to state "key"
rand('state',key);
[LL,HL,LH,HH] = dwt2(image_object,'haar');
%[LL,HL,LH,HH] = dwt2(cover_object, 'db1');
% add pn sequences to HL and LH componants when message = 0
for kk=1:length(message_vector)
pn_sequence_h=round(2*(rand(Mw/2,Mw/2)-thresh));
pn_sequence_v=round(2*(rand(Mw/2,Mw/2)-thresh));
if (message(kk) == 0)
HL=HL+k*pn_sequence_h;
LH=LH+k*pn_sequence_v;
end
end
% perform IDWT
watermarked_image = idwt2(LL,HL,LH,HH,'haar',[Mw,Nw]);
% convert back to uint8
watermarked_image_uint8=uint8(watermarked_image);
watermarked = watermarked_image_uint8;
return
end