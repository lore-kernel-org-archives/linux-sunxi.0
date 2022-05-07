Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6BA23
	for <linux-sunxi@lists.linux.dev>; Sat,  7 May 2022 01:47:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 8076F5C01A1;
	Fri,  6 May 2022 21:47:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 06 May 2022 21:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1651888029; x=
	1651974429; bh=mWuq1oNwiQEgaXHazJYvLxTUTHr3yZNHpiA86rxeD0I=; b=M
	spk5acCvdNNln4wlwNChlQ6Q5AVDm7dFy4eSZuexhKp9jTmMDyJ/AVgGA1oDCfmZ
	q8eu+UtlAdavhTu+kqjbC42/QUyODs2EBUf/E2w6Bh+G0MoBBkT5WtY7OdJeXqyT
	8Yeaf80JxheUSFxVfpqtJjf92T4oQdRqO06YrMG+kWjrLnkVf+VmfMnzziVpjoRp
	ANG7y6GCLtS+REdABGJGd+r4lQ4IpcSrTKM+sRaBaeeHAXkshZLQ9B11rsdhhdF3
	Mv8EldYel1EOMvNzpFeuO56lraTlbuwfDAuffotAOYJYy7HuICPZWkPAeIE58L6T
	q3+ZYTe1pPpBoiHG3tiCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651888029; x=1651974429; bh=mWuq1oNwiQEga
	XHazJYvLxTUTHr3yZNHpiA86rxeD0I=; b=vCnG8+T+AC1dNONqDHAbuOOBeRYHR
	MxTCW5HZKXbLJkwiWvmdigCWI1VbMUrJ7qbXMSTfoH/PjtVt0WBpXIimoiyYnBIG
	nn1UBpFYM3BCEmHqGZ7oRv5I4rZbWzJ+33rztJsrDMNPzL5MB8OW+J7OkiRiwLxz
	xBedCzrCcD5NygrMpun0GUWdNDiyir8KPTT88ZDzAul6WwlPtqALsiPUmqeZyzum
	MNDva6R896JDAlnoXGfDkJsHYCCkExwIvsJBOjy743RarNHpB1Vqg30TfeAav3Yc
	l4nxsD/hH7n8LLXHXguJbbIh1JehAhvIlWvJVylSQqbCqG3Ex1sqYnD6A==
X-ME-Sender: <xms:nM91YnxqErDFYnD1P0z8F5ZSgbt_GriU1NlUBVNNxBuBPcHq6Ov9Eg>
    <xme:nM91YvTayH17PDxX7JOs1C5edf__6qy_ai6xgLfxCmhXMjPevpoTGcQPt86WfGcHO
    zxguGxmOuld4YMQTQ>
X-ME-Received: <xmr:nM91YhXKjGseAbUv6-tA_ZKYRY7HaNDdBn19fpKpCMRoCJouRQYTmjxXL5GrBQ-4d2ZUkvPmrS1WF_V7UXg_zmXptWGlaw-DpBkwyZ5DFHsQSlw2UpH0mNNBog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
    heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:nM91YhhVwA7N99IMZamSE4FFufGijRlvEPA1IJWcA1152ouQ3zJRQQ>
    <xmx:nM91YpCPu5K-O6kFasZgsWmao8YERJtnjjOMVSUdOymyfp-YNLl2Hg>
    <xmx:nM91YqIcfrbxldDuxFvjYZhL6vbpSM1RL8eKkODWuRm5BUK778UCKQ>
    <xmx:nc91Ys46y-6gK61_pECR-6AqrAUHnKxkMflITVi0IExdIyDfusQQpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 21:47:08 -0400 (EDT)
Subject: Re: [PATCH 1/2] clk: sunxi: add PIO bus gate clocks
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Lukasz Majewski
 <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220506003301.13194-1-andre.przywara@arm.com>
 <20220506003301.13194-2-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <49a100f1-9bd8-9334-b58e-6288209906bf@sholland.org>
Date: Fri, 6 May 2022 20:47:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220506003301.13194-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/5/22 7:33 PM, Andre Przywara wrote:
> The introduction of the DM pinctrl driver made its probe function enable
> all clocks enumerated in the DT. This includes the "CLK_BUS_PIO" (and
> variations) gate clock, but also CLK_PLL_PERIPH0. So far we didn't

I believe the use of CLK_PLL_PERIPH0 is from the R_CCU driver, so it is not
directly related to the introduction of DM pinctrl.

> describe those clocks in our clock driver.
> As we enable them already in the SPL, the devices happen to work, but
> the clock driver still complains about not finding those clocks:
> =========
> sunxi_set_gate: (CLK#58) unhandled
> =========
> 
> Add the one-liners that are needed to announce the gate bit for those
> clocks, to silence that message on the console.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
