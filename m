Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA37F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 02:01:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 895B132009A9;
	Mon,  2 May 2022 22:01:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 02 May 2022 22:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1651543289; x=
	1651629689; bh=yjxP6Q0jgbCd7Myxdtqjvlzx2TRr1TszmNbYWxxKkpU=; b=q
	TkezOlALHJg3LHD8QvqyLBOjqYQEkrCFDbvdyTk9+qtLF6ISvblU5wq4CWgKFX35
	c4fTb1jrTuTxxuGXfRnLXDCLcUjGWSJJuHjVlF2jiPw4wx/ihddLkHK/Hc/X/GBq
	X+TCyCSg1nb3QcOO8z69Hh7JPpHm4lvkoLiZvilFhq56/NyDQ7zlZiXtdu6SWKKC
	S38NeN8+WpClcbZaVhPSbmHsre9rt5blyZMsMaqZO1/+miG3ePQOx9DlSv+Xjy1v
	Zt7O6JSdXYW/x5TmI84IZAF64b4cryr4hF+n7NcMeWI4YxPQZdAn6a0+m0BsR6eP
	PQtzY7NTrDHls2lDe+NSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651543289; x=1651629689; bh=yjxP6Q0jgbCd7
	Myxdtqjvlzx2TRr1TszmNbYWxxKkpU=; b=ymhNiSQesxl1S9F1CE1vQgpg76QZZ
	Ct6hrVZCYuWc3VSf6KGGJ29V0FfiLs3s5oVeoBHGXBrz12mKlc2UuQnrK8Y7+8eJ
	7r03ylRtdHDynV/HkoFC8LUBFEP4hgUA4jIisRsQFyiSPCEwIECe5ah8RGKb7IgF
	T9r5qjdghYcLnTEB1uD25nIJBuNjpNnUwBs5W5jEL9bnHO2wabtcFykXgPcWgQms
	0B5ep+Y9wNh6x3mKrjUSpXTzNYtp/zPu44YgA92zzRDKDA17d/l4jp70xw0AS8eN
	kCxyNs49dAoiqEaVMNNh3v57Ihr6TVBHAUf32ARczgWB3v3njeIxYDB4g==
X-ME-Sender: <xms:-IxwYmeDAspTsKkfchF5_7h6SWBacwqw2_z7-ubELPZA13HP1AUd8w>
    <xme:-IxwYgOZCgIi0baSy9cpr5RsY3-EvMHFOOAejgwF7iJQmnWI4ahyYCNPThSHCy4_7
    tQcNfDSortwU0f36w>
X-ME-Received: <xmr:-IxwYngwIAQ9vu3j4MJx5eKFU7-L-SELxHB8ROU_EaaZ9aCW4ackVegO9G_bpMZF3uB8cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
    heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-IxwYj_fw7BINwgJUCGkkq4NnVSG_9lSL4DREE4J5SNh_QuCTNAFBQ>
    <xmx:-IxwYitsUOpGPwHqXgP83vGR7eeONxw5LMIGfzlJZ155YOwS1dJlVA>
    <xmx:-IxwYqFM94ccdNpBQkQS3TyiKZxXeu8MyZNIbrkFa_K9d14x7U-rfg>
    <xmx:-YxwYkI2zaNCNBLuG5_ZNbpRfKH0bz-iifcaf7J7_w5Wcq1YBZIWsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 May 2022 22:01:28 -0400 (EDT)
Subject: Re: [PATCHv2] arm64: dts: allwinner: teres-i: Add GPIO port
 regulators
To: Harald Geyer <harald@ccbib.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Torsten Duwe <duwe@suse.de>
References: <20220430191009.73946-1-harald@ccbib.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <ff554e7a-b408-74b0-e4dc-94f244e0b56c@sholland.org>
Date: Mon, 2 May 2022 21:01:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220430191009.73946-1-harald@ccbib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/30/22 2:10 PM, Harald Geyer wrote:
> Allwinner A64 SoC has separate supplies for PC, PD, PE, PG and PL.
> 
> Signed-off-by: Harald Geyer <harald@ccbib.org>

Reviewed-by: Samuel Holland <samuel@sholland.org>
