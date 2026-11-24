Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550644;
	b=jFrJJUcMB4qNOCw4RM3hVyYW+Xk6qJWuFatoZpNCauvAuYQo+L52KVhq2TkPBXaOvtnv
	 L9UVcD8+LX4ZWOBlm0ttXH6t4Tuwwog5RKmUOwlHx6TV1pf0JtbtCZjIb0TlV5RfrkpOM
	 dTbvQhQfFO9wCnbg1CI4QGteQoGD22QFxGH4IDIiCxKn5htklQ9B26qzkIChbaUu+qNA/
	 yYLbgIOsPYrG6eMCqltl8uC62jNTU225nz4o744aXcSpvlNZ/oZA2Ad7QnVd/gxCAU4UE
	 nGZO+WiehcmVq0qjPY3+Wer0+pk0/qCTQ8nt/pM+srCA8ncX9dqdxg+yKLr9oOlU/3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550644;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LqL9E2CsknPEvpMVhLoxgxMbDObTKIGjsIWFOHL2N0I=;
	b=feDbpgGqdeijJOwOyV8Rc7zGL7MpZH6Fiix2Z8OF69DHrVRgxa/bmvzCdKcYRZcmsVDa
	 vjOBgKzdAW3Hct3eirI9PFxpeSLSd0PQn/qkLtvSnbDmGPudZb8pr5UCLvXHLYtja8Zdd
	 sSkQJB30fqntfYm5sU7NyIrCxnTA2/lEHlBksBV7sMDE8iB4GYwX0QYt14gO0/Bkjt765
	 vJCyqFKJ3xNwNLDukRb1oY03h5ktXLHRlf00FEFlIe2gDIjJr413CTUwJTHS+lFNI0pcX
	 gAoF575vYDasngU9vDRrVgI7pgNlmCTSKUmq6bFQK216PzUjWJX5CexS+5cc6netEWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YWezaFgy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A056606A321
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 20:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A056606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YWezaFgy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AFF2339;
	Tue, 24 Nov 2026 12:03:59 -0800 (PST)
Received: from [172.16.5.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE66C3F86C;
	Tue, 24 Nov 2026 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795550642; bh=tH2ftS9r4c42XZ26viYlbeouW30U4/gw4lJnh0zk7SU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWezaFgy8T10St9qmvBLJvNxDlbL/eye1ooesVYZOfNAfSSorrjH81ZvoCdRYf8j+
	 PKHCQk6RZLXWbgZ0FWxE7sw4azkh8UT/jpVVnUYrLezL0D22YEQRXDDt5FvnNRUPcq
	 JK0SDhRZNSxWmQHbdZEC7WCFMcUlyCe8nTS/SfbM=
Message-ID: <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
Date: Tue, 24 Nov 2026 21:03:56 +0100
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
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
To: wens@kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
 <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
 <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/24/26 17:44, Chen-Yu Tsai wrote:
> On Tue, Nov 24, 2026 at 1:42 AM Enzo Adriano
> <enzo.adriano.code@gmail.com> wrote:
>>
>> Provide the SoC description needed by the initial Cubie A7S DTS for its
>> console, PMIC, EEPROM and microSD. Describe the CPUs, PSCI, architectural
>> timers, GIC, RTC, main and always-on clock/reset and pin controllers.
>> Include the main and R-domain UART/I2C instances and MMC0-2 with their
> 
>> pin groups. Use mux 6 for I2C0 on PG8/PG9, as in Radxa's BSP pinctrl
>> driver and its Cubie A7S device tree.
> 
> This should be evident from the schematic itself (the pins are used for
> I2C). And then the datasheet would tell you which mux value it is.
> 
> Just saying, trust the datasheet and schematic a little more than the BSP.
> And one really should write the device tree based on the schematic. The
> BSP is there in case something doesn't work, to look for existing quirks
> or workarounds.

Fully agree with that, the BSP is sketchy at best, especially their DT. 
I have seen contradictory information in there already.

Also I think the commit message reads a bit awkward, at least it 
deviates from what we typically see. I would start with a brief 
introduction of the SoC. Just mentioning that we have the full user 
manual and that this has been tested on a real board should be 
sufficient, then it's obvious where those values come from.
  >> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
>> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
>> and noncoherent attributes follow Andre Przywara's public A733
>> reference and the A523 precedent. The CPUX interconnect diagram in
>> section 5.1.2 supports noncoherency as an integration inference. The
>> ITS stays disabled pending its clock/reset and MSI integration.
>>
>> Describe the single DynamIQ unit and shared L3 shown in section 5.1.2
>> (figure 5-1). The big and little DVFS groups can be described by their
>> clocks, OPP tables and supplies. Partition PPI 7 (section 12.2.3,
>> table 12-1) between the Cortex-A55 and Cortex-A76 PMUs so each probes
>> its own core type. Defer capacity-dmips-mhz until it is measured on A733.
>>
>> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
>> Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc924bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610
>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>> ---
>>
>> v4 -> v5: Rename osc to hosc and add the I2C0 PG8/PG9 group. Keep the
>> one-cluster CPU map and the two PMU partitions.
>>
>> Untested on v5: physical CPU/cache topology, PMU counting, EL2
>> interrupt delivery and ITS/MSI.
> 
> Someone please test the PMU.
> 
>>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 663 ++++++++++++++++++
>>   1 file changed, 663 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> new file mode 100644
>> index 000000000000..8a258f16751e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> @@ -0,0 +1,663 @@
> 
> [...]
> 
>> +               uart0: serial@2500000 {
>> +                       compatible = "allwinner,sun60i-a733-uart",
>> +                                    "snps,dw-apb-uart";
> 
> We can't merge this because the bindings haven't been merged. And they seem
> to still be going through a lot of churn?

But I think the binding patch for that is fine? And we are pretty sure 
that we need SoC specific compatible strings for every SoC, actually, 
regardless of how those UART fixes series' (Vinicius' and James') proceed.
So I wonder if you could take just that binding patch already, to not 
block progress here?

Cheers,
Andre
