Received: from ssq0.pkh.me (laubervilliers-656-1-228-164.w92-154.abo.wanadoo.fr [92.154.28.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E653FC2
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Aug 2021 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pkh.me; s=selector1;
	t=1630336887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YK4qPOhWmLT1hYTuvDdXQfjVOeFl8wkKnd5qbg6cdoM=;
	b=nDyVbaLKsjNjh5KuA5jT1xdD8naZvJbQZiBmaILQHSRHfEfrY3J2QEIHUqBXRYDIFlhfXT
	fqjpCBAkz63gjlEamTrvdjfo5BiQx9425S6zanrxD5M9oQUSRCfb8Hjj0lFbhuG+lj+rmJ
	i7lP8OvF6he1mxtz7czdRxbDbOb/s1E=
Received: from localhost (ssq0.pkh.me [local])
	by ssq0.pkh.me (OpenSMTPD) with ESMTPA id 9ffe0c3f;
	Mon, 30 Aug 2021 15:21:27 +0000 (UTC)
Date: Mon, 30 Aug 2021 17:21:26 +0200
From: =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Willy Liu <willy.liu@realtek.com>, netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: sunxi H5 DTB fix for realtek regression
Message-ID: <YSz3diNr9+awHuSW@ssq0.pkh.me>
References: <YSwr6YZXjNrdKoBZ@ssq0.pkh.me>
 <YSziXfll/p/5OrOv@lunn.ch>
 <YSzsmy1f2//NNzXm@ssq0.pkh.me>
 <YSzzuDvd1fWXxcAb@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSzzuDvd1fWXxcAb@lunn.ch>

On Mon, Aug 30, 2021 at 05:05:28PM +0200, Andrew Lunn wrote:
[...]
> You need to add a Signed-off-by: See
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> 

Done.

> Patches need to be in the body of the email, not attachments.
> 

Sent through git-send-email this time (sorry about the hiccup I messed up
the first call).

> You can use scripts/get_maintainers.pl to get a list of people to send
> it to. I would use To: for
> Maxime Ripard <mripard@kernel.org> (maintainer:ARM/Allwinner sunXi SoC support)
> Chen-Yu Tsai <wens@csie.org> (maintainer:ARM/Allwinner sunXi SoC support)
> Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:ARM/Allwinner sunXi SoC support)
> 
> and Cc: for the rest.
> 
> > Note: running `git grep 'phy-mode\s*=\s*"rgmii"' arch` shows that it might
> > affect other hardware as well.
> 
> "rgmii" can be correct. So you need to narrow your search.
> 

Yeah I understand that, but I don't know if that can be deduced from the
code only, or if someone needs to look at the hardware specs. As said
initially, I don't have much clue about what's going on here.

> > I don't know how one is supposed to check
> > that, but I would guess at least sun50i-a64-nanopi-a64.dts is affected (a
> > quick internet search shows that it's using a RTL8211E¹)
> 
> This seems reasonable. You could provide a second patch for this.

I'll leave that to the other maintainers; I don't have the hardware to
test and I'm uncomfortable patching something I don't understand.

Regards,

-- 
Clément B.
