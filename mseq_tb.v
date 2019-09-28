
`timescale 1 ns/1 ps

module mseq_tb;      //测试平台不需要定义端口

    reg clk;
	 reg rstn;
	 wire m;
/********************实例化top模块********************/
m_seq i_m_seq
    (
      .clk(clk),
		.rstn(rstn),
      .m(m)
	  );
/******************产生时钟及复位信号******************/
  initial 
    begin
		    clk = 1'b0;
			 forever
		    #10 clk = ~clk;
	 end

	 
  initial	 
	 begin
			 rstn = 1'b0;
			 #1000 rstn = 1'b1;
	 end


endmodule

	 