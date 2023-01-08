Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6611859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:49:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 08EAD32002E2;
	Sun,  8 Jan 2023 15:49:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 08 Jan 2023 15:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673210960; x=
	1673297360; bh=4cUs4pLd9NlSt5Lm17M6NfEglS37b5BWxjnXNOzy9OI=; b=L
	4bNA/Srjm5cdRqeIkoMoVPLaRdUAHLWnonA53xCzy2Lt/vOKgpAIRgH2BYlSN/gV
	7b//qQ7Dk9bKxjhUcBmp1C5dFXt7y01k+eNgnnAbVnZt9L5aJhZy6Z8rvlI7Rtim
	3G82ic62ozeUpeOX3lWQCu8b42oT0UMPO+SCSyXGuWr2pOj58JYePERbWATxE0q3
	1C5oQs1h2sMCa/5Gk4XHxz0TRePgNXio42f2n/D/GNt8QCjKmrBY9GcIyKzR9HOb
	1/XpNwArtZ+38037BinW+mNyvYpa50n9FAlJyByD6hVrRHqL6ugtkt/yD5JSZEgS
	AIWtNupHxPJb0AEDevPfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673210960; x=
	1673297360; bh=4cUs4pLd9NlSt5Lm17M6NfEglS37b5BWxjnXNOzy9OI=; b=M
	XV4an6R0MEA8OAhFCMDQRX2qNTP5SrOYGp1XEXG6+KnO/fme3uLgRFCo8di8E475
	Ocmd5FxjC3hIKiDqzWm0o2/r5iCzbX6LS1St7SLBISpWSSxsf8OIyfWKNXwazzTD
	HPhQ+ODbPggRZF0maWP5GH6kyiE0o0L5E3BPWJeg74ovKCc60MhShjDu1t68wnga
	UMdmXDr/uDxULQ7mjYe6+zLaL488j8/mdyKsC9TBK+dDzrUPNgCjpFkQwdZ8F599
	XYBe1ZraVlg3TNUsHLw0e4oXe/oN7fzParU8/AxgeLX4Du8oMJ9JztKyv711jz/g
	aQRAMoRLnvm971hKTLkjg==
X-ME-Sender: <xms:UCy7Y7jVDtzia-qgeszs-Q8ZMn2UcDr7P9G4vnaQZcqPOAi41Cw0vA>
    <xme:UCy7Y4Br6uOoUxbf95UkEhX4pNRzBrEVY1cM03JHoOibn9eXS6xuD_lg1erxtvgyh
    0DnJJQWUs-NQgAQLQ>
X-ME-Received: <xmr:UCy7Y7EdxbhIuhoh8eOEVw_d2bIGuhH78EQRVYYBOE30QrJoJhFnGfabvCsY7xamCMe0WqOhsJo07efyLRaEFwHK4QByuPZq5Pkl6JNKkGVORT6Hmq4U99lGAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:UCy7Y4QWquYJW6CDOf87fQ-y82tIOSlJbYAhgI2itnFbyHYVPZD2UQ>
    <xmx:UCy7Y4zymXyrnW1LFiYe1Ln-waMx7TBu7wzldQTynYHlOlSqsmCy2Q>
    <xmx:UCy7Y-6pbN9SNyd23pzfW22pplAVhPVzLgpLJa2xQX4q-3hj9A8y-g>
    <xmx:UCy7Y08fm5GkhNUdpeQN_KrWZQf0r1V8BQZ4JuG929iiQpZakeVPLg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 15:49:20 -0500 (EST)
Message-ID: <a69ec7a6-8faf-a473-db40-c441d6bea0fb@sholland.org>
Date: Sun, 8 Jan 2023 14:49:19 -0600
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
 <20220713152758.56929-3-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 2/3] sunxi: h616: lower SPL stack address to avoid BROM
 data
In-Reply-To: <20220713152758.56929-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/22 10:27, Andre Przywara wrote:
> When using the USB OTG FEL mode on the Allwinner H616, the BootROM
> stores some data at the end of SRAM C. This is also the location where
> we place the initial SPL stack, so it will overwrite this data.
> We still need the BROM code after running the SPL, so should leave that
> area alone.
> Interestingly this does not seem to have an adverse effect, I guess on
> the "way out" (when we return to FEL after the SPL has run), this data
> is not needed by the BROM, for just the trailing end of the USB operation.
> However this is still wrong, and we should not clobber BROM data.
> 
> Lower the SPL stack address to be situated right below the swap buffers
> we use in sunxi-fel: that should be out of the way of everyone else.

If we are going to limit SPL size based on these buffers, we should
ensure they are as close to the end of SRAM as possible.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  include/configs/sunxi-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

