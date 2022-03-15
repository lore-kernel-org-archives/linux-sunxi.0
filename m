Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7931B75
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 08:02:11 +0000 (UTC)
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
	(Authenticated sender: petr@true.cz)
	by smtp-out.xnet.cz (Postfix) with ESMTPSA id AF527183A2;
	Tue, 15 Mar 2022 09:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=true.cz; s=xnet;
	t=1647331329; bh=Owgjpt9llFly8+dfQ/MyEmdugi3jXELC/2QOvA1Yplw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=RksBD10DTBfymcyc0tskKWTanzG6CEDK8a+QhF0EhUkiSh1bldkhga8ViEOgnnthc
	 Nzs9BB4sVW25Df5/L+nrQkSAZmyvD4oum9Ej+IRCYrePc/YELButYksL9ODTppiKaK
	 8XvCrce2WNdoX7QtlftDvNI5rvlq2FWV8G7QIlYg=
Received: 
	by meh.true.cz (OpenSMTPD) with SMTP id 36d5bdad;
	Tue, 15 Mar 2022 09:01:44 +0100 (CET)
Date: Tue, 15 Mar 2022 09:02:06 +0100
From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Bastien =?utf-8?Q?Roucari=C3=A8s?= <rouca@debian.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, stable@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: sun7i: A20-olinuxino-lime2: Fix
 ethernet phy-mode"
Message-ID: <20220315080206.GA12404@meh.true.cz>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
References: <20220308125531.27305-1-ynezz@true.cz>
 <20220315072846.GA9129@meh.true.cz>
 <YjBCImqGsbIZ3IF4@Red>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjBCImqGsbIZ3IF4@Red>
X-PGP-Key: https://gist.githubusercontent.com/ynezz/477f6d7a1623a591b0806699f9fc8a27/raw/a0878b8ed17e56f36ebf9e06a6b888a2cd66281b/pgp-key.pub

Corentin Labbe <clabbe.montjoie@gmail.com> [2022-03-15 08:37:06]:

Hi,

> If your patch is applied, older revisions will stop working, right ?

correct, in the same way new revisions stopped working when that wrong fix was
applied.

> What about adding a new dtb like sun7i-a20-olinuxino-lime2-revk.dts ?

From my POV proper fix for earlier HW revisions G/G1/G2 is introduction of
sun7i-a20-olinuxino-lime2-revG.dts with a proper `phy-mode` for RTL8211E PHY.

Cheers,

Petr
