
module pockstat_top
(
	input  logic        clk,
	input  logic        reset,

	input  logic        KeyRight,
	input  logic        KeyLeft,
	input  logic        KeyDown,
	input  logic        KeyUp,
	input  logic        KeyBtn,
	input  logic        KeyReset,

	input  logic [ 7:0] bios_dout,
	input  logic [ 7:0] cart_dout,
	input  logic [16:0] bios_size,
	input  logic [20:0] rom_size,
	output logic [20:0] rom_addr,
	output logic        rom_read,

	input  logic [13:0] sram_size,

	output logic [12:0] audio, // 8bit PCM with 12bit range

	input  logic        RTC_timestampNew,   // new current timestamp from system
	input  logic [31:0] RTC_timestampIn,    // timestamp in seconds, current time
	input  logic [31:0] RTC_timestampSaved, // timestamp in seconds, saved time
	input  logic [41:0] RTC_savedtimeIn,    // time structure, loaded
	input  logic        RTC_saveLoaded,     // must be 0 when loading new game, should go and stay 1 when RTC was loaded and values are valid
	output logic [31:0] RTC_timestampOut,   // timestamp to be saved
	output logic [41:0] RTC_savedtimeOut,   // time structure to be saved
	output logic        RTC_inuse,          // will indicate that RTC is in use and should be saved on next saving

	output logic        ce_pix,
	output logic        hsync,
	output logic        vsync,
	output logic        hblank,
	output logic        vblank
);



gba_cpu cpu 
#(
	.is_simu(0)
)
(
	.clk100(clk),
	.gb_on(),
	.reset(reset),

	.savestate_bus(),

	.gb_bus_Adr(),
	.gb_bus_rnw(),
	.gb_bus_ena(),
	.gb_bus_acc(),
	.gb_bus_dout(),
	.gb_bus_din(),
	.gb_bus_done(),

	.wait_cnt_value(),
	.wait_cnt_update(),

	.bus_lowbits(),

	.settle(),
	.dma_on(),
	.do_step(),
	.done(),
	.CPU_bus_idle(),
	.PC_in_BIOS(),
	.lastread(),
	.jump_out(),

	.new_cycles_out(),
	.new_cycles_valid(),

	.dma_new_cycles(),
	.dma_first_cycles(),
	.dma_dword_cycles(),
	.dma_toROM(),
	.dma_init_cycles(),
	.dma_cycles_adrup(),

	.IRP_in(),
	.cpu_IRP(),
	.new_halt(),

	.DISPSTAT_debug(),
	.debug_fifocount(),

	.timerdebug0(),
	.timerdebug1(),
	.timerdebug2(),
	.timerdebug3(),

	.cyclenr(),
	.cyclecount(),
	.cyclesum(),

	.debug_cpu_pc(),
	.debug_cpu_mixed()
);



endmodule
