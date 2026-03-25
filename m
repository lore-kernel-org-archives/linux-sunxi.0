Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2B34CFBA
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422850; cv=none; b=JjnJ1IzX4GXcptv5hCGIYMnz9fb0FOWk/Tu4yV0MqirqbsP8s8jVprAmd0Hm7HdE3/tDO2ydzmqSprNTOZWkxIXv/2wQtd1ia6SthElsH4kSP0LNfSx45zW/mdNODpn8ijMh7w6pz+JCm+audDYKoHOBkk6lrR87mEyAKzrDSqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422850; c=relaxed/simple;
	bh=Fkr6ntC5TQeGRAuflXX+PZEwU6WuhtzwRMBzb0AtdG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrZwshzY0qBIQF+BvR7X2avaZrmlCL2tgOQqa1L14VlEnJQ1VdES+j4cUweTsVlpu1wIVZJjydzSl97lggo72n1LzoJJXWI4qZ/aw4EkoqLYoPHIkPg5UC/O5Oo+wJzHCEjwZfRbCT2Ks5ykeE2YEmZAOq9qCALvQEHgcZSfUPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pY5+0Xws; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pY5+0Xws"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso5216445e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774422847; x=1775027647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkr6ntC5TQeGRAuflXX+PZEwU6WuhtzwRMBzb0AtdG0=;
        b=pY5+0Xws2xMNG1ImxTyE9rlWXlpZ2ggWLgODX7fwZrNuTyUYZWKONLmI9HSVqBU4P2
         uldKOm9NItuSqZQe4DwlpWskefPpkgt8p2tGnYLWUsK4tli3l+6z7rPw7/a6DErqqYWK
         I1MV6h8ge99HMGs6d5Cx4NWs1ELmJMEtM+RH7UD4C/c9weOBF0aWAN2Y1+qaMG9P5AaN
         aERN3Gp9yfPA9iRhR1fgVis90ke8kMxpZSden798GTgzf0xNIT+a6pzCFVFvi3fJ6CXD
         5dWgXPUXaQz2QBq6ztEPgMWhd1XVivswuepAXUx0sOMj0D/iTzPEk1iHeybTO/BAP2Hc
         IU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422847; x=1775027647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkr6ntC5TQeGRAuflXX+PZEwU6WuhtzwRMBzb0AtdG0=;
        b=lpjzvk/oQhxaO4coHgWioqDRNdFQ2Q/vk1xxrcTAI5qeMj8UuK9PCjFVYWD2nBE9qo
         CrY8m+5RIvk3WAEq8wzZyiL6YAwaKnoFRi2VJi14+SAliwscliMaM8jfUohwsXP4mDvE
         1tHgeUe6Z7NwyzyMJjoZTqxxpVkvx4TpxSeKA3vJ5ig6tvE8UBQp8FtNwcp8dZVeuJ64
         DZXTbPOiwMU9iMLU1wFTaDgEaR1gLopfSPk1tSa7slASyf1UaDavFM+E9wbtxC3nITG/
         KVZykj4ttmy9+g8M3zLQngdxJcLP0sNjEqzFdXOZxB8veGbXtO5SE3kAnq20oNPKtt3E
         NWLg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Xu06sZ+q/clv1mi4tZbMedqfwd4TMK8Q8HZcdYQJ5BWzQPL2H6OCU3Iop64Wgv88/4+2xllgclMEKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyENPDD26toZEofCErD8FT8ELjWaGH9IOs/OFW3MKa7DTsSgIMS
	J7P6UyUhvMzql/OyB9yQC5t3yhjCwzzzkOSzZwLMnFGpxjqEeUgjZPi8FXLZ1+Tm394=
X-Gm-Gg: ATEYQzxkXQeNbuAGJI/XvfjtYO9bJoXR3WFe0oQzFpuVTfMAq3LhHDFFFZkUdLXC2OF
	qgEuGRQiUBc1F8h/D0h0oRhUNE6KWe3bii8G2UABUTR7WZ1o+OoaCceMp92WbIjDuyaE7UKd9Lz
	GaLmruNAuaMUdSJppINNyKWd1RCH2OsEU7UNFfbInFt/7wyNJejbkQVgf8KmIicR1OvR0m/hArw
	Fbt4+WSIWDF2h/9LVbp4nE+8UeRwCGZX/lQeNr7qvID1Di+j+xViiKgz+c4vIc4M2rxZ0WymSPe
	24/ah3Vxou6r4gK8gCNWX72pPPMobg7soVycNlPOlLeH6eXM+FWNi53D2ga63e6+w9W7y/n1HK1
	jVGPE3gjsJItUYBCBMxn/cO1QXdjCNbLX6TF4It24lnagi96U2iJuqKKo8va2CUmayyoCpMXucB
	Twr41Sh+f5IkkSXtmuR5Xk6CPwp1PqbjYfKA==
X-Received: by 2002:a05:600c:888c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-4871608eb93mr26991745e9.12.1774422846667;
        Wed, 25 Mar 2026 00:14:06 -0700 (PDT)
Received: from localhost ([193.115.216.78])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48711764625sm111818775e9.14.2026.03.25.00.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:14:06 -0700 (PDT)
Date: Wed, 25 Mar 2026 08:14:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Joao Schim <joao@schimsalabim.eu>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Introduce Allwinner H616 PWM controller
Message-ID: <acOK8lTTyqUDkOUb@monoceros>
References: <20260305091959.2530374-1-richard.genoud@bootlin.com>
 <b47801f9-3828-4c68-992c-e85373576f3d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xajyc235ccyd4b6n"
Content-Disposition: inline
In-Reply-To: <b47801f9-3828-4c68-992c-e85373576f3d@bootlin.com>


--xajyc235ccyd4b6n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/4] Introduce Allwinner H616 PWM controller
MIME-Version: 1.0

Hello Richard,

On Mon, Mar 23, 2026 at 05:27:07PM +0100, Richard GENOUD wrote:
> Hi Uwe, do you plan to grab this series or does it needs some further
> reviews?

I didn't find the time to look into your patches yet, but I have them on
my list. Unfortunately there is quite some more on that list, so I'll
have to ask you for some patience.

Best regards
Uwe

--xajyc235ccyd4b6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnDizsACgkQj4D7WH0S
/k4DawgAl9zebky6JUhsQcoYow/EocbW1XqWpz2vAU4LvXyj/0aQHwcFNmx+4DKy
6IvMXFcFuL4pueeCfijwE/tpUQDXKcfsj71O4CuoJwj0vaDNV/j0L6/UNYIPCwXI
YJYZ0Sd0JAL8BHluFBQtb2dd5oVwq04sETQUJ0IVH6TNEkU9lVsCM1nc9AD8a+gE
en1Jc9qxxLeNkNt7ZE01K5A8d8vyqR2iyq+rZgTGNrM9hF9Ie6Xk9wOwR/1J4qli
3tdzMjk/EQgFWj2mUkublabj28rl5M20evd/SgdL9Q05si+LeWcTchW3XyrZTgOq
uWWaKIZls5u84B0vW44FpG4l/XTcZw==
=04lb
-----END PGP SIGNATURE-----

--xajyc235ccyd4b6n--
