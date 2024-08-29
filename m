Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8B6171BB
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Aug 2024 02:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724899584; cv=none; b=cF6FP5dlA7kFj0/Ex5Z2m1HWUTgAKqOlqpq+GM6LxPeEZDzXLt776iz7kT+clACReToFAm0QbewRKIISRkgmPs49vkDhQ5PyZZUzvfqWfhwVitdMe/RCuXdA4Qkb4cJ01Hb0he2VOqBzGbLglPp9CWVSqd10p2mHN9LZdqfXhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724899584; c=relaxed/simple;
	bh=PSOJy8XFAwIQYiIo+WbIeFtJHCtBfiNt9ppspedr6bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X1ym40uGXXKNMm1opfseXqGIWa/IFY9sFHECWPIYC/L/i8vvXelkgyMt3hnYtT47IqLVIQJ9uGXxHLylzntLFT1JaGPlW46inbygCey+Jxrs2USDVEk93Oj2LZwfG8rRneh6Pt4fMMTK2DhooYncwLW6TnXI9mL7sAr8cOW+GVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WvQcp3pHfzyQWq;
	Thu, 29 Aug 2024 10:45:30 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id D33D4180AE6;
	Thu, 29 Aug 2024 10:46:19 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Aug 2024 10:46:18 +0800
Message-ID: <373de0af-8aa1-263b-eb5a-3dfdd1fa19fd@huawei.com>
Date: Thu, 29 Aug 2024 10:46:17 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH net-next v2 05/13] net: phy: Fix missing of_node_put() for
 leds
Content-Language: en-US
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	<woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
	<alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
	<sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-6-ruanjinjie@huawei.com>
 <66cf4618f313_34a7b1294bb@willemb.c.googlers.com.notmuch>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <66cf4618f313_34a7b1294bb@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/28 23:45, Willem de Bruijn wrote:
> Jinjie Ruan wrote:
>> The call of of_get_child_by_name() will cause refcount incremented
>> for leds, if it succeeds, it should call of_node_put() to decrease
>> it, fix it.
>>
>> Fixes: 01e5b728e9e4 ("net: phy: Add a binding for PHY LEDs")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Fixes should go to net. Should not be part of this series?

Thank you! I will separate it out.
