library verilog;
use verilog.vl_types.all;
entity RTL_BD is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        conversor_adc   : in     vl_logic_vector(7 downto 0);
        BD_DATA_1       : out    vl_logic_vector(7 downto 0);
        BD_DATA_0       : out    vl_logic_vector(7 downto 0)
    );
end RTL_BD;
