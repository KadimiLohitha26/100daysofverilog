module halfadder_tb();
reg a,b;
wire sum,carry;
halfadder uut(.a(a),.b(b),.sum(sum),.carry(carry));	//inside testbench inputs
initial begin
$monitor("at time %0t: a=%0b, b=%0b,sum=%0b,carry=%0b",$time,a,b,sum,carry);
a=0;b=0;
#10;
a=0;b=1;
#10;
a=1;b=0;
#10;
a=1;b=1;
#10;
$finish;
end
endmodule
