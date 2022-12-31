Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA62C9C
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Dec 2022 19:12:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 537605C006E;
	Sat, 31 Dec 2022 14:12:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 31 Dec 2022 14:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672513952; x=
	1672600352; bh=HHwFSzhmhIiAgDL5hBXf37YFQCuiHuO5p0U4EW3wAx8=; b=V
	WeqovfpPdFmBhGmEQD5h3drvcmV5ssytOYssZ/BKcWxVYRuQK8sa2tiT4o1JQJNQ
	lfhuIl7PvtNeZ5HwC4xXsS3RihF6BrHsrm32/sSAbCb8RWsniz0DEzsCg7oaa4YN
	ugld2286ow2ioLdq/yBkg8rhqXdr7HlmJyVGaOtFEeqF8P89Nz/W6Y2uw+GyhKAv
	pdwTkH/0UuUVtNQX8Sisrt55hPJfiBetWxxFSMZZhvtFjp8sTEjuhobxM3xpqP79
	1zlKWvvKJWLYEK7DjgkUSMZZYasrXAjvUcinmvfzg6jHWCKIB1EuafaGTft8lcMr
	TrP1hp4liYtrk9uf8W93w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672513952; x=
	1672600352; bh=HHwFSzhmhIiAgDL5hBXf37YFQCuiHuO5p0U4EW3wAx8=; b=c
	ivXP4CFRjwGlmbcHS5kB9EwAExLnIq+CT0cF+5WeDiovq9WIGVa0RWMrbVS0UTGT
	WO0qesh3quQpWxDeJ9BnZqFNB8j2aQicdv3xuU4fTue7VlcZly5rlLBLFyqjs2vL
	lWoMIABUIPPUWB+DaYkvawPL95id2rBOgrT/h/+abIoMpnjOEmVH4lhjD3knKU5T
	vGBelDhuEoEVCeEAxU6XoXnXDzmEpeoAxCRNojnRuVN1eG0mV6nrr2+o4gPvCVjy
	k9CKPxZUTbC1xcDNs0eXJGfoCx+EvxoLjf8lVjblvFMUBZr6lTETa1mdVYaJFO6A
	a2mV94i+CNDdPn4svAWFA==
X-ME-Sender: <xms:n4mwY8vh5UG0-q_64t3UOe9SvqPX-SI2OvMoC-nMcyg7XaHgWpi2OA>
    <xme:n4mwY5eh1xCi7BGEs0LY15eHB6DWqTWx00lxAnqStebKfK533-iSF0yjmviUrQBVr
    NbJXuvIpW1xZHiPsA>
X-ME-Received: <xmr:n4mwY3zPkceXdffHBnlTdP6UBMTcgg41VTeHK-wXnKj-OhCnI0tTXYVF-POMgt8FG2QdK7VZAwYq84D_QOf8vlLrw0YIhOlEK8qhFFyCBcFdTVqRdn1IwBzJYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeegteekvefhgefhgfeigeejffejvdeihedvfefgtedvjeeiudet
    teeihfffgfeugfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehs
    hhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:n4mwY_MrsgxFUNbHQUPM0rmn3enNPZsq9R9QUwQRjaJaXKWsMY56gA>
    <xmx:n4mwY8_MoPVQ0qMucFc89pSo1WvcL3b9eOzxcrMWCAm1o8kXYkzlTA>
    <xmx:n4mwY3XKM9-VY_CkUvEtfl_UVl67ZVu5RlTUG7tvvCH1ry2pwIHVfg>
    <xmx:oImwYwSPg4u3dImYw_gCexNr_AFFsMCDsXSokGyvFZnklAjTSK8eiw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 14:12:31 -0500 (EST)
Message-ID: <b63e8e05-6ca0-ea77-bfb8-f9ecca2ebdcc@sholland.org>
Date: Sat, 31 Dec 2022 13:12:30 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20221231160402.16157-1-samuel@sholland.org>
 <20221231160402.16157-2-samuel@sholland.org>
 <92dbd096-b02f-b5e5-6275-a37a3d582685@linaro.org>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add Allwinner D1 PPU
In-Reply-To: <92dbd096-b02f-b5e5-6275-a37a3d582685@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/31/22 12:58, Krzysztof Kozlowski wrote:
> On 31/12/2022 17:04, Samuel Holland wrote:
>> The Allwinner D1 family of SoCs contain a "PPU" power domain controller
>> separate from the PRCM. It can power down the video engine and DSP, and
>> it contains special logic for hardware-assisted CPU idle. Other recent
>> Allwinner SoCs (e.g. TV303) have a PPU with a different set of domains.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  .../power/allwinner,sun20i-d1-ppu.yaml        | 54 +++++++++++++++++++
>>  .../power/allwinner,sun20i-d1-ppu.h           | 10 ++++
>>  2 files changed, 64 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
>>  create mode 100644 include/dt-bindings/power/allwinner,sun20i-d1-ppu.h
>>
>> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
>> new file mode 100644
>> index 000000000000..64c9a9f398a2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
>> @@ -0,0 +1,54 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/allwinner,sun20i-d1-ppu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Allwinner SoCs "PPU" power domain controller
> 
> Drop quotes over "PPU" - it's not some nickname, alias, but acronym.
> Explain the acronym in description.

I don't know what the acronym stands for; it is never spelled out in the
vendor code. I will drop the quotes in v2, but I can't give an explanation.

Regards,
Samuel

