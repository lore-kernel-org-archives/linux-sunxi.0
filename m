Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2092B7C
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jun 2022 01:21:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 8BB173200684;
	Thu, 23 Jun 2022 21:21:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 23 Jun 2022 21:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656033663; x=
	1656120063; bh=LYb6j7SIlDnFbj+QmMZkuQxorY3VRkvFKhRnYpuzTPE=; b=T
	8+o+QBYNreBji0uupyIJE8YwJRA8eajS8pN3R4uWzJhoG1gUEuK9aZvJPjv5wZ9O
	9JpArzityXhgCMsPhi5nsTd3bCmtEImdv/IGwGwzrqORHzVvHwG49sjOSDJyKwTb
	iVHvsSO8KHst98lLSDQsT2THGXkrWvqvwvHD0LeegiF4Pm7T9DO8p9uF+o4vtb7A
	2sb0or3JQPjSWQSlXbyHp2ynaV6c8K8YemsomIZab/wv6tA2uogIFbGQCU8IYaeO
	2gNvKs6tYD0oiEwOvWVVbcI8MLbDmJd/OZLVVi4uwbC0FtVH5Mic4/ITWkUfcFx4
	oyXBKikaKdH2SJch4Ke8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656033663; x=
	1656120063; bh=LYb6j7SIlDnFbj+QmMZkuQxorY3VRkvFKhRnYpuzTPE=; b=H
	tow1zQvqfnU3IOSJHKbmdKTMxCoR+/HgrIg8IF24p2Ot+404ykzl2WSsUzzRuQuY
	0kW7lGyVJUhA0pEDqNouJjYyobuuXBnqhMhxBC5NWkm2onmAAFwSjUgQGCHfPzdm
	+w+srYusZfakpBAjQR+b0zBVJbCH5w0QcYKbf6FHhnnnk/6us8Q2sF7qT5HD7pKp
	CBzzAaUv9N9h9+bAntVSVfSmjSgZyF1WD3wKaiUJzL/rpBHqi8d/cplO+uXmhXXi
	GZ2lC1L5ziFwXlkthF/IbuGfv2AMhXHZSuAgEATqgsNyoaC+Pi0S7la7d66mcLsP
	p7xzN5O8SZwJsqePewYJw==
X-ME-Sender: <xms:fxG1Yuxb0FisTPlJ4lU0Tm2l218Egk8g0cm_6qfgkwMeinAtpAHRhA>
    <xme:fxG1YqRH07DoyyYH_2nO9JUJBJMUMQul1CJd_gvouKuhvhKff6M4kTvmKn2dv1oOw
    wYewsMhgG_RBePQYA>
X-ME-Received: <xmr:fxG1YgUx41YKW1mFOtBPpyBftbYeTodv8AGVr_oR2eVgmzeKwqK2QAKSHf9J9QqLu7cjYsa08S4itcNNIpwiAd8o7rYhUfO5rttfvHBGvqBHc9zlwC_MA-iFjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:fxG1YkjJRejQ6wek2LVTg_caOmzgO4z_sZWtPTCruxlS-9yaECrUEg>
    <xmx:fxG1YgAoMdO90fCL6MUjntcRybgAOlDA_1p25d4nS8sqscZMQZp2xg>
    <xmx:fxG1YlKkxHbCpXBIQF0HMsx8FHjHlu3V-wbSma1gVsNY83m4scO2dQ>
    <xmx:fxG1Yi2U_P8rjxYp2W9utSFtQ7d3zMm3F1wILXkQ-GSRyxkYseNW2w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 21:21:02 -0400 (EDT)
Subject: Re: [PATCH] sunxi: fix initial environment loading without MMC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
References: <20220421003448.4517-1-andre.przywara@arm.com>
 <bed703d6-1820-8df4-747a-6114877dedee@sholland.org>
 <20220426152556.4a3ba3fb@donnerap.cambridge.arm.com>
 <20220624020040.3992190c@slackpad.lan>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <ce039fde-bd88-f484-54d1-b079d82f62a1@sholland.org>
Date: Thu, 23 Jun 2022 20:21:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220624020040.3992190c@slackpad.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andre,

>>> On 4/20/22 7:34 PM, Andre Przywara wrote:  
>>>> Commit e42dad4168fe ("sunxi: use boot source for determining environment
>>>> location") changed our implementation of env_get_location() and enabled
>>>> it for every board, even those without MMC support (like the C.H.I.P.
>>>> boards). However the default fallback location of ENVL_FAT does not cope
>>>> very well without MMC support compiled in, so the board hangs when trying
>>>> to initially load the environment.
>>>>
>>>> Change the default fallback location to be ENVL_FAT only when the FAT
>>>> environment support is enabled, and use ENVL_NOWHERE and ENVL_UBI as
>>>> alternative fallbacks, when those sources are enabled.
>>>>
>>>> This fixes U-Boot loading on the C.H.I.P. boards.
>>>>
>>>> Fixes: e42dad4168fe ("sunxi: use boot source for determining environment location")
>>>> Reported-by: Chris Morgan <macroalpha82@gmail.com>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>> ---
>>>>  board/sunxi/board.c | 9 ++++++++-
>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
>>>> index 89324159d55..befb6076ca6 100644
>>>> --- a/board/sunxi/board.c
>>>> +++ b/board/sunxi/board.c
>>>> @@ -132,7 +132,14 @@ void i2c_init_board(void)
>>>>   */
>>>>  enum env_location env_get_location(enum env_operation op, int prio)
>>>>  {
>>>> -	enum env_location boot_loc = ENVL_FAT;
>>>> +	enum env_location boot_loc;
>>>> +
>>>> +	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
>>>> +		boot_loc = ENVL_NOWHERE;
>>>> +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
>>>> +		boot_loc = ENVL_FAT;
>>>> +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
>>>> +		boot_loc = ENVL_UBI;  
>>>
>>> This could leave boot_loc uninitialized. And there is still an unconditional use
>>> of ENVL_FAT in the BOOT_DEVICE_MMCx case.  
>>
>> Yeah, it's a mess, and there doesn't seem to be a one-fits-all fallback
>> value. Returning ENVL_UNKNOWN when prio is 0 definitely hangs, as does
>> returning some source without having the corresponding driver compiled in,
>> so getting this right *and* nice-looking is a bit tricky.
>>
>>>>  	gd->env_load_prio = prio;  
>>>
>>> I don't think the hook is supposed to change this variable.  
>>
>> Yeah, don't remember why I initially put that in, I must have copied that
>> from somewhere. All I remember is that this code is touchy (as the bug
>> report leading to that patch shows), and there are quite some corner cases
>> to test.
>>
>>> I'm still a bit confused on the fallback logic you have in place. Splitting it
>>> up into three blocks doesn't help. If the goal is to load the environment from
>>> the boot device, while preferring filesystems over raw block devices, I propose
>>> the following:  
>>
>> Admittedly this gets messier, I mainly wanted to fix the regression
>> quickly, since it already broke the release for the CHIP boards.
>> I will have a closer look at your suggestion and check for those corner
>> cases, but will probably go with that instead of piling up more cruft on
>> my previous code ;-)
> 
> So I was about to submit your solution, but this is suffering from the
> same old problem: we must not return ENVL_UNKNOWN on the first call.
> FEL booting triggers this: it will lead to env_init() returning a
> negative error value, which is fatal, as it's part of init_sequence_f[].
> I think the proper fix is to treat this case the same as the -ENOENT
> case at the end of env_init(), but I don't dare to do this generic
> change this late in the cycle.
> My plan is to hack-fix this for sunxi, for now (see below), then
> propose the generic change for the next cycle. Does this sound OK?
> Another solution is to always select ENV_IS_NOWHERE, then return this,
> but I don't know if this has more side effects, so is also risky at
> this point.

Yes, this sounds reasonable to me.

Regards,
Samuel

>>>
>>> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
>>> index 427113534b..27508bd306 100644
>>> --- a/board/sunxi/board.c
>>> +++ b/board/sunxi/board.c
>>> @@ -129,26 +129,38 @@
>>>   * Try to use the environment from the boot source first.
>>>   * For MMC, this means a FAT partition on the boot device (SD or eMMC).
>>>   * If the raw MMC environment is also enabled, this is tried next.
>>> - * SPI flash falls back to FAT (on SD card).
>>>   */
>>>  enum env_location env_get_location(enum env_operation op, int prio)
>>>  {
>>> -	enum env_location boot_loc = ENVL_FAT;
>>> +	if (prio > 1)
>>> +		return ENVL_UNKNOWN;
>>>
>>> -	gd->env_load_prio = prio;
>>> +	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
>>> +		return ENVL_NOWHERE;
>>>
>>>  	switch (sunxi_get_boot_device()) {
>>>  	case BOOT_DEVICE_MMC1:
>>>  	case BOOT_DEVICE_MMC2:
>>> -		boot_loc = ENVL_FAT;
>>> +		if (prio == 0) {
>>> +			if (IS_ENABLED(CONFIG_ENV_IS_IN_EXT4))
>>> +				return ENVL_EXT4;
>>> +			if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
>>> +				return ENVL_FAT;
>>> +		}
>>> +		if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
>>> +			return ENVL_MMC;
>>>  		break;
>>>  	case BOOT_DEVICE_NAND:
>>> +		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
>>> +			return ENVL_UBI;
>>>  		if (IS_ENABLED(CONFIG_ENV_IS_IN_NAND))
>>> -			boot_loc = ENVL_NAND;
>>> +			return ENVL_NAND;
>>>  		break;
>>>  	case BOOT_DEVICE_SPI:
>>> +		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
>>> +			return ENVL_UBI;
>>>  		if (IS_ENABLED(CONFIG_ENV_IS_IN_SPI_FLASH))
>>> -			boot_loc = ENVL_SPI_FLASH;
>>> +			return ENVL_SPI_FLASH;
>>>  		break;
>>>  	case BOOT_DEVICE_BOARD:
>>>  		break;
>>> @@ -156,23 +168,6 @@
>>>  		break;
>>>  	}
>>>
>>> -	/* Always try to access the environment on the boot device first. */
>>> -	if (prio == 0)
>>> -		return boot_loc;
>>> -
>>> -	if (prio == 1) {
>>> -		switch (boot_loc) {
>>> -		case ENVL_SPI_FLASH:
>>> -			return ENVL_FAT;
>>> -		case ENVL_FAT:
>>> -			if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
>>> -				return ENVL_MMC;
>>> -			break;
>>> -		default:
>>> -			break;
>>> -		}
>>> -	}
>>> -
> 
> +	/*
> +	 * If we come here for the first call, we *must* return a valid
> +	 * environment location other than ENVL_UNKNOWN, or the setup sequence
> +	 * in board_f() will silently hang. This is arguably a bug in
> +	 * env_init(), but for now pick one environment for which we know for
> +	 * sure to have a driver for. For all defconfigs this is either FAT
> +	 * or UBI, or NOWHERE, which is already handled above.
> +	 */
> +	if (prio == 0) {
> +		if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
> +			return ENVL_FAT;
> +		if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
> +			return ENVL_UBI;
> +	}
> 
> Cheers,
> Andre
> 
>>>  	return ENVL_UNKNOWN;
>>>  }
>>>
>>>
>>> Regards,
>>> Samuel  
>>
>>
> 

