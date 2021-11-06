Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA052C9A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:12:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2283B5C00DE;
	Fri,  5 Nov 2021 23:12:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 05 Nov 2021 23:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=/
	gPzTh9lKbeVX2G13aezYcHtepoPYGfdF+e0XmPiia4=; b=DCnhGfzndZrH7KnBI
	X7LvUs91uBCXzwZ1CIRsIUUMFtcPFd5OTnTQLnVS9DhG4cBPV4NqtWUQtuBB0iq4
	+HGCokngz+An4rq9+AScXSFw3qPIqQhkJx92Cnj5cqEgGsTNcCQ59hEQrb9GnjzY
	aiflEB3WHN88nB49hRkhpiDjHNFdc8oXg0ECE95gH9c8NRp0bImXNLLI8IUGKpNO
	w39xtrH0SMSp/i3FrzJRBqsbOQcPBFf8Er9m3IAZePq2mq76a3W4DQU9vKvwn84Z
	ubMfAcZZLT2RiiUbFu+pn1R/ju80Vbd1WN/0RzqPoBx+l+eodBmtFDGYEDlDqF7D
	Qr3Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=/gPzTh9lKbeVX2G13aezYcHtepoPYGfdF+e0XmPii
	a4=; b=dKX96TTdAE93kdfNj1uSztHPzBsjDVDA6S7d2Ya+eJwyNwVQoNz3IUFH1
	9CASM6FVph6bEb/yvBaqyQD3Wh68lSdAIuMfvnMzOOxyIyUW9SASevLHbPZixNav
	k9+RSjuxwvdnjDSkAUbVJ/883SA5JDh1S4dN8lNqO8QlHIkrikjzzjtC2y8F2FX1
	J3/XecjoM6LLroDgHTZczAwDGJRvczzLQCTzZ69qlys1kuJ0z9gM9FEUiK53B1f1
	dSarC8P0pdCjvdNgvS2Qa9o86TQ5VX7oFCTh94YfnhrOWfK17emrfaIQLp8zH0GS
	0/aehLRFZLKMvYtwLBRokw6Z8dx8Q==
X-ME-Sender: <xms:jPKFYQsDMK_BCR3RI7l4mjJlqMRduMfu5Nf6_5HYYSjBgWd6SgO6MQ>
    <xme:jPKFYddJR1pDpfepC8xIsXvC6EnK6K6E_ouHddpFZ6Ide4trH538kLGJwa-F3fO1V
    AYAqrN2TwAe8eGvNA>
X-ME-Received: <xmr:jPKFYbzyRfjVHAs5OKEoMVBrXLhUa5UYQVQldAg7Hcf1p_RxT-pAyFwl3Vl4ZZqMNy62gKVmkR4U2hlgB2GeGZzLrD6dTLE1GXlgSA0voG8S4GMvemccypsvpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:jfKFYTOuEKAS980hG9HdNqd-91wau9cTqFnGsiwzhUTvmAEsNasIGA>
    <xmx:jfKFYQ_C4zD7LLXFsN1I2BXWIJ8pW-tpvwM7zIdJhMg5ZWIMAWMfKQ>
    <xmx:jfKFYbW2DdpdAm7bwfKRWfKfjUN8H1c6MbErQxn4dzvMUNPrfTsF9w>
    <xmx:jfKFYfZdEFnYIlyKf2kwIvhmdQAOiqtbGEot_zCE6nVUzbeGURrOSA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:12:12 -0400 (EDT)
Subject: Re: [RFC PATCH 12/13] sunxi: sync R329 DTs from internal WIP kernel
 tree
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-13-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <74ccb4ff-7eb9-e6da-48a7-ed728697a157@sholland.org>
Date: Fri, 5 Nov 2021 22:12:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-13-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  arch/arm/dts/Makefile                      |   2 +
>  arch/arm/dts/sun50i-r329-maix-iia-dock.dts |  36 ++++
>  arch/arm/dts/sun50i-r329-maix-iia.dtsi     |  45 +++++
>  arch/arm/dts/sun50i-r329.dtsi              | 225 +++++++++++++++++++++
>  4 files changed, 308 insertions(+)
>  create mode 100644 arch/arm/dts/sun50i-r329-maix-iia-dock.dts
>  create mode 100644 arch/arm/dts/sun50i-r329-maix-iia.dtsi
>  create mode 100644 arch/arm/dts/sun50i-r329.dtsi

One thing to note when you rebase: you will need to add the watchdog
node for rebooting to work.

Regards,
Samuel
