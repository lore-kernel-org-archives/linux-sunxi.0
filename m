Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771640;
	b=ipbvr5P+oFl1PW8lr2zk8TExafn8j2lBsvQcWbKBfd0nHAg86epMpQjkwAKdaUSG2b8V
	 CzCEneqb0O59mzTrdjgOvulUHoat/WpbYjP/MXAspwRTVlGnhTgAgCRMVSzLKNk0kbyjm
	 XD0Vcbg9dD464Jf6AujPtQln07lsuRYc9bmBmcv4V6zGoJN9PmIx+li9dVWo/MUGz80jK
	 xpXzpGei74DCmu5atAxRawJ8YpeyFkLjQPHzvn2hv9YSREau4Zb//NJVxcuokqWN/rIUP
	 oTJenR24VJTTsqVe1KxS3nFn5lM+e36rOqhK93mRuLBteJUen5Ryz/6TdF0vqAUUjxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771640;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/+gz4x7osdn1mRAdAKNMycVXNMms0/yOgYXMjpmRseY=;
	b=CclrBG0NmdQIuzuSyuzDeec0sBnl+cNdWiP728CgUZ7auBNWLtYeO+PE/dS/aUnl35Nh
	 dJKYVkqZ0g8pp5HoG0GYv1nDrjRfzVcPb6rfTW/PlMtyjG2Kwz889sNP267fk0iUHAS92
	 8PZn9g7nfYZ8mrlDbEQxzUzfJKO1A+N96TMhM1mQbc1esUb2cBn4JFsO/dKHhQ07ZmP38
	 njDNH+vBckF9lZEOqoU22HqHKIz9QIXw90PAx5adUMV1BpOMEpxZSrrpSCO81LsV9bi+v
	 yv1OdEi7nAH03lNe8D7iwYu6eDR6sgmIq2RgdnRAGDBSstT0BNTTjYDGsvMU6jIaMPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUmPOHjf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC360606A32D;
	Fri, 27 Nov 2026 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUmPOHjf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0D41F00A22;
	Fri, 27 Nov 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771640;
	bh=/+gz4x7osdn1mRAdAKNMycVXNMms0/yOgYXMjpmRseY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fUmPOHjf4n4111pVeYVvWxiXrY6ZWntXMlJCMQowL9ba2LG5Z5PhYzT5DLkEJEXi2
	 Z+SIZ+8ZhPkdUz8VlWAyueHqlRVN/1PsmbZ9/HJd2AnMq+tt8+WCbdnldDkKSssMsJ
	 hMHCDKn6ykBdh9jG3Jl3m0Ewjq5pHcl/UJnM/LhLx5hXrE4+mTDBQYLukVvQUXoKCt
	 1rHT2PUaILVBSE0c5LOjStzmRIP6e+NuAmTmi9ftDqADkprB78netEOpvDqQbOHkDS
	 VYAWKZxvTDlPnQfFNNET841idRnxXDsVdYJVj6p5+Rj0ir9P1LsguJbrjYQ+W9dJZE
	 cXlMIlmMmmVnA==
Date: Fri, 27 Nov 2026 09:27:15 +0000
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
Message-ID: <20261127092715.GP38590@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
 <1jzeuu1vey.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jzeuu1vey.fsf@starbuckisacylon.baylibre.com>

On Fri, 27 Nov 2026, Jerome Brunet wrote:

> On ven. 27 nov. 2026 at 08:48, Lee Jones <lee@kernel.org> wrote:
> 
> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
> >
> >> This patch series adds support for the X-Powers AXP318W PMIC, which is
> >> used recently on new boards with Allwinner SoCs (the A733).
> >
> > Doesn't apply.  Please rebase onto v7.4-rc1 and submit a [RESEND].
> 
> No worries.
> 
> In this cycle, series based on -rc1 and devm_kzalloc() in them tend to
> conflict in next. This series would be impacted too. I can rebase on -rc2
> if you'd prefer to avoid this. Just tell which you prefer.

Yes please.

-- 
Lee Jones
