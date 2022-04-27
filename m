Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4413D60
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 17:35:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id DDB34320083A;
	Wed, 27 Apr 2022 13:35:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 27 Apr 2022 13:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1651080908; x=
	1651167308; bh=t1FY6u46eLL6+Sd8qTZkwZAkzR/S6at6dPU4PPYvYJY=; b=w
	rPATU8FaMr8NQ5OtpfewkUqiHgWUUUf/d+Zs6jVGXz9OGEqCqqTRIkcvClK6y3tb
	6kj3s2xNXGqfHSqAzAUEsO87UAZhu8mm8CQ7L1Q5tYBmCiU2VOATbvAmJAgZUmoD
	y2iZJ2SC7mPuxEzMpg6A3WlyUAff/vcg/e+HM2KS/OwcRARFi53MUR3oRrChFZ6K
	lijX0ksekDdzFG7srwSS9iNm1KZ2JYB4LqcWAJAIB5SFZfyBu+DYSrq2yFRUwhKJ
	5L9n3FAqMZKzbePQ3tKD69/XNXA6Vgkfc7WnEhPl5pxd8uwZc/biz5wXe/oy80ii
	NlBvNSDFFzeCDm6PJ+knw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651080908; x=1651167308; bh=t1FY6u46eLL6+
	Sd8qTZkwZAkzR/S6at6dPU4PPYvYJY=; b=CVCrHCgsIa7PEasgE1JKsb+HJudlU
	9Rh6cm7veYP1KN3bYhcc9MeZNJMmgjhSOqJq8Zl22iY3A7xgxKG379MNLQJk4iMG
	Mo0mNeJZlwaGs7A+LGpPi+mHlpHMKD3nCYthf+EA7N6sFgu5rczOdI1UG+gRFwT7
	InqV8Vn3MCeG/WbOl++NH3tX+DGkfEvYpFZ6Am6C1/uxjh2N988+yDc2sT37gf+9
	KqT3DLRdzbJtikd1Dq3VaCqh/On5SpaKSKH6czVjL2BgKo+gZD+LUm9Bc6LtgQCL
	AMvDJ+Fq979xiryAETyelpMqyswnsFwu3HFVYIBRAKAjCa8bj8qavfjZQ==
X-ME-Sender: <xms:y35pYgPFIA7PcGqvAemF6SCigE2GxUmIMiHVh-fuUSTboer-IPrkKQ>
    <xme:y35pYm-wrvV5UhPtrFVgKlEv3lMmn9bG7C3_JOori_g4ayAk7Ot5ILGIlAo82q0_L
    tVyXN3sQdg8jcwWCw>
X-ME-Received: <xmr:y35pYnQxmW0vb8k_d-LKav5knpzi1wWFEQZGhpx8M1GmzMvqG9KeePsZke2mPEqrVvT18pCzGbI6gC7ZKogA8niImTia0ra5w6gQ-L4o3wlyQcCEAI9L9Neijw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:y35pYouye8D2HLYaQ4HXNT-Zq-2lbcJ4lyGhXSP4HwGxQ4JuHFijLQ>
    <xmx:y35pYoere3UJ9WG9O64C7c5VqmTZHc-DQJSwCZJ6oJgkhZt_5pH-PQ>
    <xmx:y35pYs3uHdUVbSVQlFd8jB-oz5Zr_5XYEuogJOKXozC3L2tZPhvhEg>
    <xmx:zH5pYn4m43sn_eEeyE817o9HEELUKc0_PvBlJ5C42Pb5u-WuEULCrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 13:35:07 -0400 (EDT)
Subject: Re: [PATCH] arm64: dts: allwinner: teres-i: Add GPIO port regulators
To: Harald Geyer <harald@ccbib.org>
Cc: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Torsten Duwe <duwe@suse.de>
References: <20220415165605.28560-1-harald@ccbib.org>
 <336f8b96-6eee-16a5-e896-e90c4020f740@sholland.org>
 <462969fd722eec45aa5f142de48b7fbd@ccbib.org> <5259899.Sb9uPGUboI@kista>
 <71e61e41-712f-3f5d-74d6-46b01d672e7b@sholland.org>
 <ff40845f16a7d316fd128b3045b10092@ccbib.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b21aab1f-e48e-5044-b963-02f3a4b3d9da@sholland.org>
Date: Wed, 27 Apr 2022 12:35:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ff40845f16a7d316fd128b3045b10092@ccbib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/26/22 9:21 AM, Harald Geyer wrote:
>>>> PD, PE and PL have dedicated regulators, that can be matched via the 
>>>> 'regulator-name' property. I didn't want to specify the same 
>>>> information in two places.
>>>
>>> "regulator-name" is only a label, while phandle is actual regulator reference
>>> that can be used by the driver.
> 
> That is clearly not the whole story, as the driver find's the supply
> for the PD bank just fine. And this even isn't an always-on regulator.
> 
> See the attached dmesg logs.

You are right, the Linux function regulator_dev_lookup() falls back to matching
by regulator name if no property exists in the devicetree. But again this is a
Linux-ism that we would rather not rely on.

>>>> For the PF supply, I couldn't find any connection information in the 
>>>> board schematic. I could have added a dummy regulator. But since there 
>>>> is only one warning about pf-supply during driver initialization and
>>>> not the dozens of warnings I see about PC and PG, I figured, I'd rather
>>>> not add information of dubious use or qualiy.
>>>
>>> You mean PE right? There is no PF supply on A64.
> 
> I meant PF, but you are right, that this doesn't have a supply on A64
> at all. However the driver doesn't seem to know this: It emits a
> warning about missing PF supply at startup.
> 
>>> Anyway, if it's not on schematic, it can be assumed unconnected and thus
>>> you shouldn't define that property. Messages like "using dummy regulator"
>>> are fine in such cases .
>>
>> All of the ports without a separate VCC-Px input are powered by
>> VCC-IO, which in this case is supplied from DCDC1.
> 
> So should I add "vcc-pf-supply = <&reg_dcdc1>;" even though the chip
> actually doesn't support a dedicated vcc-pf-supply or should I just
> ignore this?

Yes, you should add this property. The supplies are a bit more abstract than you
are expecting. Each of these pin banks (unless it is totally unused) has to get
power from _somewhere_, and that "somewhere" is the supply that should be
referenced.

There is no need for the supply to be a dedicated pin, or for the supply name to
match any pin or regulator name. For example, the LRADC needs a reference
voltage for its comparator, so it has a "vref-supply" property. But there is no
"VREF" pin. The LRADC's reference voltage is one of several things internally
connected to the SoC's "AVCC" pin.

So here, vcc-pf-supply just means abstractly "the voltage supply for Port F".

The fact that sometimes there also happens to be a pin named VCC-Px is the
result of not coming up with a second name for something that has a perfectly
good name already.

Regards,
Samuel
