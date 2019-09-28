module m_seq
   (  
	   input clk,
		input rstn,
		output m   //输出m序列
	);

reg mseq=1'b0; assign m=mseq;

/***********************************伪码输出**************************************/
/***********************************时钟分频**************************************/
reg div_clk=0;  //生成2分频时钟,控制伪码输出,即伪码码元宽度为40ns
    
always @(posedge clk)
begin
  div_clk<=~div_clk;
end 

/********************************PS_BUF端口赋值控制*******************************/
//reg [62:0] prd_seq=63'b100000111111010101100110111011010010011100010111100101000110000;
reg [62:0] prd_seq=63'b111110110100010000101100101010010011110000011011100110001110101;
reg [5:0] k=6'd62;   //伪码输出指示器


always @(posedge clk, negedge rstn) 
//always @(posedge div_clk, negedge rstn)
begin
	if(!rstn) begin mseq=1'b0;k<=6'd62; end     
	else if(k>=6'd1&&k<=6'd62) begin mseq=prd_seq[k];k<=k-6'd1; end
	else begin mseq=prd_seq[k];k<=6'd62; end
end

endmodule 
