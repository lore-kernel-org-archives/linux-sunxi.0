Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29D04C98
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 14:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC19C433C7;
	Mon, 17 Jul 2023 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689602877;
	bh=qulwdyHb+9uPhm4p3WCoPEZ37M3yifnixVDvq2o+ERM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=SeJihIoqimuGmtiSuPXJ5gWEw//j+ImhikcgFKXSJFpVlaQK5/8wRZr+ItAI2RCv0
	 vxmGlwoLPO0xF8TP0TfnryuwcGNCopNioiYBwv2enJVlTIzqE8QUAn6fZtEXn4XBrw
	 S4TzBQmmRX7pI6SpU/qtNuHwt3IMODL2NoS182r50gCVlqLmPVjtspCh3MglMI3JUM
	 3SlqBgVKnrSyOGP1Q9AIUhn2pZxqLj1TeIwE9u06LW6CMOpZ2VcAa7Cgq1W5Ntk10S
	 SXlO5Q4fumh6lZ9lPcIclgmu3IoL3SXcrOgY5yeMZDbINz3bOJwd95MfYXGCgfisfx
	 MiC6kVjaN84uQ==
Message-ID: <e168b853cd49e09f5ac081db086bef3f.mripard@kernel.org>
Date: Mon, 17 Jul 2023 14:07:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: nkm: consider alternative
 parent rates when determining rate
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-2-04acf1d39765@oltmanns.dev>
References: <20230717-pll-mipi_set_rate_parent-v4-2-04acf1d39765@oltmanns.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Roman Beranek" <me@crly.cz>, "Samuel
 Holland" <samuel@sholland.org>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Mon, 17 Jul 2023 15:34:26 +0200, Frank Oltmanns wrote:
> In case the CLK_SET_RATE_PARENT flag is set, consider using a different
> parent rate when determining a new rate.
> 
> To find the best match for the requested rate, perform the following
> steps for each NKM combination:
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
