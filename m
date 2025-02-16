Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118881624D8
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739700214; cv=none; b=OTVPxtuIFU9TaCAG6AG0Izn0p/m9oqqAj6nqCEVjbLsw7LAv5Gd9akojq2IOSEL9zR0AdQ+fppvq6EV6J8Qk9THmAQTQy3IQMIsULGvV6mDT4o1ZtX4g3HoQ/1G5kNpzZGuXzKt/VnkQV8TjzgSPNsBPqR8+oE1+AGLTpVwLeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739700214; c=relaxed/simple;
	bh=+boxGgLSEIveThxnMLCXGrZfCD2NYYwInyAxPgVdydI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VTL0ne7uFkC9Cv8vtnRNz4PLqWvrYs5iwrTxL2+4hIFPVxFENVDhmPu8NwlKmmE0+HnVX1fe8i0+vldjcU7p65iYyvf6xE1VmWMbS44mE0GJy2nGCqE3POixKsEhWR4MoRUqmKywVGlNWiAVGPtj+wbZEOAGnqAFSJuHdYm4czs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=mjWe4c1m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GGj6bmj/; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="mjWe4c1m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GGj6bmj/"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9C9E725400B1;
	Sun, 16 Feb 2025 05:03:30 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 05:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739700210; x=1739786610; bh=+boxGgLSEIveThxnMLCXGrZfCD2NYYwI
	nyAxPgVdydI=; b=mjWe4c1mZIBBJMFkdaHDbV1c1ef+1eTUEUnLgmEfgRSufWra
	Id3KkiKuf7ExGrvMKipcnSrGQ/HIdsoFHGNpcgo3cURomBP8XGAWA8+fMy7NlKhb
	2ar9lpz7mq7c9DqZ0ZOx/hW/J/WHP/obyiWfALX/qDTIGnWoA1G0h6+mmlaYvZZb
	l7PjXrx6nEsgyzd/Ku2xqQQbRGlodOnAh+T1xlXabA2JKinxYliQp9EdmwDJJ6wJ
	ROdvME9Ukgjo65IGomX852k4TU0YDpU2Grp9ul+J6xCVHvoDNm5DyWT/WxuTz094
	8dc9nfMbrsD8foqqHfBsZbtEbgBXWj5cnr6j1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739700210; x=
	1739786610; bh=+boxGgLSEIveThxnMLCXGrZfCD2NYYwInyAxPgVdydI=; b=G
	Gj6bmj/c0/B5eebGzbSKEQ9vw5hIO5+fGCg1RNRlMuMixKDkfGNAf2lAigrWGbvu
	5L+9/040l4rxBdvOnYASal2jq/7JJMQcNlg1FL5ur5ffaxpEHTLnJgMRQUzLuwHD
	AfXvzXzJXyzAOSJNaWXZTU2izTRaU17sg9WxWvZ2Hc17w4KsbpcoVwUxhi5r5by+
	Tx+YgiBVeA/lWVPnivqu5cx4wunxI0TKh/ZrKTOgRk85F+8afR8XauYpHe+x3KUr
	9EJQH7F5G9EZwYg74L6GxbHf3R9wD7KxKRB5FX7jA3Jyhoa9ckGnWzlzCv1S3pHS
	5iLBKpEMTnDSt+5BlkCuQ==
X-ME-Sender: <xms:8bexZ2-tisELEEk3HNGVFEIvfb_3H_W95QpOEMUrhrdFnQzEoEceDw>
    <xme:8bexZ2uuJ2yrVvBqDC_kxPNAaDpoWeDTukX3sgeQ9C0fQMmLlzJHd7XRKqtoyoksn
    ZL-O4yhbTXXsh0NZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeegkeduvddvgefgjedutdejgeejffdt
    veduffdugedutefhkeejleegiedtleegudenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhih
    rghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgt
    ohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprh
    gtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhs
    khhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgrke
    dvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghrohhmohhrghgrnheshhhothhm
    rghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhho
    sghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8bexZ8C9nT8o7YvJA9gW4let6unPkdlKaoTLAH0vgfLnpNBvhOpCVw>
    <xmx:8bexZ-e2h4Bkexppo7UjjbQr_z00oM4Ljz0utWxRI5Ol7gZatHbolA>
    <xmx:8bexZ7MuVNOggdxkXgj4mpOzwzIeJduBAqqyRM9OV5ZaEZs1MTBXwg>
    <xmx:8bexZ4lQt2TmZjpKXrVjxaYM9N5uJjlmPXMk_tczaDlAdaJ-dNLvcA>
    <xmx:8rexZylSMHRDDw7xtQnPEripwcBF94vhXhE79J0Tr7ckfw-X1Wu6y4ae>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 891D5BA006F; Sun, 16 Feb 2025 05:03:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 23:02:31 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chris Morgan" <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 p.zabel@pengutronix.de, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Chris Morgan" <macromorgan@hotmail.com>,
 "Andre Przywara" <andre.przywara@arm.com>
Message-Id: <b9da3138-29f0-4165-b245-f6c14750f801@app.fastmail.com>
In-Reply-To: <20250213172248.158447-3-macroalpha82@gmail.com>
References: <20250213172248.158447-1-macroalpha82@gmail.com>
 <20250213172248.158447-3-macroalpha82@gmail.com>
Subject: Re: [PATCH V2 2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 14 Feb 2025, at 6:22 AM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add the required clock and reset which is used for the LCD TCON. Please
> note that these clocks are exposed on the T507, H616, and H700; however
> the H616 does not expose an LCD controller for which these clocks are
> needed.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Hi Chris,

Thanks for these! Can confirm that these two patches along with the recently posted DE33 [1] and H616 DT patch series [2] allow LCD display output on the RG35XX.

Tested-by: Ryan Walklin <ryan@testtoast.com>

Regards,

Ryan

1. https://lore.kernel.org/linux-sunxi/20250216085432.6373-2-ryan@testtoast.com
2. https://lore.kernel.org/linux-sunxi/20250216092827.15444-1-ryan@testtoast.com
