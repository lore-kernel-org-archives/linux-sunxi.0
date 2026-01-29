Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDD2F3C3F
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Jan 2026 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769716280; cv=none; b=MgkGY3/O4WnvkWvg1fQecHbmr4cJEwikp7bABrYkUFOmxm/EBKIHX3PaQ0onXSWvNkzL1b7x0qIKE3+QpknLoAKbnYBMnSFbGErsrZVYwlJyKph8RePV076+OzH4daCTTzyMfZxk8HmqpFxhkvSSU+tZvSyM/EU0i5NxaIuBZcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769716280; c=relaxed/simple;
	bh=kz/UmQnF/kQZX0padhdk52aftyV/7o2JgBiZXIT2EDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAIqSlYeWZzJp5ojDHnHKMpq+CKXZV7LH5pt4q8v+5JoAluunkXYGrATQJ44iE7s8wQ+fvQlX8w1ERvqJXnBlAYxXc4ddhujyeg++YNSVavKtYXDGsztq80YOxZ517w2rcdhcdUq+LBUpW1XAg7LXHLEJq6a1F1ozhUciMLmZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=lh8bTCGz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="lh8bTCGz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81dab89f286so693515b3a.2
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Jan 2026 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1769716277; x=1770321077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=;
        b=lh8bTCGz7RREhkMLNQizREHIfMxZp8tc5ceALlSOGwvHFzShiWgsT5g5S+mC6o+dbt
         Xs2Hndjjx62Y/G4T4UtJ3VTEPF6aZNONtLb4gpZPbeHw7UTKmhVcc4TZaCpDJP0/MX3h
         mAReHY+up35/GbX13jOkmkmkvhwbCXneYRnC+hwx9jI3iolss2eUia/4ufrbNsvrZG/6
         dsBCL+Quf7VQGbm2Ir2a319I5XbHiDzUUaJrMHWjBrg7RKlJozDKijsOvf44oihP2jAi
         h9L5oPDYQ4UNiUNex/vBJ7bguDOL1m3nzSaf3C5pa3Qpkeoof1Oqavj6e+vzITqaX1ej
         EEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769716277; x=1770321077;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnxwsZAxF8STswOuh2vgfeXNVDToeemAzI/Ew3hWeYM=;
        b=u3f/jL4xwiYejLaPxhrhUL7EgwMo/j/zmjtlKMDtzEiLocX8OluUggmhTa1ygLU9TJ
         Rx2yTkQovdqmRuw9pmaMm4WsMtpzzrv0OFn0+l/07tbliRJVe/vJUcrrrNSx1Kuapjvi
         cEXvOS8xKhblEtHJIROuVVFkk6yHwMLPa38RqUrhOguUn9FZx8D4/AQODI1fwT/DblRp
         Ji2vSsfT62ejmgal/UpyWr46DYPW4Wuf8XbQIN0kDiy2c+ulJpaRXpRn5seHePJ9S7xj
         w3RVmnxEzo7+jgHpF+R8MQQoCZ76FzII9INENoXcUTFyMoOo4petgqYdaXMn8nZjFmFp
         Yw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/2TzgOuinFUrp614YPZ6AvH3cWAWsmE08VtzDrQBQfSnRCbs6YPFv+souG0cp+KtIt/4AQC6btK0DNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YywfjtcsZJ01ePtG4GfS+KCzIJyLfOZJHBSBFFB1Uhz0ycHuadq
	OfvuM6VP+fssBZtXSG7EyKDQhRFjHir798PIhLS3NiT7k8xuuHMahsqsd0iWId3lSTw=
X-Gm-Gg: AZuq6aK0cazIBTw0I4hF1dL07sdj2ralXxWfy0vmjGf6yaiEQX/aqQGlJAQ9XSAjq0h
	0k62oUK1WLTeX22RbwLiXfdHmQDwJ+NVMqkUYntf2EvMua+OTjfVBEFQzYNyWWiatVeGj4av6UQ
	MpkstosCJNmXMQ01u6b3UG7mxYebYv/5NT37aMkKzkeQUdVUWgespMbLhPqw7F+IpQ3WoUD7Grx
	kl4JLvsHQbLXv5YIyM//cCj/mDMDwqwsjlkzMlTi5oqHYtMZCSRKHbK8oJEbZAHruYEoK1QZgEH
	NB2mJBJVcIHvajugX150j0yRD6lHx8XbYfK0SAbdICktunPvqyOz3VYmw+/UZSbKTWEbFpJKjaL
	DKGLtS7X41Deu4bF0gJImdisWSor+bON/OOTOHWblhz89dMyGKXn8W5ovXQF+rhInYnLudgRJgo
	t7RQ==
X-Received: by 2002:a05:6a00:3d42:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-823aa3fd50dmr448408b3a.2.1769716276774;
        Thu, 29 Jan 2026 11:51:16 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54d4dsm7133424b3a.67.2026.01.29.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 11:51:16 -0800 (PST)
Date: Thu, 29 Jan 2026 11:51:15 -0800
From: Joe Damato <joe@dama.to>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next] net: stmmac: spelling corrections
Message-ID: <aXu6M3BKyDhJIXIx@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-sunxi@lists.linux.dev
References: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>

On Thu, Jan 29, 2026 at 05:35:03PM +0000, Simon Horman wrote:
> Correct spelling as flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c        |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h        |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c         |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c         |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 10 +++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>  10 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
