Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A89187330
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Jul 2024 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721036174; cv=none; b=Ow59YTgGnQ4X3H9r0JwnxfkxgwGORoUSFEVJbNEfi4DTp7EGg1+n6nBzeTLH/+FLHTkWv1ipW3RgpZPERpJ1cMaKy74ouh0kq78bGbQFjvZjB6KfMQ1TUSgMhjMM9rMkJ55I0Z6DRqDcS+MaIgbOlhJAqvhFQsDpQBbU7MQfhHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721036174; c=relaxed/simple;
	bh=AJqWanax9nsGiA3+G3Gx6nYHD45gfl1M3npGo9eZueA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tevmttYqe7lDmaTpJ5I12AI+rwN+8hCAeF8loll7U4nd4p12fQNLEO2FraIhtp96a6CwtHZApDEsm5pmS8S/70AhwYrnDBHRpuxO97wW8mh85FFzynqPX1cPXJbPZzbDhU9WhNZ9VWLQct1oBoBhN7PsTaLwDUA+3wUbmzMhJf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=t2Mlm74X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SQsrvkwa; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="t2Mlm74X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SQsrvkwa"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 741881148132;
	Mon, 15 Jul 2024 05:36:10 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Mon, 15 Jul 2024 05:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1721036170; x=
	1721122570; bh=AJqWanax9nsGiA3+G3Gx6nYHD45gfl1M3npGo9eZueA=; b=t
	2Mlm74XhOQ9pevDRw2TO8NQsk+SITGBQ9YIdtJCuH8h0eauKLamxEriXHNRTlAKE
	T+2rNbU50sQ6W/01ufAiwvM71MYHSqdTMXHSL66Nyk+oEU1dT4V//N3AoUcXu7w8
	Z6SZo8EdZY+tOZ7El/MAl/1e35E1EjKHBKEGTV+Z1TRmta2Idpr+cMOfnuDenKNc
	bLF1906NYcy0f7uGmYEchBSGCY+ENf5vj5zFIiGd1HCGe8DQTp9zGmt3TE2cBt/G
	+a7bD8W4CU+vyuRCvNgi6U1dJUQafdYP5Fo+/Fv31oAwj1dGxdegATyvbl/R+s5q
	O6R8MmqUP3/3hqwRxcybQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721036170; x=1721122570; bh=AJqWanax9nsGiA3+G3Gx6nYHD45g
	fl1M3npGo9eZueA=; b=SQsrvkwa3llT8LyHAVAPhcDGUz+T9+9Xm6NxXPQmOLIk
	5pI1oIxPAQaAOHZyRxqugtd9NQ6zsiojr17/yB0wjYOckSTHdFIwPf8yqQYEuU14
	Ggdb233WRhWoH1nSRuFl+R7oUAOI6A9sgkTnL/VAjfBI21X7Z5KFUq6NBJkKhKqz
	OUsstwUBja5XlMzSgUPfg260n2MpUS64aBixwLCO644/2DdCLFrxAY8KrfTkRMFW
	Z3RC9Qy+TStj6Qwk3AInVXeviY4pnZ5v9IjxYGoJsOLaL6wcQLcPeeuXBFlZORm8
	mzb7FuxAE+OFJNucS8f7qxb9OcrWIJbQM6Q4ksqUSg==
X-ME-Sender: <xms:ie2UZiSyhTx7xEuT-GrczxS7BnkXF6EBQfXaNQ76zn78HJuWCJXWxQ>
    <xme:ie2UZnxNH5x00VRr4g8-N_8n09dbp4SAA6_lGfKgv4YAF0LTJwoIeFHvE0_DLXVh9
    -7RdGFJXuiAmjkWCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedvgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfthigr
    nhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefgteeu
    veeiudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:ie2UZv29oYYzhfAhQ2a2n4r1Yyvlui-Fop5yStbgS8l1YgArRXAF6Q>
    <xmx:ie2UZuCernONcXNn9hZm9ZaYAMs0ysUgFluDSrkb1NZ1fRMUFuOIGg>
    <xmx:ie2UZrip2haQ3PrpO_i10BtSLGksmyiBhhmGAtaUEF5dhprBt5Kj9w>
    <xmx:ie2UZqovHLaQELgpnbPN9vLuIN5viWdXkukm_nz9AT2qHqLf4ZZVzQ>
    <xmx:iu2UZqM3KdcuOvLvD4Bzaikk7QyF9bATNUpXyB4knEfimMSJzjvDrLqk>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 36CDFA60078; Mon, 15 Jul 2024 05:36:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <c11f219e-8260-4f81-a09a-31ec3136ca76@app.fastmail.com>
In-Reply-To: <20240715003811.2892c08d@minigeek.lan>
References: <20240712165352.3767166-1-andre.przywara@arm.com>
 <20240712165352.3767166-5-andre.przywara@arm.com>
 <f970326b-3763-4179-a6ca-fd30a27fc793@app.fastmail.com>
 <20240715003811.2892c08d@minigeek.lan>
Date: Mon, 15 Jul 2024 21:35:50 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Tom Rini" <trini@konsulko.com>, "Jaehoon Chung" <jh80.chung@samsung.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Chris Morgan" <macromorgan@hotmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 4/6] power: pmic: sunxi: add AXP717 SPL support
Content-Type: text/plain

On Mon, 15 Jul 2024, at 11:38 AM, Andre Przywara wrote:
> On Sun, 14 Jul 2024 20:20:44 +1200
> "Ryan Walklin" <ryan@testtoast.com> wrote:
>
> Hi Ryan,
>
> I consider the fact that the AXP209 and the AXP717 use the same I2C
> address a sheer coincidence, so would like to keep the code readable
> and maintainable. This "IS_ENABLED(AXPyyy) return AXPyyy_I2C_ADDR"
> patterns seems to be easy to understand and copy, IMHO. If you are
> concerned about generated code size: this whole function is optimised
> away, and is replaced with a single "mov w0, #0x34" assembly
> instruction, just before the respective i2c function calls. This is due
> to the fact that those "if" statements have compile-time constant
> input, so the compiler knows the final result already, and just
> replaces the function call with this constant load. That's a neat
> feature of IS_ENABLED(), and a pattern we are exercising in U-Boot for
> years, to keep the code both readable, but also minimal.

I did wonder if the compiler might optimise this down to a single instruction, makes perfect sense in that case and agree regarding code clarity.

In that case, and having also checked the DCDC voltage defaults are reasonable for known AXP717-integrating devices in the updated Kconfig:

Reviewed-by: Ryan Walklin <ryan@testtoast.com>

Regards,

Ryan
