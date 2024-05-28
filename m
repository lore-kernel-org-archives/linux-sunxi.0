Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81079F6
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908032; cv=none; b=cBsVt9xPRraLhAd1IaoeFLADIxT1v6mZ96Cbozy0FbQ3bNXUEj1+zafQWqh5W302OXihlaoordtcFUEw2lUvYfRVX4h6E0393RsVPD22REls69yF4IxjN+dOf90SGXI+sH+5NJOWEpVg+4FM+fCVyIrbQV0xe654iXPDC+5dDAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908032; c=relaxed/simple;
	bh=9tGw+z1Zt5Dci5FRSALUEpOqfWgv86nBetO910mLjvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd+WFlJjopLqyC3C0nM9XIQ706UiSnX1stCfLHgjLW5AZqCuuJ/7MngCUsA/txv+CjzPznliXNVnyRqA0RpETDnjlriEV5PgaOfQ6M5p/vTuwnIUK54H4UtLuqbSDVR3WgLG9F0QKwTdpfw08qV4PE5y3KETL3zpTb94Re+l6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gf+IV5LD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gf+IV5LD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7995CC32786
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716908031;
	bh=9tGw+z1Zt5Dci5FRSALUEpOqfWgv86nBetO910mLjvU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gf+IV5LD7jTB5tubulPlcwPKubADIuDPDTpWOTfSXJ8x5c8Xgpix+coMXOOXqQeoV
	 SKQY5jkQPbrxEyuviJodsu4BCl1Dg4/Crw3htlEJy86ULMdyvWzyTx3R40F308dGti
	 0W7QXEB69RSGev9gkeMBWUGDHQk2qcXbMFbuSfVs+X9rHFGMNO0VdTwLGApCqwYBsY
	 Ta5lndnWRYJos28faUxwmW/TuLEXuB9fjaLq9aDpB9NUX5vXRZM4fcd3JyutLI7ws5
	 fU9beNEtIs85eqTxkfCswEEF0I4NZgPdpQFcZMJYCct7BwyiRaW0zvjayBv3v6bQW9
	 cvS+ST/s896cA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso9671951fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 07:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4qjR79trIOHxcLdf88IPYc/7iYjtWMsfaDLqRTwuwwPfOsqfASUq9w2WOPfb0qJdhnChB11OMQ6npT9tfI+zxKXwLSMCXqYTYx3c=
X-Gm-Message-State: AOJu0Yz30GBxvxmJHOBitvTUeizYTc3vkIy25Ls+FSiy6JbSRfE1C807
	skddDN+vmBQJ0o6Hirb9vC6A3FjqEqfTrKTwq1dhZthFCnQ0J5Wc4Xv+h7315CjUfw1XD8YIpny
	rnshRqWJK52lD59BQzBDGCnMBlic=
X-Google-Smtp-Source: AGHT+IEnx7oAnjMfteweZNgs7bWo602GXd4T0sMM9osN0evP8EiXUCzQXspQkkA1F44fHz0B0TS72cLfqYWCsUEJwGM=
X-Received: by 2002:a2e:a23c:0:b0:2e2:6f90:8b84 with SMTP id
 38308e7fff4ca-2e951bfba2amr50998461fa.17.1716908029869; Tue, 28 May 2024
 07:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240509231316.11391-1-andre.przywara@arm.com>
In-Reply-To: <20240509231316.11391-1-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 May 2024 22:53:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67sxBao35Y1GrPB=Nbny1UrpDKk9ZEa5pXWnQVJ3L3gpg@mail.gmail.com>
Message-ID: <CAGb2v67sxBao35Y1GrPB=Nbny1UrpDKk9ZEa5pXWnQVJ3L3gpg@mail.gmail.com>
Subject: Re: [PATCH] sunxi: spl: h616: fix booting from high MMC offset
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev, Chris Morgan <macromorgan@hotmail.com>, 
	Ryan Walklin <ryan@testtoast.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 7:13=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The BootROM in the Allwinner H616 tries to load the initial boot code
> from sector 16 (8KB) of an SD card or eMMC device, but also looks at
> sector 512 (256KB). This helps with GPT formatted cards.
> A "high" boot offset is also used on previous SoCs, but it's sector 256
> (128KB) there instead.
>
> Extend the existing offset calculation code to consider the different
> sector offset when running on an H616 SoC. This allows to load U-Boot
> on any H616 device when the SPL is not located at 8KB.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Make sense.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
