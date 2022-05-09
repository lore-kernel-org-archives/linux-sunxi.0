Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFC7E
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 05:00:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 74C005C0086;
	Mon,  9 May 2022 01:00:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 09 May 2022 01:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1652072435; x=
	1652158835; bh=w2rmC1hjHM8r1mh2KxJX+ug2JAtTNU3IJXjDfwjF7gU=; b=f
	saVkwylG2jaDWlcjgTTogMGiltLAk4x6+qsCrN4HUlYFOQGxMu1LlUofzNOiGrQv
	3BdVXyBaCFz/I6T68hsNw3jz45i218+I5B7zBw24fO6IGFXg5nBlNIbrbxQpDGsq
	xAq0jFlzfpPlT6F5XBNAy3pHmeWHUIZqdmI/jiK0/KpcgiQhlelPC5HoYu5xwnUa
	FLWKk0V1jU17ywMBtJqqNP9l2wiqy31vRJ4uMJEDfiyG2xoa0G1CCl1ykxRMdqMo
	IUwdTdrrCUpnhnKHuAZXHC6PSlzjMvc+VeCf0zaQ3xA41Vce6nY1CoF9/bV29y7f
	EB8LXiKrCH68blhL94xvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652072435; x=1652158835; bh=w2rmC1hjHM8r1
	mh2KxJX+ug2JAtTNU3IJXjDfwjF7gU=; b=byRrWEWm0FiloVeYCGCa/uHLrA/Bc
	ZkYe5ua9CPzoI4KP5mN9KV4zJk4vKo8GMjzOWXhohkM7m+awu4V9tsura8sOk2SO
	B0ll0/TMzAlrM+/+ii4wR1wipbS4AA7DBETtKodHRnFLe1ZZkeMeRft60dI8JGFg
	U5zZdPJdMpwGsFAPfXQX+SOvhHvtGr3qolavA/99saXAd6zAXX5bFfZe556W2STt
	Rw1dPLBEbGaSrJi056cOcn86/GATYah6ImfkhoERbM9jTkK4Lky6NwDXTTls56LV
	V+9jttAaWE7xV9oPg2I3/vjrUSeURW5TRAwrTXDx45J/2Fs40gIpnQ6Lg==
X-ME-Sender: <xms:8594Yjh12lQnpd-TJk-A1Ad8ZDNUN-AySewBixvkVUGQxeX_ozFGtw>
    <xme:8594YgBV6k0hkjy8J8BYMV7fp9w9ea2aBNWm1m3y8hLjBOZrqZxZ7t9dDTjWEEWsj
    N_yJhhqOu0vnXmQ6A>
X-ME-Received: <xmr:8594YjGJhAgmetNyGTfzkgTLvg1Ky0GOSDzpMA1IqhrrJw83_2xRNG3JxJsgruiGS_ylA6p0G86Unq-0gJMo882-a8B_OYLm8NeUqhZ-o-KlvHg566hkPKyOnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
    heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:8594YgTcv-8B6j6jbwyWSesOfifIzulG_gCPlnVsMDPAQI82bF8dBA>
    <xmx:8594YgwKUPxosv88_RyYC4Sw5jZmJmYWiWrmnCp4am-guoOqxzYOlg>
    <xmx:8594Ym6rEYPR7yxt2jajuTwoDPGucHsnIHZwrsQVxgm5JnNJFF-QgQ>
    <xmx:8594YvrN88AJM9WaM-z2xQetqb7L_uwDSos_Ilu-xH-Pw_1N7Fn5sw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 May 2022 01:00:34 -0400 (EDT)
Subject: Re: [PATCH 2/2] clk: sunxi: add and use dummy gate clocks
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Lukasz Majewski
 <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220506003301.13194-1-andre.przywara@arm.com>
 <20220506003301.13194-3-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <165bd1d2-0cc2-44a6-4190-969bc912a6cc@sholland.org>
Date: Mon, 9 May 2022 00:00:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220506003301.13194-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/5/22 7:33 PM, Andre Przywara wrote:
> Some devices enumerate various clocks in their DT, and many drivers
> just blanketly try to enable all of them. This creates problems
> since we only model a few gate clocks, and the clock driver outputs
> a warning when a clock is not described:
> =========
> sunxi_set_gate: (CLK#3) unhandled
> =========
> 
> Some clocks don't have an enable bit, or are already enabled in a
> different way, so we might want to just ignore them.
> 
> Add a CCU_CLK_F_DUMMY_GATE flag that indicates that case, and define
> a GATE_DUMMY macro that can be used in the clock description array.
> Define a few clocks, used by some pinctrl devices, that way to suppress
> the runtime warnings.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
