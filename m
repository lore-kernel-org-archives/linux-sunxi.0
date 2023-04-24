Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144647C
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Apr 2023 09:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2747C433EF;
	Mon, 24 Apr 2023 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682330286;
	bh=0Bo6Vh+vs7/WySfkMx93OTiQxZzTu1pqiefSV8EGBds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=giDhPRPj8yWuvc4hpC3lloHxLOSHha1/A9D7M7PgXDu+TTPnOP5MRr9RDP1r4b1LC
	 DSZfLvJHXwREXJuNU5bCSMf9CUeLVlxqNZkcxcGDjwnv5Uqnn3APFkaaMhkILAweKY
	 GuRZlJ9gTkPiPKByhPnkMvmCuMRMvtAr+g6YMPQ3nFg5KteB69e9Hn7xaA9tSNunnU
	 iKG2v/ogWQm20n0EJJy/Xk+Bq3+Iu0KSr3lD6WTJSluLIwTo8K5Dd+gJhA1gXLTtJP
	 EDwKL8LRtd8Ri6DxUh2kZC/elJrkPaIH9YSgW5G2DETfTl0+toau6EOfZcoegXjPou
	 9f4mOsV0vXStA==
Date: Mon, 24 Apr 2023 10:57:54 +0100
From: Lee Jones <lee@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/3] mfd: axp20x: Add support for AXP313a PMIC
Message-ID: <20230424095754.GD8035@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-3-andre.przywara@arm.com>
 <20230421073137.GM996918@google.com>
 <TY3P286MB2611E7B758E6C2208925127E98609@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3P286MB2611E7B758E6C2208925127E98609@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>

On Fri, 21 Apr 2023, Shengyu Qu wrote:

> Hello Lee,
> 
> Where is your branch? I'm gonna rebase my AXP15060 series on it.

You can use -next.

> 在 2023/4/21 15:31, Lee Jones 写道:
> > On Sat, 01 Apr 2023, Andre Przywara wrote:
> > 
> > > From: Martin Botka <martin.botka@somainline.org>
> > > 
> > > The AXP313a is a PMIC chip produced by X-Powers, it can be connected via
> > > an I2C bus.
> > > The name AXP1530 seems to appear as well, and this is what is used in
> > > the BSP driver. From all we know it's the same chip, just a different
> > > name. However we have only seen AXP313a chips in the wild, so go with
> > > this name.
> > > 
> > > Compared to the other AXP PMICs it's a rather simple affair: just three
> > > DCDC converters, three LDOs, and no battery charging support.
> > > 
> > > Describe the regmap and the MFD bits, along with the registers exposed
> > > via I2C. Aside from the various regulators, also describe the power key
> > > interrupts, and adjust the shutdown handler routine to use a different
> > > register than the other PMICs.
> > > Eventually advertise the device using the new compatible string.
> > > 
> > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > Acked-for-MFD-by: Lee Jones <lee@kernel.org>
> > > ---
> > >   drivers/mfd/axp20x-i2c.c   |  2 +
> > >   drivers/mfd/axp20x.c       | 78 +++++++++++++++++++++++++++++++++++++-
> > >   include/linux/mfd/axp20x.h | 32 ++++++++++++++++
> > >   3 files changed, 111 insertions(+), 1 deletion(-)
> > Applied, thanks.
> > 






-- 
Lee Jones [李琼斯]
