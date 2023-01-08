Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6121859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:39:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 9780E32000D9;
	Sun,  8 Jan 2023 15:39:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 08 Jan 2023 15:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673210343; x=
	1673296743; bh=MrpaI/j78RW6bqIMECdS4MM0I9za5Sk9lTNUgyX/4gQ=; b=m
	scClmhGf8oXC3wtbFW++6dhh4Fi25ex2P364r3sXPhGNcvKcMY64gEAxmFxXzknN
	gZPm/UEngpd4/v0Ut4wosUxrt/fkBVtZMBxPAsi/9fg+Pe/+lABtFxQhQxPHmOiE
	+xlVgQCxRi1OcoiH7QA/8U9Ecgjekjbt/OoL4JArnBvQznuKyJKETWbV0I95k0LY
	AAdzF/NpumXbTPzE3UjEHbh+/Cntn434BFgrxipJ3LprpHNyLur77TEnxtrfTMZ8
	4XkFKpAQsb/lAyEbf1uG1edtDRBQxDsWRh6tXD1vSMNhlnsuf1yblTwA6LLOmIf4
	uR26yjyw99UWdV9iNP9Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673210343; x=
	1673296743; bh=MrpaI/j78RW6bqIMECdS4MM0I9za5Sk9lTNUgyX/4gQ=; b=M
	47cQH429Ay/PlZepydKOriRIls1qN/GpbOTp6iMgMIGvLCd6kmHK+I08GCeLZ/bR
	J0yQ2t6QChD7NFMCPRYc4CmYKamii4ydHVW8hG0CZx33iD2Ja8ImZSxTQFGDEoSR
	g1Wgb1ivvMoOw5TDA1d+1EUty2p4WKIHN7LusKxtp0HUlrRBi3XJPxlO3j16mO4q
	aHF68dExH+fiyUnEL4jObLMl2L+VhCq8Zuq4kXmZnb4y0ETwRuu+ERZuys9iVwgO
	jlrIjI14pbte1OXtnxjeFpbxuZsxdkccTxDswMab1yVOhLXdet2sUfQH823Jia+y
	MXOw3wjf9TOUrx7BaAgMA==
X-ME-Sender: <xms:5im7YxxD59JJJ7GZf1Cus9uW4aqrLX6NIXFNMg4nsvsQ4UUP33CaJw>
    <xme:5im7YxTXiAC3WWwUyS-YxTO7O9Itpf2XcOOT5gOHANhlUWzGG4jrUqjET6-EdwhiD
    38k0fOsaiN9P5F2oA>
X-ME-Received: <xmr:5im7Y7XjT8F5LmoACMXT372wF3Qxt2_GvaAR9NEv3Jdxn8uo07y_ly9g6qFCnfujZeKiP0_05cBrf2WnJ86U10VwsGcgLHDJc8TOX-SJr2y89Ay5pk0JEQhTJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5im7Yzj-VzsttrRL0mZdlS7gPPFFt0GBvRNOLoW4vDXxy6FZ0XfWTg>
    <xmx:5im7YzBSwXoL30GzwBtg1NzljUs5riLmky9bC1oJDea0midaZwFjeQ>
    <xmx:5im7Y8K6TdlWAoz2o8_3b5nEpytSI2VRj9oaAfm0cJuCvwPE8ViTzA>
    <xmx:5ym7Y6P2tav2iKggNyqJhQbwy1SCYwj96nR-bTm0ppYxQmaegJYQoA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 15:39:02 -0500 (EST)
Message-ID: <ec4156cd-6203-3055-75cb-642eca2eb50e@sholland.org>
Date: Sun, 8 Jan 2023 14:39:01 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 u-boot@lists.denx.de
References: <20220713152758.56929-1-andre.przywara@arm.com>
 <20220713152758.56929-2-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/3] sunxi: armv8: fel: load only 32-bit values
In-Reply-To: <20220713152758.56929-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/22 10:27, Andre Przywara wrote:
> Both the values and the MMIO addresses that we need during the 64-bit FEL
> restore are smaller than 2^32, so we don't need to do any 64-bit loads.
> 
> Change the loads to only load 32 bits worth of data, that saves us some
> bytes for storing the values.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/cpu/armv8/fel_utils.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

