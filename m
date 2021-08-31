Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944F3FC3
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 20:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lfAFcCGlGT+Q4w/q2JAsedWr3zWRkAZESjJDBTuaMdo=; b=Us9V68I49hWALcyGFeZoj9Jl9f
	swTJDnwVPfBLdKaAwkI0h5biF9FMvllHT0WagBhXXLpnfBukjedib6racgmhY/F4+sITOPliO1nS1
	pos4rTWZmShEjE47gPqfYDGeSyNM6EPaxNgjHuB53Nm0ioHjV63D6FR1Q2UsMXDjttT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1mLAl2-004kzH-JI; Tue, 31 Aug 2021 22:53:24 +0200
Date: Tue, 31 Aug 2021 22:53:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	=?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>,
	Willy Liu <willy.liu@realtek.com>, Rob Herring <robh+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] arm64: dts: sun50i: h5: NanoPI Neo 2: phy-mode
 rgmii-id
Message-ID: <YS6WxHtJtNDaBxqz@lunn.ch>
References: <20210830151645.18018-1-u@pkh.me>
 <116454729.UZi3dMzWh7@jernej-laptop>
 <YS1SsqDgGFOvyIT0@lunn.ch>
 <1746741.3t3T1tWQfl@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1746741.3t3T1tWQfl@kista>

> True, but then again, DT is a bit special, since it's not used only by Linux. 
> It's shared at least with BSDs and U-Boot, which most likely have independent 
> driver implementation. That's why it's good to have DT fixes referencing DT 
> related commits. As you said, DT described HW wrong.
> 
> Looking at past Allwinner related DT commits regarding this issue, we were not 
> totally consistent. Most of them reference commit where emac node was 
> introduced in DT. But I also found a couple of commits which indeed have fixes 
> tag for bbc4d71d6354.

All true, and it is not a big deal if it does go back further. I don't
care, we can let the Allwinner Maintainer decide. Ah, that is you :-)

I just want to try to keep it simple for somebody who is contributing
their first Linux kernel patch. If it is good enough, i say accept it,
and we can do a bit more education on the second contribution.

    Andre
