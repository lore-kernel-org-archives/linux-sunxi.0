Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F678168
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 09:19:44 +0000 (UTC)
X-QQ-mid: bizesmtp35t1629278113t5er5ad8
Received: from [127.0.0.1] (unknown [112.96.109.179])
	by esmtp6.qq.com (ESMTP) with 
	id ; Wed, 18 Aug 2021 17:15:12 +0800 (CST)
X-QQ-SSF: 0010000000200070B000B00A0000000
X-QQ-FEAT: RUJ7g7zpdcFh8d4RQ6S/OfFAlrahh0AxSQd/6q9sMXCXJuMRuFdhrPCzyWCbv
	22zpDSa1w+pEDyRs3qLG7y9achh8XlJLUJxCeKV6POKYi4gQ9795xy2eE90Zq8NB/MoTG5t
	Ue7UEg43xOJ0FsV0IzI3QidBgNXEOYSKX2rXA7lh/0KPlych+e8usWWnm0Td7LO7SEz2RZ4
	9utX/FQ/nJKykOVhB9DjsB0crRWlPmVc8wpV0ry1xpoKErEM7MJP5wZBdh8tv7gL0XyJ7pi
	sXT7m/gqOubsHXoDGonpRUNJ2Xm2mu7CeD7c1XwrV294M9BdOoJtrcZvtkf8GGqUsZcK7gC
	FrFSIshmg8zJyXAmkY2QnV4wxD2grNwNbqYss09
X-QQ-GoodBg: 0
Date: Wed, 18 Aug 2021 17:15:05 +0800
From: Icenowy Zheng <icenowy@sipeed.com>
To: Maxime Ripard <maxime@cerno.tech>
CC: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/17] arm64: allwinner: dts: add DTSI file for R329 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <20210818090139.rllz4fvvq3pzdkls@gilmour>
References: <20210802062212.73220-1-icenowy@sipeed.com> <20210802062212.73220-16-icenowy@sipeed.com> <20210818090139.rllz4fvvq3pzdkls@gilmour>
Message-ID: <74F51516-2470-4A49-972B-E19D8EDD9A3D@sipeed.com>+2C0AB55E581E37B6
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam4



=E4=BA=8E 2021=E5=B9=B48=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885=
:01:39, Maxime Ripard <maxime@cerno=2Etech> =E5=86=99=E5=88=B0:
>On Mon, Aug 02, 2021 at 02:22:10PM +0800, Icenowy Zheng wrote:
>> Allwinner R329 is a new SoC focused on smart audio devices=2E
>>=20
>> Add a DTSI file for it=2E
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy@sipeed=2Ecom>
>> ---
>>  =2E=2E=2E/arm64/boot/dts/allwinner/sun50i-r329=2Edtsi | 244 ++++++++++=
++++++++
>>  1 file changed, 244 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-r329=2Edtsi
>>=20
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-r329=2Edtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-r329=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2Ebfefa2b734b0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-r329=2Edtsi
>> @@ -0,0 +1,244 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0+ OR MIT)
>> +// Copyright (c) 2021 Sipeed
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic=2Eh>
>> +#include <dt-bindings/clock/sun50i-r329-ccu=2Eh>
>> +#include <dt-bindings/reset/sun50i-r329-ccu=2Eh>
>> +#include <dt-bindings/clock/sun50i-r329-r-ccu=2Eh>
>> +#include <dt-bindings/reset/sun50i-r329-r-ccu=2Eh>
>> +
>> +/ {
>> +	interrupt-parent =3D <&gic>;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +
>> +	cpus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			compatible =3D "arm,cortex-a53";
>> +			device_type =3D "cpu";
>> +			reg =3D <0>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			compatible =3D "arm,cortex-a53";
>> +			device_type =3D "cpu";
>> +			reg =3D <1>;
>> +			enable-method =3D "psci";
>> +		};
>> +	};
>> +
>> +	osc24M: osc24M_clk {
>> +		#clock-cells =3D <0>;
>> +		compatible =3D "fixed-clock";
>> +		clock-frequency =3D <24000000>;
>> +		clock-output-names =3D "osc24M";
>> +	};
>> +
>> +	psci {
>> +		compatible =3D "arm,psci-0=2E2";
>> +		method =3D "smc";
>> +	};
>> +
>> +	timer {
>> +		compatible =3D "arm,armv8-timer";
>> +		arm,no-tick-in-suspend;
>> +		interrupts =3D <GIC_PPI 13
>> +			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			     <GIC_PPI 14
>> +			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			     <GIC_PPI 11
>> +			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			     <GIC_PPI 10
>> +			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>> +	};
>> +
>> +	soc {
>> +		compatible =3D "simple-bus";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		ranges;
>> +
>> +		pio: pinctrl@2000400 {
>> +			compatible =3D "allwinner,sun50i-r329-pinctrl";
>> +			reg =3D <0x02000400 0x400>;
>> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&ccu CLK_APB1>, <&osc24M>, <&rtc 0>;
>> +			clock-names =3D "apb", "hosc", "losc";
>> +			gpio-controller;
>> +			#gpio-cells =3D <3>;
>> +			interrupt-controller;
>> +			#interrupt-cells =3D <3>;
>> +
>> +			uart0_pb_pins: uart0-pb-pins {
>> +				pins =3D "PB4", "PB5";
>> +				function =3D "uart0";
>> +			};
>> +
>> +			mmc0_pf_pins: mmc0-pf-pins {
>> +				pins =3D "PF0", "PF1", "PF2",
>> +				       "PF3", "PF4", "PF5";
>> +				function =3D "mmc0";
>> +			};
>> +
>> +			mmc1_clk_pg0: mmc1-clk-pg0 {
>> +				pins =3D "PG0";
>> +				function =3D "mmc1_clk";
>> +			};
>
>Argh, of course it was bound to happen :)
>
>Make sure your DT pass validation though, all your mmc1 node names will r=
eport errors=2E
>
>> +
>> +			mmc1_cmd_pg1: mmc1-clk-pg1 {
>
>s/clk/cmd/ ?
>
>> +				pins =3D "PG1";
>> +				function =3D "mmc1_cmd";
>> +			};
>> +
>> +			mmc1_d0_pg2: mmc1-clk-pg2 {
>
>s/clk/d0/
>
>> +				pins =3D "PG2";
>> +				function =3D "mmc1_d0";
>> +			};
>> +
>> +			mmc1_d1_pg3: mmc1-clk-pg3 {
>
>s/clk/d1/
>
>> +				pins =3D "PG3";
>> +				function =3D "mmc1_d1";
>> +			};
>> +
>> +			mmc1_d2_pg4: mmc1-clk-pg4 {
>
>s/clk/d2/
>
>> +				pins =3D "PG4";
>> +				function =3D "mmc1_d2";
>> +			};
>> +
>> +			mmc1_d3_pg5: mmc1-clk-pg5 {
>
>s/clk/d3/
>
>> +				pins =3D "PG5";
>> +				function =3D "mmc1_d3";
>> +			};
>> +		};
>> +
>> +		ccu: clock@2001000 {
>> +			compatible =3D "allwinner,sun50i-r329-ccu";
>> +			reg =3D <0x02001000 0x1000>;
>> +			clocks =3D <&osc24M>, <&rtc 0>, <&rtc 2>;
>> +			clock-names =3D "hosc", "losc", "iosc";
>
>Do we have a clock tree for the RTC? Is it the same than the H616?

Nope, it's the same with H6 because of external LOSC crystal is
possible=2E (Although production M2A SoMs has it NC for cost control=2E)

What's the same between H616 and R329 is linear day storage of the timekee=
ping
part, not the clock part=2E

>
>Maxime

--=20
=E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84A=
ndroid=E8=AE=BE=E5=A4=87=E3=80=82
