/* Generated by Yosys 0.5+ (git sha1 ba4cce9, gcc 4.8.4-2ubuntu1~14.04 -O2 -fstack-protector -fPIC -Os) */

`include "modules/n_m.v"
`include "modules/m_n.v"
`include "modules/serial_n.v"
`include "modules/n_serial.v"

(* src = "communication.v:2" *)
module communication(buffer_o, card_o, finnished_blocks_trans, buffer_i, card_i, clk, trans_enable, ack_o_buff, ack_o_card, mode, direction);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  (* src = "communication.v:52" *)
  wire _196_;
  (* src = "communication.v:53" *)
  wire _197_;
  (* src = "communication.v:70" *)
  wire _198_;
  (* src = "communication.v:71" *)
  wire _199_;
  (* src = "communication.v:42" *)
  wire _200_;
  (* src = "communication.v:46" *)
  wire _201_;
  (* src = "communication.v:29" *)
  output ack_o_buff;
  (* src = "communication.v:30" *)
  output ack_o_card;
  (* src = "communication.v:67" *)
  wire [31:0] buff_o_m;
  (* src = "communication.v:66" *)
  wire [31:0] buff_o_s;
  (* src = "communication.v:32" *)
  input [31:0] buffer_i;
  (* src = "communication.v:26" *)
  output [31:0] buffer_o;
  (* src = "communication.v:33" *)
  input [3:0] card_i;
  (* src = "communication.v:27" *)
  output [3:0] card_o;
  (* src = "communication.v:49" *)
  wire [3:0] card_o_m;
  (* src = "communication.v:50" *)
  wire card_o_s;
  (* src = "communication.v:31" *)
  wire [3:0] card_o_s_i;
  (* src = "communication.v:34" *)
  input clk;
  (* src = "communication.v:74" *)
  wire complete_m_buff;
  (* src = "communication.v:55" *)
  wire complete_m_card;
  (* src = "communication.v:73" *)
  wire complete_s_buff;
  (* src = "communication.v:56" *)
  wire complete_s_card;
  (* src = "communication.v:34" *)
  input direction;
  (* src = "communication.v:28" *)
  output finnished_blocks_trans;
  (* src = "communication.v:34" *)
  input mode;
  (* src = "communication.v:34" *)
  input trans_enable;
  (* src = "communication.v:70" *)
  wire trans_enable_buff_m;
  (* src = "communication.v:71" *)
  wire trans_enable_buff_s;
  (* src = "communication.v:52" *)
  wire trans_enable_c_m;
  (* src = "communication.v:53" *)
  wire trans_enable_c_s;
  NOT _202_ (
    .A(_000_),
    .Y(_019_)
  );
  NOT _203_ (
    .A(_084_),
    .Y(_021_)
  );
  NOR _204_ (
    .A(_021_),
    .B(_019_),
    .Y(_119_)
  );
  NOT _205_ (
    .A(_130_),
    .Y(_024_)
  );
  NOR _206_ (
    .A(_024_),
    .B(_021_),
    .Y(_141_)
  );
  NOT _207_ (
    .A(_152_),
    .Y(_027_)
  );
  NOR _208_ (
    .A(_027_),
    .B(_021_),
    .Y(_163_)
  );
  NOR _209_ (
    .A(_174_),
    .B(_084_),
    .Y(_028_)
  );
  NOR _210_ (
    .A(_185_),
    .B(_021_),
    .Y(_029_)
  );
  NOR _211_ (
    .A(_029_),
    .B(_028_),
    .Y(_001_)
  );
  NOR _212_ (
    .A(_008_),
    .B(_084_),
    .Y(_031_)
  );
  NOR _213_ (
    .A(_017_),
    .B(_021_),
    .Y(_032_)
  );
  NOR _214_ (
    .A(_032_),
    .B(_031_),
    .Y(_030_)
  );
  NOR _215_ (
    .A(_038_),
    .B(_084_),
    .Y(_033_)
  );
  NOR _216_ (
    .A(_046_),
    .B(_021_),
    .Y(_034_)
  );
  NOR _217_ (
    .A(_034_),
    .B(_033_),
    .Y(_053_)
  );
  NOR _218_ (
    .A(_061_),
    .B(_084_),
    .Y(_035_)
  );
  NOR _219_ (
    .A(_069_),
    .B(_021_),
    .Y(_036_)
  );
  NOR _220_ (
    .A(_036_),
    .B(_035_),
    .Y(_076_)
  );
  NOR _221_ (
    .A(_085_),
    .B(_084_),
    .Y(_037_)
  );
  NOR _222_ (
    .A(_093_),
    .B(_021_),
    .Y(_039_)
  );
  NOR _223_ (
    .A(_039_),
    .B(_037_),
    .Y(_100_)
  );
  NOR _224_ (
    .A(_106_),
    .B(_084_),
    .Y(_040_)
  );
  NOR _225_ (
    .A(_113_),
    .B(_021_),
    .Y(_041_)
  );
  NOR _226_ (
    .A(_041_),
    .B(_040_),
    .Y(_114_)
  );
  NOR _227_ (
    .A(_115_),
    .B(_084_),
    .Y(_042_)
  );
  NOR _228_ (
    .A(_116_),
    .B(_021_),
    .Y(_043_)
  );
  NOR _229_ (
    .A(_043_),
    .B(_042_),
    .Y(_117_)
  );
  NOR _230_ (
    .A(_118_),
    .B(_084_),
    .Y(_044_)
  );
  NOR _231_ (
    .A(_120_),
    .B(_021_),
    .Y(_045_)
  );
  NOR _232_ (
    .A(_045_),
    .B(_044_),
    .Y(_121_)
  );
  NOR _233_ (
    .A(_122_),
    .B(_084_),
    .Y(_047_)
  );
  NOR _234_ (
    .A(_123_),
    .B(_021_),
    .Y(_048_)
  );
  NOR _235_ (
    .A(_048_),
    .B(_047_),
    .Y(_124_)
  );
  NOR _236_ (
    .A(_125_),
    .B(_084_),
    .Y(_049_)
  );
  NOR _237_ (
    .A(_126_),
    .B(_021_),
    .Y(_050_)
  );
  NOR _238_ (
    .A(_050_),
    .B(_049_),
    .Y(_127_)
  );
  NOR _239_ (
    .A(_128_),
    .B(_084_),
    .Y(_051_)
  );
  NOR _240_ (
    .A(_129_),
    .B(_021_),
    .Y(_052_)
  );
  NOR _241_ (
    .A(_052_),
    .B(_051_),
    .Y(_131_)
  );
  NOR _242_ (
    .A(_132_),
    .B(_084_),
    .Y(_054_)
  );
  NOR _243_ (
    .A(_133_),
    .B(_021_),
    .Y(_055_)
  );
  NOR _244_ (
    .A(_055_),
    .B(_054_),
    .Y(_134_)
  );
  NOR _245_ (
    .A(_135_),
    .B(_084_),
    .Y(_056_)
  );
  NOR _246_ (
    .A(_136_),
    .B(_021_),
    .Y(_057_)
  );
  NOR _247_ (
    .A(_057_),
    .B(_056_),
    .Y(_137_)
  );
  NOR _248_ (
    .A(_138_),
    .B(_084_),
    .Y(_058_)
  );
  NOR _249_ (
    .A(_139_),
    .B(_021_),
    .Y(_059_)
  );
  NOR _250_ (
    .A(_059_),
    .B(_058_),
    .Y(_140_)
  );
  NOR _251_ (
    .A(_142_),
    .B(_084_),
    .Y(_060_)
  );
  NOR _252_ (
    .A(_143_),
    .B(_021_),
    .Y(_062_)
  );
  NOR _253_ (
    .A(_062_),
    .B(_060_),
    .Y(_144_)
  );
  NOR _254_ (
    .A(_145_),
    .B(_084_),
    .Y(_063_)
  );
  NOR _255_ (
    .A(_146_),
    .B(_021_),
    .Y(_064_)
  );
  NOR _256_ (
    .A(_064_),
    .B(_063_),
    .Y(_147_)
  );
  NOR _257_ (
    .A(_148_),
    .B(_084_),
    .Y(_065_)
  );
  NOR _258_ (
    .A(_149_),
    .B(_021_),
    .Y(_066_)
  );
  NOR _259_ (
    .A(_066_),
    .B(_065_),
    .Y(_150_)
  );
  NOR _260_ (
    .A(_151_),
    .B(_084_),
    .Y(_067_)
  );
  NOR _261_ (
    .A(_153_),
    .B(_021_),
    .Y(_068_)
  );
  NOR _262_ (
    .A(_068_),
    .B(_067_),
    .Y(_154_)
  );
  NOR _263_ (
    .A(_155_),
    .B(_084_),
    .Y(_070_)
  );
  NOR _264_ (
    .A(_156_),
    .B(_021_),
    .Y(_071_)
  );
  NOR _265_ (
    .A(_071_),
    .B(_070_),
    .Y(_157_)
  );
  NOR _266_ (
    .A(_158_),
    .B(_084_),
    .Y(_072_)
  );
  NOR _267_ (
    .A(_159_),
    .B(_021_),
    .Y(_073_)
  );
  NOR _268_ (
    .A(_073_),
    .B(_072_),
    .Y(_160_)
  );
  NOR _269_ (
    .A(_161_),
    .B(_084_),
    .Y(_074_)
  );
  NOR _270_ (
    .A(_162_),
    .B(_021_),
    .Y(_075_)
  );
  NOR _271_ (
    .A(_075_),
    .B(_074_),
    .Y(_164_)
  );
  NOR _272_ (
    .A(_165_),
    .B(_084_),
    .Y(_077_)
  );
  NOR _273_ (
    .A(_166_),
    .B(_021_),
    .Y(_078_)
  );
  NOR _274_ (
    .A(_078_),
    .B(_077_),
    .Y(_167_)
  );
  NOR _275_ (
    .A(_168_),
    .B(_084_),
    .Y(_079_)
  );
  NOR _276_ (
    .A(_169_),
    .B(_021_),
    .Y(_080_)
  );
  NOR _277_ (
    .A(_080_),
    .B(_079_),
    .Y(_170_)
  );
  NOR _278_ (
    .A(_171_),
    .B(_084_),
    .Y(_081_)
  );
  NOR _279_ (
    .A(_172_),
    .B(_021_),
    .Y(_082_)
  );
  NOR _280_ (
    .A(_082_),
    .B(_081_),
    .Y(_173_)
  );
  NOR _281_ (
    .A(_175_),
    .B(_084_),
    .Y(_083_)
  );
  NOR _282_ (
    .A(_176_),
    .B(_021_),
    .Y(_086_)
  );
  NOR _283_ (
    .A(_086_),
    .B(_083_),
    .Y(_177_)
  );
  NOR _284_ (
    .A(_178_),
    .B(_084_),
    .Y(_087_)
  );
  NOR _285_ (
    .A(_179_),
    .B(_021_),
    .Y(_088_)
  );
  NOR _286_ (
    .A(_088_),
    .B(_087_),
    .Y(_180_)
  );
  NOR _287_ (
    .A(_181_),
    .B(_084_),
    .Y(_089_)
  );
  NOR _288_ (
    .A(_182_),
    .B(_021_),
    .Y(_090_)
  );
  NOR _289_ (
    .A(_090_),
    .B(_089_),
    .Y(_183_)
  );
  NOR _290_ (
    .A(_184_),
    .B(_084_),
    .Y(_091_)
  );
  NOR _291_ (
    .A(_186_),
    .B(_021_),
    .Y(_092_)
  );
  NOR _292_ (
    .A(_092_),
    .B(_091_),
    .Y(_187_)
  );
  NOR _293_ (
    .A(_188_),
    .B(_084_),
    .Y(_094_)
  );
  NOR _294_ (
    .A(_189_),
    .B(_021_),
    .Y(_095_)
  );
  NOR _295_ (
    .A(_095_),
    .B(_094_),
    .Y(_190_)
  );
  NOR _296_ (
    .A(_191_),
    .B(_084_),
    .Y(_096_)
  );
  NOR _297_ (
    .A(_192_),
    .B(_021_),
    .Y(_097_)
  );
  NOR _298_ (
    .A(_097_),
    .B(_096_),
    .Y(_193_)
  );
  NOR _299_ (
    .A(_194_),
    .B(_084_),
    .Y(_098_)
  );
  NOR _300_ (
    .A(_195_),
    .B(_021_),
    .Y(_099_)
  );
  NOR _301_ (
    .A(_099_),
    .B(_098_),
    .Y(_002_)
  );
  NAND _302_ (
    .A(_004_),
    .B(_084_),
    .Y(_101_)
  );
  NOR _303_ (
    .A(_101_),
    .B(_007_),
    .Y(_005_)
  );
  NAND _304_ (
    .A(_004_),
    .B(_021_),
    .Y(_102_)
  );
  NOR _305_ (
    .A(_102_),
    .B(_007_),
    .Y(_006_)
  );
  NOT _306_ (
    .A(_007_),
    .Y(_103_)
  );
  NOR _307_ (
    .A(_101_),
    .B(_103_),
    .Y(_009_)
  );
  NOR _308_ (
    .A(_102_),
    .B(_103_),
    .Y(_010_)
  );
  NOR _309_ (
    .A(_011_),
    .B(_084_),
    .Y(_104_)
  );
  NOR _310_ (
    .A(_012_),
    .B(_021_),
    .Y(_105_)
  );
  NOR _311_ (
    .A(_105_),
    .B(_104_),
    .Y(_013_)
  );
  NOR _312_ (
    .A(_014_),
    .B(_084_),
    .Y(_107_)
  );
  NOR _313_ (
    .A(_015_),
    .B(_021_),
    .Y(_108_)
  );
  NOR _314_ (
    .A(_108_),
    .B(_107_),
    .Y(_016_)
  );
  NOR _315_ (
    .A(_018_),
    .B(_084_),
    .Y(_109_)
  );
  NOR _316_ (
    .A(_020_),
    .B(_021_),
    .Y(_110_)
  );
  NOR _317_ (
    .A(_110_),
    .B(_109_),
    .Y(_022_)
  );
  NOR _318_ (
    .A(_023_),
    .B(_084_),
    .Y(_111_)
  );
  NOR _319_ (
    .A(_025_),
    .B(_021_),
    .Y(_112_)
  );
  NOR _320_ (
    .A(_112_),
    .B(_111_),
    .Y(_026_)
  );
  (* src = "communication.v:74" *)
  m_n buff_m (
    buff_o_m,
    card_i,
    clk,
    trans_enable_buff_m,
    1'b0,
    complete_m_buff
  );
  (* src = "communication.v:73" *)
  serial_n buff_s (
    buff_o_s,
    card_i[3],
    clk,
    trans_enable_buff_s,
    1'b0,
    complete_s_buff
  );
  (* src = "communication.v:55" *)
  n_m card_m (
    trans_enable_c_m,
    buffer_i,
    card_o_m,
    complete_m_card,
    1'b0,
    clk,
    trans_enable_c_m
  );
  (* src = "communication.v:56" *)
  n_serial card_s (
    trans_enable_c_s,
    buffer_i,
    card_o_s_i[3],
    complete_s_card,
    1'b0,
    clk,
    trans_enable_c_s
  );
  assign card_o_s = card_o_s_i[3];
  assign card_o_s_i[2:0] = 3'b000;
  assign _003_ = 1'b0;
  assign _000_ = card_o_m[2];
  assign _084_ = mode;
  assign card_o[2] = _119_;
  assign _130_ = card_o_m[1];
  assign card_o[1] = _141_;
  assign _152_ = card_o_m[0];
  assign card_o[0] = _163_;
  assign _174_ = buff_o_s[30];
  assign _185_ = buff_o_m[30];
  assign buffer_o[30] = _001_;
  assign _008_ = buff_o_s[29];
  assign _017_ = buff_o_m[29];
  assign buffer_o[29] = _030_;
  assign _038_ = buff_o_s[28];
  assign _046_ = buff_o_m[28];
  assign buffer_o[28] = _053_;
  assign _061_ = buff_o_s[27];
  assign _069_ = buff_o_m[27];
  assign buffer_o[27] = _076_;
  assign _085_ = buff_o_s[26];
  assign _093_ = buff_o_m[26];
  assign buffer_o[26] = _100_;
  assign _106_ = buff_o_s[25];
  assign _113_ = buff_o_m[25];
  assign buffer_o[25] = _114_;
  assign _115_ = buff_o_s[24];
  assign _116_ = buff_o_m[24];
  assign buffer_o[24] = _117_;
  assign _118_ = buff_o_s[23];
  assign _120_ = buff_o_m[23];
  assign buffer_o[23] = _121_;
  assign _122_ = buff_o_s[22];
  assign _123_ = buff_o_m[22];
  assign buffer_o[22] = _124_;
  assign _125_ = buff_o_s[21];
  assign _126_ = buff_o_m[21];
  assign buffer_o[21] = _127_;
  assign _128_ = buff_o_s[20];
  assign _129_ = buff_o_m[20];
  assign buffer_o[20] = _131_;
  assign _132_ = buff_o_s[19];
  assign _133_ = buff_o_m[19];
  assign buffer_o[19] = _134_;
  assign _135_ = buff_o_s[18];
  assign _136_ = buff_o_m[18];
  assign buffer_o[18] = _137_;
  assign _138_ = buff_o_s[17];
  assign _139_ = buff_o_m[17];
  assign buffer_o[17] = _140_;
  assign _142_ = buff_o_s[16];
  assign _143_ = buff_o_m[16];
  assign buffer_o[16] = _144_;
  assign _145_ = buff_o_s[15];
  assign _146_ = buff_o_m[15];
  assign buffer_o[15] = _147_;
  assign _148_ = buff_o_s[14];
  assign _149_ = buff_o_m[14];
  assign buffer_o[14] = _150_;
  assign _151_ = buff_o_s[13];
  assign _153_ = buff_o_m[13];
  assign buffer_o[13] = _154_;
  assign _155_ = buff_o_s[12];
  assign _156_ = buff_o_m[12];
  assign buffer_o[12] = _157_;
  assign _158_ = buff_o_s[11];
  assign _159_ = buff_o_m[11];
  assign buffer_o[11] = _160_;
  assign _161_ = buff_o_s[10];
  assign _162_ = buff_o_m[10];
  assign buffer_o[10] = _164_;
  assign _165_ = buff_o_s[9];
  assign _166_ = buff_o_m[9];
  assign buffer_o[9] = _167_;
  assign _168_ = buff_o_s[8];
  assign _169_ = buff_o_m[8];
  assign buffer_o[8] = _170_;
  assign _171_ = buff_o_s[7];
  assign _172_ = buff_o_m[7];
  assign buffer_o[7] = _173_;
  assign _175_ = buff_o_s[6];
  assign _176_ = buff_o_m[6];
  assign buffer_o[6] = _177_;
  assign _178_ = buff_o_s[5];
  assign _179_ = buff_o_m[5];
  assign buffer_o[5] = _180_;
  assign _181_ = buff_o_s[4];
  assign _182_ = buff_o_m[4];
  assign buffer_o[4] = _183_;
  assign _184_ = buff_o_s[3];
  assign _186_ = buff_o_m[3];
  assign buffer_o[3] = _187_;
  assign _188_ = buff_o_s[2];
  assign _189_ = buff_o_m[2];
  assign buffer_o[2] = _190_;
  assign _191_ = buff_o_s[1];
  assign _192_ = buff_o_m[1];
  assign buffer_o[1] = _193_;
  assign _194_ = buff_o_s[0];
  assign _195_ = buff_o_m[0];
  assign buffer_o[0] = _002_;
  assign finnished_blocks_trans = _003_;
  assign _004_ = trans_enable;
  assign trans_enable_c_m = _005_;
  assign trans_enable_c_s = _006_;
  assign _007_ = direction;
  assign trans_enable_buff_m = _009_;
  assign trans_enable_buff_s = _010_;
  assign _011_ = complete_s_buff;
  assign _012_ = complete_m_buff;
  assign ack_o_buff = _013_;
  assign _014_ = complete_s_card;
  assign _015_ = complete_m_card;
  assign ack_o_card = _016_;
  assign _018_ = buff_o_s[31];
  assign _020_ = buff_o_m[31];
  assign buffer_o[31] = _022_;
  assign _023_ = card_o_s_i[3];
  assign _025_ = card_o_m[3];
  assign card_o[3] = _026_;
endmodule
