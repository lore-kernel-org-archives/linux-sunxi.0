Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478173E49EE
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624397; cv=none; b=Sd7RlR3pdxYE8cLEL14XsXKZ1UXAsX+9PS9TqFJb3ZsO7xjIQJzG8xwocv0SN8SwUGAqpkO6aRUuGfvgBBR4vuBUrz1kibzezTDYO+AuV9yGfMXcQqy/8GUwG5U4xZZ5P4EKPesiwfFLXn5hnptw2cpiZOsxCBNUvEfw9HwvDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624397; c=relaxed/simple;
	bh=wYiskiVpPHkqGpXdzCE9ilweKg2KRA5SMT0ofp0eC+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfdx272WvbIDTk+KJKutFPlQbk01/CAe8VVSr9vYMS9aS4t6B9hz2jSFdMLxTNSPbCTu2wS+N/Dk9ED64d8K4UuUWsbN3pEyuzzFerTGILgXdTb9eK54qvzVPttc6QsPUBHNUXBn5BM1yCfUlQAqQaQ1Z12QBSlkdzoI3YTD+AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QS9BflcB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QS9BflcB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C3B31596;
	Thu, 13 Aug 2026 05:33:09 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93DE83F632;
	Thu, 13 Aug 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786624393; bh=wYiskiVpPHkqGpXdzCE9ilweKg2KRA5SMT0ofp0eC+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QS9BflcBYHyjjteMEGTsMTcTkPxJrzWu1heAqjg9AEEbN4QtRX9Q4QjVysf/86xBk
	 Bu82MfaEhNcRkU/ZPQfX662DMSwp+YcetHIG4e27y8CPy3B+TUe1CgC8AjChf1AajW
	 VBk5xT00tkuvB9JXQr/B7DPnmvxhFh9ATx4Ljm3I=
Message-ID: <6f70366a-227a-49e2-85d7-186bf47077e5@arm.com>
Date: Thu, 13 Aug 2026 14:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock
 after SIDDQ setup
To: Xu Rao <raoxu@uniontech.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-sunxi@lists.linux.dev, marco.crivellari@suse.com,
 neil.armstrong@linaro.org, samuel@sholland.org, vkoul@kernel.org,
 wens@kernel.org
References: <d8042dd2-303e-4f24-b7bf-74ae080f4ae6@arm.com>
 <8976A02CE2417DF2+20260707032106.985208-1-raoxu@uniontech.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <8976A02CE2417DF2+20260707032106.985208-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/7/26 05:21, Xu Rao wrote:
> Hi Andre,
> 
>>> - clk_disable_unprepare(phy->clk2);
>>> + clk_disable_unprepare(phy2->clk2);
>>
>> Interesting, this looks about right, and matches the comment above,
>> noting that phy2->clk2 is just temporarily needed. I don't remember
>> further details, only that this workaround was quite annoying and messy ;-)

I checked it again, and indeed we need this clock to access the PMU for 
PHY2, otherwise those PMU registers are RAZ/WI. Interestingly this only 
applies to PHY2, the other PHY's PMU area can be accessed without any 
extra clocks. And also this extra clock is actually CLK_BUS_EHCI2, so 
it's already enabled by the EHCI driver (if this port is enabled).

>> However I am wondering how this worked so far: This should sabotage the
>> access to the local REG_HCI_PHY_CTL access in the next few lines ...
>> Any idea why this worked nevertheless?
> 
> Yes, the current code is wrong, but the visible effect is limited.
> 
> In sun4i_usb_phy_init(), the auxiliary SIDDQ path explicitly enables
> phy2->clk2 and then accesses phy2->pmu + REG_HCI_PHY_CTL. So the clock
> that has to be disabled at the end of that block is phy2->clk2.
> 
> The current code disables phy->clk2 instead, which is a different object.
> That does not undo the temporary phy2->clk2 enable.
> 
> The reason this has not shown up as an obvious functional failure is that
> phy->clk2 is an optional PMU clock. On systems where the non-PHY2 PMU
> clock is not provided, the wrong clk_disable_unprepare(phy->clk2) does
> not actually disable a local PMU clock.

To be more precise: it's only PHY2 on the H616 that has this "clk2", for 
everyone else it's NULL and so any clock operations are NOPs. That's why 
disabling clk2 of PHY0, PHY1, or PHY3 does not do anything at all.

> In that case, the practical
> visible issue is simply that the temporary phy2->clk2 enable is not
> matched by a corresponding disable.

Yes, it purely a leak of this clock that's happening here. That explains 
why it worked before, and makes the fix good to go:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Can you add a sentence with the explanation of why disabling the wrong 
clock did not do any harm? Like: "No other PHY uses a clk2 clock, so the 
pointer was NULL, and disabling the wrong clock did nothing."

Cheers,
Andre.




> So the failure is not that the following local REG_HCI_PHY_CTL access is
> known to break today. The concrete bug is that the auxiliary path enables
> one clock and disables another one.
> 
> Thanks,
> Xu Rao

