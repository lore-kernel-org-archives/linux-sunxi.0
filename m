Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013333D4
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691323550;
	bh=QQlkrQlRMOL64jl7dj3sFnA05/M+vwVYe0FHD7Y9Ceg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DwStBJnVa7A5SGGNRDEczUobmMsILAvYhv+om12x5vRdqwFZWBv30hcOHjrFteqdn
	 nG9W5UZxUEq9IYgdW44sn/ye+vOcvBRxqLfrCVAfy/42xEPklfrvquPDtyCTivfy2H
	 18htS5VIEHuN03kITtIpUaH0RsEIAsWzIi2IowE8=
X-QQ-mid: bizesmtp84t1691323481t1apgc4x
Received: from [192.168.2.144] ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Aug 2023 20:04:06 +0800 (CST)
X-QQ-SSF: 01400000000000704000000A0000000
X-QQ-FEAT: I8hG9CuxGDLqrFNU3xoRzpwZvtXb1JXP/B5t77gXroA70Q3Fe/tCzZQszBzGU
	A8hO6mKFnoN6GoWJXMyuxuYjWoEzZ8fbDy3KMA1CvgZ5Uglwjcw7cr/FjRI4QhEchHr26Tv
	owu3ImbCEa2phAOVhtBm4eTdRcrc5plqsnnIBc19Oa7AflB+fQHrhwwqmSMg2D8Ueu1u8Qq
	DDnsk3YKFMyjtmvwp665WKO/5FDgIJbVD2TIaKh3jSoEW8iAKp5OYIA6gZEOh4rYQ0WTDSx
	X9v2BGv9tuJu7/I0thiOOtzbKqf33NmvXGrkoyAFha8Lw4w03mzgi2Zlc3FbkNBllnzQm1G
	za3IahcnvL7DqPts/GS692qiucktk263P+P1NNg
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 9840284520535786506
Message-ID: <49CEE97731867667+423c5685-7bb7-d402-5496-af6aec276230@biqu3d.com>
Date: Sun, 6 Aug 2023 14:04:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/4] Add BigTreeTech CB1 SoM & Boards
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Icenowy Zheng <uwu@icenowy.me>, Ludwig Kormann <ludwig.kormann@ict42.de>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <5EB3DB1D7F80A40F+20230805083636.788048-1-martin@biqu3d.com>
 <3242042.aeNJFYEL58@jernej-laptop>
From: Martin Botka <martin@biqu3d.com>
In-Reply-To: <3242042.aeNJFYEL58@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1



On 8/6/23 1:54 PM, Jernej Škrabec wrote:
> Dne sobota, 05. avgust 2023 ob 10:36:03 CEST je Martin Botka napisal(a):
>> Hello,
>> This series adds a vendor prefix for BigTreeTech and adds BigTreeTech CB1,
>> Manta board and BigTreeTech Pi.
>>
>> CB1 is just an SoM thats based on AllWinner H616.
>> BigTreeTech Manta boards are expander boards for CB1 and BigTreeTech Pi
>> is an CB1 in Rpi style with few additional things like IR receiver and fan
>> port on GPIO.
>>
>> This work started before I was hired by BigTreeTech and thus majority of the
>> patches are from SoMainline email and few are from my work email.
>>
>> This series depends on commit https://lkml.org/lkml/2023/8/2/801
>> "dt-bindings: mfd: x-powers,axp152: make interrupt optional for more chips".
> 
> What's the status of above patch?
Hello,

AXP313a and AXP305 are missing an IRQ check and thus V2 with the chips 
added to the check will be needed and should be sent out by Andre soon :)

Cheers,
Martin
> 
> I won't merge this series until it's accepted and merged.
> 
> Best regards,
> Jernej
> 
>>
>> Cheers,
>> Martin
>>
>> Martin Botka (4):
>>    dt-bindings: vendor-prefixes: Add BigTreeTech
>>    dt-bindings: arm: sunxi: Add BigTreeTech boards
>>    arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
>>    arm64: dts: allwinner: h616: Add BigTreeTech Pi support
>>
>>   .../devicetree/bindings/arm/sunxi.yaml        |  11 ++
>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>   arch/arm64/boot/dts/allwinner/Makefile        |   2 +
>>   .../sun50i-h616-bigtreetech-cb1-manta.dts     |  35 +++++
>>   .../sun50i-h616-bigtreetech-cb1.dtsi          | 140 ++++++++++++++++++
>>   .../allwinner/sun50i-h616-bigtreetech-pi.dts  |  70 +++++++++
>>   6 files changed, 260 insertions(+)
>>   create mode 100644
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts create
>> mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
>> create mode 100644
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> 
> 
> 
> 
> 
