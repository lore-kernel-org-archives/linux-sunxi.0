Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55FA3BBEF
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Aug 2024 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810388; cv=none; b=YWhEkwgaH3qGJP2v6xEAVHP/dJpEoC0DP4LzdfpPbBC7a49NFYvhQhKeOz46UKGXKB4XNtBRfurljbyqyjvOvwn/fqmUM9SGlMos8+XRYzh32/QOozvfTYuNiY2ypLPBRNN4kltsHCTOhEn5XZ9FQ5jVEM/RRpzpmAUg7HTKd/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810388; c=relaxed/simple;
	bh=Gg2vQKuB/Pbzfy0/GRmc1n+rgSrmCiN2oAY2N84Th/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=If5rIvtBqsyTmEYRYhlsXhLCqAx4Unn4myqiRqRa1rsFIN1wGwpfLyAVGAb52oyNIc8cs0x/39WoLHJLCRQML87zQtSGMJMa0QYriTpjmTx3A3+8FGfDwb0rlQSPczxFY/57lGNEui11EdHEif0DVgxZA8chjbTHYb1AW2FO3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WtnXt08GxzQqnm;
	Wed, 28 Aug 2024 09:54:54 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 61F2118007C;
	Wed, 28 Aug 2024 09:59:43 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Aug 2024 09:59:42 +0800
Message-ID: <9591c058-709a-b562-c1f4-5a82389291d3@huawei.com>
Date: Wed, 28 Aug 2024 09:59:41 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 1/7] net: stmmac: dwmac-sun8i: Use
 for_each_child_of_node_scoped() and __free()
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
CC: <woojung.huh@microchip.com>, <f.fainelli@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <alsi@bang-olufsen.dk>,
	<justin.chen@broadcom.com>, <sebastian.hesselbarth@gmail.com>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<ansuelsmth@gmail.com>, <UNGLinuxDriver@microchip.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
References: <20240827075219.3793198-1-ruanjinjie@huawei.com>
 <20240827075219.3793198-2-ruanjinjie@huawei.com>
 <804da030-ff7e-4bf2-84f8-2784fc93e9e8@lunn.ch>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <804da030-ff7e-4bf2-84f8-2784fc93e9e8@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/27 20:52, Andrew Lunn wrote:
> On Tue, Aug 27, 2024 at 03:52:13PM +0800, Jinjie Ruan wrote:
>> Avoid need to manually handle of_node_put() by using
>> for_each_child_of_node_scoped() and __free(), which can simplfy code.
> 
> Please could you split this in two. for_each_child_of_node_scoped() is
> fine, it solves a common bug, forgetting to do a node_put() on a early
> exit from the loop.

ok, that is nice.

> 
> I personally find __free() ugly, and would prefer to reject those
> changes.
> 
> 	Andrew
> 
