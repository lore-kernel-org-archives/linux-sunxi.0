Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777045;
	b=zsmCxK1CTzt1cD/7Kgln43+RWQT5NoAepuOBI0u7Xx1FWL5l+PIHxmTTFVXPR0ou5Pdp
	 eRiA4n4XCrFsuLBs26kW5WIboY7QUXB0/LGBKikBJlnUI8o1/aDvAPtW7WR7ffL7jCmIs
	 fKerAmCPPzprdglCJNIHBXOFyO779cuELmSC+apSVGR4SML8gYdnIdy7WslBwpWFpA+Xa
	 sPNBBzuEQmbrBOJBOG2vtg5/+qgIufwSscpGB0oSBZEdVgBdx9c2Vg99JUxqfg6hURdhT
	 bk0lYGcpf29roowX3cAtc/rKfMilUweW/UrpOBZQWWe+E5eHCWXchhpcs6Q3yRGrBcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777045;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Xx1Jv0J1bDZQpWVoeU6QkZxWXumP+4homny7f0vYJN8=;
	b=Mg3Rq6psI8mbOV7MAxRsflK84FuU2qR7e5xAZ+cWCju1bcOvujVjGi/OWO/BcCXOyi+S
	 R59o+3uvTM7lBqaaAeOWfEyCcvTpYWeB27o62/P4mKc9aYwhWIUTMzn8POwjg5WoySyeW
	 JSgSnRQ1wBYhypPI2XBbDbsE6JlS09E8nY1wcxbZRAvSf7KgAa6DGV6n0eW+XJ+3QYwo7
	 KmDV40cctmBoDNvQAwI+jhsk4he4tJE1xFVsGEK8DJoZWCGdBeZB30tnT8ymahst61iZR
	 y8ckDCX6gbJDi7ysQMC0H0zcaMnL7MtNuT23noXs0VV84nTMKMRDM6RmEhLhhq8eXHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B25sau8T;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08D8606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B25sau8T
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 113372F;
	Fri, 27 Nov 2026 02:57:20 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD2AC3F86C;
	Fri, 27 Nov 2026 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795777042; bh=tI/WuxzQHxbeBxg0ET/wSwRkMo9dWBTAelQ6L/tkO0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B25sau8T3KTWvItqVLYxp2RC03ZVEdbWyH2MkDzRUOwL8iEOzA/2/szKI8T2Qprfd
	 h3ydqMKrxtJOWqAT2aGr0TfpGKtfA+aov42u1vZKGbr9qedYIqIEJGcOHMe4lweHCQ
	 92rX7V3jq+WkTaWtSYyrHCAP3UW8GslYwmn/6M4w=
Message-ID: <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
Date: Fri, 27 Nov 2026 10:57:16 +0000
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
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jernej,

On 11/27/26 05:29, Jernej Škrabec wrote:
> Dne četrtek, 26. november 2026 ob 21:35:40 Srednjeevropski standardni čas je Enzo Adriano napisal(a):
>> The Allwinner A733 combines six Cortex-A55 and two Cortex-A76 cores.
>> Add the common device tree for the first Cubie A7A, A7S and A7Z board
>> DTS files. Describe the CPUs, PSCI, architectural timers, GIC, RTC,
>> main and always-on clock/reset and pin controllers, UART, I2C and
>> MMC. The preceding revision booted on the A7S and A7Z.
>>
>> The A7S schematic, sheets 7 and 16, shows the EEPROM wired to I2C0
>> on PG8/PG9. Use mux 6 as documented in the A733 Datasheet v1.00,
>> section 4.2.6, table 4-36. The A7A schematic shows the external RTC
>> on S_TWI1. Add its R-I2C1 pin group on PL12/PL13, mux 3.
>>
>> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
>> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
>> and noncoherent attributes follow Andre Przywara's A733 reference
>> and the A523 precedent. The CPUX interconnect diagram in section
>> 5.1.2 supports the noncoherency inference. Leave the ITS disabled
>> pending clock/reset and MSI integration.
>>
>> Describe the single DynamIQ unit and shared L3 shown in section
>> 5.1.2, figure 5-1. Partition PPI 7 (section 12.2.3, table 12-1)
>> between the Cortex-A55 and Cortex-A76 PMUs so each probes its own
>> core type. Defer capacity-dmips-mhz until it is measured on A733.
>>
>> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
>> Link: https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@arm.com
>> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11
>> Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
>> Co-developed-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>> ---
>> Changes since v5:
>> - Mark the I2C0 PG8/PG9 group /omit-if-no-ref/, as requested. This
>>    satisfies Andre's review condition.
>> - Move the RTC clock include after the A733 clock headers and cite
>>    the A733 datasheet and A7S schematic for the I2C0 pins.
>> - Fold in Andre's R-I2C1 pin group for A7A. A7S and A7Z leave
>>    it unused. A7S still references the I2C0 group.
>> - Vinicius tested the v5 DTSI with his A7Z v1.11 board DT. Norman
>>    tested the v5 series on A7S. Their tags here cover the SoC DTSI.
>>
>>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
>>   1 file changed, 671 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> new file mode 100644
>> index 000000000000..e062b08006da
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> @@ -0,0 +1,671 @@

[ ... ]

>> +
>> +		mmc0: mmc@4020000 {
>> +			compatible = "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
> 
> That's not really the case, is it? A733 emmc has support for voltage switching,
> so regulator should be added here for voltage switching.

But it's still compatible to the D1 MMC controller, isn't it? As in: a 
driver capable of supporting the D1 MMC IP can also drive the A733 MMC. 
I think the voltage regulator is a separate problem: it's external to 
the MMC IP. The vqmmc supply property is documented and usable, and the 
availability of the regulator it points to is a separate issue.
The same as the H616 and A523 have the voltage switch already, but are 
still compatible to the A100 and D1, respectively.

> I suggest that you drop this node until proper adjustment is made.

Do you have any code for the voltage switch already? Your comment in the 
UHS-1 prep series suggests so? Any chance you can post that separately, 
to get any DT compatibility problems out of the way early?

Cheers,
Andre

> Best regards,
> Jernej
> 
>> +			reg = <0x04020000 0x1000>;
>> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
>> +			clock-names = "ahb", "mmc";
>> +			resets = <&ccu RST_BUS_MMC0>;
>> +			reset-names = "ahb";
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&mmc0_pins>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
