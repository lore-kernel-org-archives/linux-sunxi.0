Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB53523BCE3
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Apr 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865143; cv=none; b=A1KWcDSiFR1T+U92luxRGEQzUMFtQ1GEvsCB/I03K/9If19J0j9w3TeYFih154ipMLkXfCATDwbYaD/eD5E+RrziLnqAdp0c166j1R76avw87uk7jTDGzt8XGRh3xKLc048d3//j8MxWKhvGsOx74l/DK68wsbSl+/sq6sEpHV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865143; c=relaxed/simple;
	bh=7rpgALkRycPSgcaAOgE3Prm0pYeBYUlmAelrxMIZcMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTvk6J9TveDfdpHUE6WktNYquXS6hxQ7nXB/yXrljuLbzk8z87u6/8xcYQZWjhHqw3K+gjIxZ/+7px+Te2UjI3Y+gT3lAA3NPZ5BFOdlsg+sWC7s5KyLE/4PlvgtQbJLfztsOLQPAgs1D18QaHYSlTovo8oa+uJEmBYahibZMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cJX6XLaZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cJX6XLaZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75A61FC4;
	Wed, 22 Apr 2026 06:38:55 -0700 (PDT)
Received: from [10.57.33.69] (unknown [10.57.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EE173F836;
	Wed, 22 Apr 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776865141; bh=7rpgALkRycPSgcaAOgE3Prm0pYeBYUlmAelrxMIZcMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cJX6XLaZ9w4cDlcqe/N6PdfC9Zmxg3eiCrHKrqfZb5e2qMpOmbffF2ER/ReBGBsaO
	 5NspPcgUbyYXsYrEuudf2IubWTqk9tkKDpK3wofmCPbhZmpMvB0V1B84V1aYFDm7B2
	 f2axAPb9yLv6lAJxgakoM4b10yG38GbpsL22pD+w=
Message-ID: <44aab543-a200-49bd-81e5-70d77ebe1c85@arm.com>
Date: Wed, 22 Apr 2026 15:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
 <20260419225539.718367e0@ryzen.lan>
 <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
 <b89c1c8b-2678-4f4f-a63c-03b92cf7617c@arm.com>
 <h4b3xluygfptee3ej4gbr3hctgjk6q4oytkisk66saii4uyvl3@lw4qdtfuyoz5>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <h4b3xluygfptee3ej4gbr3hctgjk6q4oytkisk66saii4uyvl3@lw4qdtfuyoz5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 4/21/26 16:05, Michal Piekos wrote:
> On Mon, Apr 20, 2026 at 04:14:44PM +0200, Andre Przywara wrote:
>> Hi Michal,
>>
>> On 4/20/26 13:27, Michal Piekos wrote:
>>> On Sun, Apr 19, 2026 at 10:55:39PM +0200, Andre Przywara wrote:
>>>> On Sun, 19 Apr 2026 14:46:06 +0200
>>>> Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
>>>>
....

>>>>
>>> I took the table from https://linux-sunxi.org/Linux_mainlining_effort as
>>> a todo list and wanted to help with it. I do not have own use case for
>>> this timer. If it is not needed then I will spin v2 to include your
>>> comments and abandon it.
>>
>> Ah, that's good to know, and thanks for picking things from that list! I
>> don't think there is a particular need to abandon your work, we could as
>> well upstream it. At least the DT changes should be added, so that other DT
>> users could make use of the timers - after all it's a Linux implementation
>> choice to utilise just one timer. But please go ahead and post a complete
>> v2, I don't think it hurts to have HSTIMER support in the kernel.
>> And while you are at it: can you figure out what the need is for using two
>> timers? One is a clock source, the other is for clock events? And why do we
>> limit the counters and timers to 32 bit? Even the A13 manual lists them as
>> 56 bits, and a wraparound time of roughly 21 seconds (with 32 bit counters)
>> does not sound very long to me.
>>
> Yes. Channel 0 is clockevent and channel 1 is a clocksource and sync
> reference for channel 0 disable timing.
> 
> 32 bit counters seems like implementation choice rather than limitation
> but that would need to be implemented and tested. Would you suggest to
> extend it to 56 bit in the following patch?

Well, yes, I would assume we want as long an overflow period as 
possible. The tricky/interesting part is that the interface is still 
32-bit MMIO reads, so we need to find out how the consistency works. The 
manual recommends to read LO first, but not sure that means its latching 
HI upon the LO read. Otherwise we should read HI, LO, and HI again and 
compare both HI's. Probably needs some testing.

>> Not sure what your primary motivation for fixing Allwinner support is, but
>> we could probably find more worthwhile targets. Do you have Allwinner boards
>> other than the OrangePi Zero 3? There are not many low hanging fruits on the
>> H616 left (MBUS and LDOs(?) maybe), but the A523 has quite some missing
>> drivers still, some of them probably more on the easy side.
>>
> I have boards with A733, A527, T113-S3, H616, H6, H3 and I
> think some older stuff too. My motivation is mostly fun and learning.

That's great, and what I was hoping for! ;-)
Feel free to reach out on IRC if you have any questions or comments.

> I also use those boards in custom projects.
> 
> I will take up GPADC on A527 after finishing this as I worked with ADC's
> a lot on MCU's. Unless other suggestions?

Yes, LRADC and GPADC are good devices to start with. Also crypto comes 
to mind, the most useful there being the TRNG device, which helps the 
kernel to start its own RNG much quicker. Chances are those things are 
close to the existing SoCs, so there might be not too much to do here.

Cheers,
Andre

> 
> Thank you for comments.
> Michal
> 
>> If you are stuck with the OpiZero3, then you could just look and check the
>> existing devices, and verify their operation. For instance I think USB-OTG
>> is still broken - across most Allwinner SoCs actually, so it's a sunxi
>> driver issue.
>>
>> Thanks,
>> Andre
>>
>>>
>>> Michal
>>>
>>>>>
>>>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>>>> ---
>>>>> Michal Piekos (4):
>>>>>         dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
>>>>>         clocksource/drivers/sun5i: add H616 hstimer support
>>>>>         arm64: dts: allwinner: h616: add hstimer node
>>>>>         arm: dts: allwinner: t113s: add hstimer node
>>>>>
>>>>>    .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
>>>>>    arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
>>>>>    arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
>>>>>    drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
>>>>>    4 files changed, 78 insertions(+), 7 deletions(-)
>>>>> ---
>>>>> base-commit: faeab166167f5787719eb8683661fd41a3bb1514
>>>>> change-id: 20260413-h616-t113s-hstimer-62939948f91c
>>>>>
>>>>> Best regards,
>>>>
>>>>
>>
>>

