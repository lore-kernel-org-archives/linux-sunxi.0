Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453359;
	b=o1gtgjZ5p+bwh88aWDl9BiHh08SNyxUU0sSkePiGwpgG/w80DMpFC0pcI9vxoV6VZ7Tz
	 InwlfB5tVbhRR2Avqk7dy1LupLAoDJF8ecqt/qgNlar6IZOaGpFb1R+2xlfQDUf0YIkuC
	 uxnZgEU5vMGbeHQBma9KnjRT86bl4NyzzWWOHDnCihF788cFCWNXrH1Q+WQeIDtP2aFJM
	 uxRJock5GULRDZvGBu4IPD+XK9H82HfbbFYiyW8M8yV2BAn8Ez1YK3gywXWiEuDaZIlKW
	 1lMnG75fwj892YfL1Dsv4nj/kXx8Wuf7bRVEp0gXZpKQcOxKkci/FZaZn5pgmWNEVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453359;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Zs6ODemD0A60MW9aPf1NQdG6KomEoEDS4UdX3N3dA0Y=;
	b=uEO2XMTGDe0N9kV2RzYjQhrx+oqIVaS3t8FNmH8CCa+HV0La8IaqyY+dlT5gGhaUeHlJ
	 cWiz5TL3aeoOhDS84WiJbVjknAZoYBF4wTKkwaHlMPtsC5oH9lnaKncLY4xhBm5s0XLYx
	 015ZCND1V0oVTA8S1bZwSAqGXDnRkOJz8Y3Tm++140NZOOmcBOH/H28qF3IUk6d48ANsh
	 Uo2f1SuSctlsID76ZFGhv2K2wgieA6azQq+cjbilhPuJeJt2dAzolKhfJxE0uzn+x4bst
	 P3nc54Ou7UyWOk2pNl0BxSKhn50ddklaAcZh6FC+IkqZdWy49Bhw1IkPXlxKdB26DnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hstLZrCp;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25663606A31F
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 17:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25663606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hstLZrCp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65127143D;
	Mon, 23 Nov 2026 09:02:35 -0800 (PST)
Received: from [10.57.69.138] (unknown [10.57.69.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2038A3F632;
	Mon, 23 Nov 2026 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795453358; bh=6og8JjoteR1OR9XmbXU7Qe5NkDb+Li/Uj9lHNxClAAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hstLZrCpD0pFFB1FhcOgXTeMLO88zumcdAk2AtDxhmt4G9BIsX/AugvmgM7JTBdwj
	 UU+e9lurTsWqUjV8TgO6oI9iNXKHdZpFmN+rzwsn30XHnP2ghNpi79qECvJ9aMvKFx
	 r5C6rN9lcGXUipJgTQU5pSA2BtoDcjPk+oLhKllA=
Message-ID: <e06ebd54-d41d-4cec-8f1d-cce8339297a4@arm.com>
Date: Mon, 23 Nov 2026 18:02:34 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: add Radxa Cubie A7Z board
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: enzo.adriano.code@gmail.com, mripard@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com>
 <8f9f9752-4c23-48de-9483-63268627ff3c@arm.com>
 <nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/26 17:57, Vinicius Pedrosa wrote:
> On Mon, Nov 23, 2026 at 1:35 PM Andre Przywara <andre.przywara@arm.com> wrote:
>> sorry, I missed your post earlier, so made my own version of the DT
>> yesterday. So this is more like comparing this to yours ;-)
> 
> No worries. I'll fold your comments into a v2 once Enzo's v5 is out. Do
> you plan to post yours? I'd rather end up with one A7Z DT than two.

No, yours was first, and you got my review on it, so we go with that.
I have an A7A .dts almost ready as well, will post that later.

>>> + reg_dcdc9: dcdc9 {
>>> + regulator-name = "eldo-input";
>>
>> The schematic says 1.1V/1.25V. Can you check what it is on your board,
>> at runtime? If in doubt, go with 1.1V, this should be enough headroom
>> for the ELDO6 this supplies, with outputs 0.8V.
> 
> It reads 1240 mV at runtime on my v1.11, what the firmware leaves. I also
> ran it at a fixed 1.1 V and it was fine for a few minutes, but the
> AXP318W datasheet draft lists 1.2 V as the minimum ELDOIN as an LDO. I'd
> use a 1.2 to 1.25 V range, which keeps 1.24 V.

Ah, I missed that requirement in the AXP datasheet, 1.24V it is, then.

Thanks,
Andre

> Thanks,
> Vinicius
> 
> On Mon, 23 Nov 2026 13:35:44 +0100, Andre Przywara
> <andre.przywara@arm.com> wrote:
>> Hi Vinicius,
>>
>> sorry, I missed your post earlier, so made my own version of the DT
>> yesterday. So this is more like comparing this to yours ;-)
>> As you saw my reply to Enzo's .dtsi and A7S .dts, I will keep the same
>> issues I mentioned there brief.
>>
>> On 11/11/26 14:49, Vinicius Pedrosa wrote:
>>> Add the device tree for the Radxa Cubie A7Z. Describe UART0, the AXP318W
>>> PMIC over R-I2C0, MMC0, RTC and the bank supplies. It is based on the
>>> Cubie A7S DT.
>>>
>>> Unlike the A7S, this board uses BLDO5 for PG and a SY8089 regulator for
>>> the PMIC's BLDO and CLDO inputs, and the microSD card-detect line has an
>>> external pull-up, so no internal pull-down is used. ELDO1 only supplies
>>> VDD2L for LPDDR5 and this board uses LPDDR4, so it is not described.
>>> SWOUT1 only feeds ports D and J on the 40-pin header, so it is not kept
>>> always-on.
>>
>> I think this stanza does not belong into the commit message, as
>> comparing to some different board is not relevant here.
>> Instead you should briefly list the features/connectors of this board,
>> look at other commit messages for board .dts files.
>>
>>>
>>> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
>>> ---
>>> arch/arm64/boot/dts/allwinner/Makefile | 1 +
>>> .../dts/allwinner/sun60i-a733-cubie-a7z.dts | 286 ++++++++++++++++++
>>> 2 files changed, 287 insertions(+)
>>> create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
>>> index 792152525b43..2eee91dcbd77 100644
>>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>> @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
>>> dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
>>> dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
>>> dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
>>> +dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
>>> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
>>> new file mode 100644
>>> index 000000000000..ab3d3d70f9ff
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
>>> @@ -0,0 +1,286 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>
>> I think you need a copyright line here.
>>
>> Also please explain the situation with the v1.10 and v1.11 versions here.
>>
>>> +/dts-v1/;
>>> +
>>> +#include "sun60i-a733.dtsi"
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +/ {
>>> + model = "Radxa Cubie A7Z";
>>> + compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
>>> +
>>> + aliases {
>>> + mmc0 = &mmc0;
>>
>> Please remove.
>>
>>> + serial0 = &uart0;
>>> + };
>>> +
>>> + chosen {
>>> + stdout-path = "serial0:115200n8";
>>> + };
>>> +
>>> + reg_ps: regulator-system-power {
>>
>> Please add a short comment where this power comes from (USB-C connector).
>>
>>> + compatible = "regulator-fixed";
>>> + regulator-name = "ps";
>>> + regulator-min-microvolt = <5000000>;
>>> + regulator-max-microvolt = <5000000>;
>>> + regulator-always-on;
>>> + };
>>> +
>>
>> As mentioned in the other mail, please add a comment that this has been
>> added in v1.11, and v1.10 doesn't have it.
>>
>>> + reg_ldo_input: regulator-ldo-input {
>>> + compatible = "regulator-fixed";
>>> + regulator-name = "ldo2v5-input";
>>> + /* SY8089: 0.6 V * (1 + RP11 / RP6), 30k / 10k. */
>>> + regulator-min-microvolt = <2400000>;
>>> + regulator-max-microvolt = <2400000>;
>>> + regulator-always-on;
>>> + vin-supply = <&reg_ps>;
>>> + };
>>> +
>>> + osc32k: osc32k-clk {
>>> + compatible = "fixed-clock";
>>> + #clock-cells = <0>;
>>> + clock-frequency = <32768>;
>>> + };
>>> +};
>>> +
>>> +&cpu0 {
>>> + cpu-supply = <&reg_dcdc5>;
>>> +};
>>> +
>>> +&cpu1 {
>>> + cpu-supply = <&reg_dcdc5>;
>>> +};
>>> +
>>> +&cpu2 {
>>> + cpu-supply = <&reg_dcdc5>;
>>> +};
>>> +
>>> +&cpu3 {
>>> + cpu-supply = <&reg_dcdc5>;
>>> +};
>>> +
>>> +&cpu4 {
>>> + cpu-supply = <&reg_dcdc5>;
>>> +};
>>> +
>>> +&cpu5 {
>>> + cpu-supply = <&reg_dcdc5>;
>>> +};
>>> +
>>> +&cpu6 {
>>> + cpu-supply = <&reg_dcdc3>;
>>> +};
>>> +
>>> +&cpu7 {
>>> + cpu-supply = <&reg_dcdc3>;
>>> +};
>>> +
>>> +&mmc0 {
>>> + bus-width = <4>;
>>> + cap-sd-highspeed;
>>
>> Same as the A7S, please add the others.
>>
>>> + /* PF6 has an external 10k pull-up and reads high with a card. */
>>
>> "reads high with a card" is a redundant comment, since this is what
>> GPIO_ACTIVE_HIGH already says.
>> Please explain the situation with the v1.10 vs. v1.11 versions here.
>> And my v1.10 board needs GPIO_PULL_DOWN
>>
>>> + cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
>>> + disable-wp;
>>> + max-frequency = <50000000>;
>>> + no-1-8-v;
>>
>> Please remove both.
>>
>>> + vmmc-supply = <&reg_swout2>;
>>> + /* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
>>> + vqmmc-supply = <&reg_swout2>;
>>
>> Please remove those two lines, we will add vqmmc later.
>>
>>> + status = "okay";
>>> +};
>>> +
>>> +&osc {
>>> + clock-frequency = <26000000>;
>>> +};
>>> +
>>> +&pio {
>>> + vcc-pb-supply = <&reg_swout2>;
>>
>> Please add a comment that this comes from VCC-IO. See the Cubie A5E DT.
>>
>>> + vcc-pc-supply = <&reg_cldo5>;
>>> + vcc-pd-supply = <&reg_swout1>;
>>> + vcc-pe-supply = <&reg_bldo1>;
>>> + /* CLDO5 feeds VCC18-PF; the 3.3 V path uses VCC-IO. */
>>> + vcc-pf-supply = <&reg_cldo5>;
>>
>> As it stands this is VCC-IO, so swout2, please change that, plus the
>> VCC-IO comment.
>>
>>> + vcc-pg-supply = <&reg_bldo5>;
>>> + vcc-ph-supply = <&reg_swout2>;
>>
>> VCC-IO comment, please.
>>
>>> + vcc-pj-supply = <&reg_swout1>;
>>> + vcc-pk-supply = <&reg_bldo1>;
>>> +};
>>> +
>>> +&r_i2c0 {
>>> + status = "okay";
>>> + pinctrl-names = "default";
>>> + pinctrl-0 = <&r_i2c0_pl_pins>;
>>> +
>>> + axp318w: pmic@36 {
>>> + compatible = "x-powers,axp318w";
>>> + reg = <0x36>;
>>> + interrupt-parent = <&nmi_intc>;
>>> + interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>>> + interrupt-controller;
>>> + #interrupt-cells = <1>;
>>> +
>>> + aldo156in-supply = <&reg_ps>;
>>> + aldo234in-supply = <&reg_aldo1>;
>>> + bldoin-supply = <&reg_ldo_input>;
>>> + cldoin-supply = <&reg_ldo_input>;
>>
>> Please add a comment about v1.10 differing.
>>
>>> + dldoin-supply = <&reg_ps>;
>>> + eldoin-supply = <&reg_dcdc9>;
>>> + ips-supply = <&reg_ps>;
>>> + vin19-supply = <&reg_ps>;
>>> + vin23-supply = <&reg_ps>;
>>> + vin45-supply = <&reg_ps>;
>>> + vin678-supply = <&reg_ps>;
>>> +
>>> + regulators {
>>> + reg_dcdc1: dcdc1 {
>>> + regulator-name = "vcc-3v3";
>>> + regulator-min-microvolt = <3300000>;
>>> + regulator-max-microvolt = <3300000>;
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc2: dcdc2 {
>>> + regulator-name = "vdd-sys";
>>
>> Please add the voltage: 0.8V.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc3: dcdc3 {
>>> + regulator-name = "vdd-cpub";
>>
>>  From the OPP tables I could find in the Radxa repo on github, the range
>> should be 0.8V - 1.05V. We can adjust this later when we add proper DVFS
>> support, if needed.
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc4: dcdc4 {
>>> + regulator-name = "vdd-gpu";
>>> + regulator-always-on;
>>
>> Voltage range should be 0.8V - 0.96V, and drop the always-on.
>>
>>> + };
>>> +
>>> + reg_dcdc5: dcdc5 {
>>> + regulator-name = "vdd-cpul";
>>
>> Voltage range 0.8V - 1.05V.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc6: dcdc6 {
>>> + regulator-name = "vcc-draml";
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc7: dcdc7 {
>>> + regulator-name = "vcc-dram";
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc8: dcdc8 {
>>> + regulator-name = "vcc-ufs-io";
>>
>> The voltage is 1.2V, and please drop the always-on.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dcdc9: dcdc9 {
>>> + regulator-name = "eldo-input";
>>
>> The schematic says 1.1V/1.25V. Can you check what it is on your board,
>> at runtime? If in doubt, go with 1.1V, this should be enough headroom
>> for the ELDO6 this supplies, with outputs 0.8V.
>>
>>> + regulator-always-on;
>>
>> Please remove.
>>
>>> + };
>>> +
>>> + reg_swout1: swout1 {
>>> + regulator-name = "vcc33-lcd";
>>
>> Please use "vcc-pd-pj" as the name.
>>
>>> + };
>>> +
>>> + reg_swout2: swout2 {
>>> + regulator-name = "vcc-io-card";
>>
>> I used "vcc-io-ph-usb", "card" does not seem to be used.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_aldo1: aldo1 {
>>> + regulator-name = "vcc-pl";
>>
>> Also USB it seems, so I used "vcc-pl-usb".
>>
>>> + regulator-min-microvolt = <3300000>;
>>> + regulator-max-microvolt = <3300000>;
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_bldo1: bldo1 {
>>> + regulator-name = "vcc-pe-pk-mcsi";
>>
>> Voltage is 1.8V.
>>
>>> + };
>>> +
>>> + reg_bldo2: bldo2 {
>>> + regulator-name = "vcc-lvds0";
>>
>> 1.8V as well.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_bldo4: bldo4 {
>>> + regulator-name = "vcc18-codec";
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + };
>>> +
>>> + reg_bldo5: bldo5 {
>>> + regulator-name = "vcc-pg";
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + };
>>> +
>>> + reg_cldo1: cldo1 {
>>> + regulator-name = "vcc33-18-usb";
>>
>> That is a confusing name ;-) "vcc-pm-lpddr" should explain the always-on.
>>
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_cldo2: cldo2 {
>>> + regulator-name = "vcc18-hdmi";
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + };
>>> +
>>> + reg_cldo3: cldo3 {
>>> + regulator-name = "vcc-pll-dram";
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_cldo5: cldo5 {
>>> + regulator-name = "vcc18-pf-pc";
>>
>> "pf" is somewhat misleading. I had "vcc-pc-combo".
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dldo1: dldo1 {
>>> + regulator-name = "vcc-efuse";
>>
>> Voltage is 1.8V.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_dldo6: dldo6 {
>>> + regulator-name = "vcc-ufs";
>>
>> Voltage is 2.5V, and no always-on should be needed.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_eldo6: eldo6 {
>>> + regulator-name = "vdd-cpus";
>>
>> Voltage is 0.8V.
>>
>>> + regulator-always-on;
>>> + };
>>> +
>>> + reg_rtc_ldo: rtc-ldo {
>>> + regulator-name = "vcc-rtc";
>>> + regulator-min-microvolt = <1800000>;
>>> + regulator-max-microvolt = <1800000>;
>>> + regulator-always-on;
>>> + };
>>> + };
>>> + };
>>> +};
>>> +
>>> +&r_pio {
>>> + /* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
>>
>> Probably better to copy the comment from the other DTs, and have the
>> "would-be" line inside the comment (vcc-pl-supply = <&reg_aldo1>;)
>>
>> Cheers,
>> Andre
>>
>>> + vcc-pm-supply = <&reg_aldo1>;
>>> +};
>>> +
>>> +&rtc {
>>> + clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
>>> + <&osc32k>;
>>> + clock-names = "bus", "hosc", "ahb", "ext-osc32k";
>>> +};
>>> +
>>> +&uart0 {
>>> + pinctrl-names = "default";
>>> + pinctrl-0 = <&uart0_pb_pins>;
>>> + status = "okay";
>>> +};

