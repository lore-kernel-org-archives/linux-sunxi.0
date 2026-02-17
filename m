Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24B132FA38
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326186; cv=none; b=PQtBh4rUAPSJ0mv7hdphnuYD2cyeDmLNmuSNQrRa5lry8Bvaj4xpxic8SbNk9Ph38lFxhoQW0P8bxZSHH4FvvVJE9WAk44tyE3CygM3+PLBScCRw3O7hiLQV8QYTuaMF++ww+hy7NUvIZxKCKzIGED5Xked8+j96NdR0iOmZuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326186; c=relaxed/simple;
	bh=31wGoQCrJHiHHoy6Arff+pnfQmk9AyFwMKxIIalQup0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEaNCsw8SXsjT3I4TEgWso4dxL9ezWcCRP6m2YZO2BU00HYU4b+FtK1MrcxhfiFsn6PYESv+NBj5J/Zl/SG/KMqSqWgcvoQcLOLgUDKqQNurCO2809bSER43hI2gNt12QErn3cW58alN2jTWh3+CZUX38ydzDpZ0xLOPXh7U8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS2/fK/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS2/fK/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6355DC2BCB0
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771326186;
	bh=31wGoQCrJHiHHoy6Arff+pnfQmk9AyFwMKxIIalQup0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kS2/fK/F3NXnxlB/UQJy1PmXbWyHasTYR8JPJlTKlfDXlckXkzWlJa0FVxiAPcDdJ
	 kabh7Yksq6+AbmiyfaOfBFHCRPQKO1Gf3175jJkcJyRo7V+BldsA9b1qd657Ee3GJR
	 xxooqa95En5DIDcfD79U7QGYwxTLZvL2BA5jpJmw2bHewfHZN1+scuFhjwzb6+Bs4T
	 F4sr7GZDDKVf38SRDmM4Z4kiPxzNkY+OuPZv7jH1TPHLSJvqs97WkoV+KjdiJGu6WY
	 nCASxOHxMk+0ownDSswvYJYawrffEGcu7YKYII0iwfR9GarusG1eOncEuYKOXDE+Q3
	 h1ytUERqLEq2A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-388126f79bcso28078811fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 03:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5tcrUB84eN09urxw4y7BnTgLgM7gC0aKT7zch7LjdZu2do1olIQQH6IWji4+/NRCDadzhZQ1NOM4FBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8lQKErzDqFxbHpEDrUL6y++y4SFz9fYm8jGHlut+ybFXy9Fe9
	Na7FczP0D4d2WjzQRNSNGRsWjMthiQMV6EqcRpGKHlRLZd0zuYSETu+RjJDwurq3lqJXVrQmHad
	7HRJzKp9BjqA7df7AdvA4zQqdg92Z8dDViZou5/ULkQ==
X-Received: by 2002:a05:6512:1050:b0:59e:4786:2823 with SMTP id
 2adb3069b0e04-59f69c3d26amr4503376e87.23.1771326184953; Tue, 17 Feb 2026
 03:03:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 03:03:03 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 03:03:03 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org>
Date: Tue, 17 Feb 2026 03:03:03 -0800
X-Gmail-Original-Message-ID: <CAMRc=MckMbg6W4d7x5OKvTEq-Gawqh1mzY+fvddhxjDv7Si0pQ@mail.gmail.com>
X-Gm-Features: AaiRm50etZVT4Nx2EmA6QKebjX2RBcYIpgTucEC8eTHgaygABndvmN-wh6OFaXg
Message-ID: <CAMRc=MckMbg6W4d7x5OKvTEq-Gawqh1mzY+fvddhxjDv7Si0pQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Feb 2026 17:09:45 +0100, Chen-Yu Tsai <wens@kernel.org> said:
> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
