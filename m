Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81AA3451BB
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Nov 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563423; cv=none; b=AX8BMUYDT3pPFQBkVGDLnDWg3y6rZlyoep2XJsCbVAzXAeB16tO8iQpiZ4ar2r+g4SLepefpu4teeJV34aNz7dbyW4Xo5SCPuO2Vehs68+RThqH0NpnlerRzufEbMy2tuXxBcVyENEpANmItti0i+a2k8FPk+Mto+X57SQOy0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563423; c=relaxed/simple;
	bh=tN4N7vuK4JJ0rterP05amy6D7j/6Qj9sv/6YKc8hKYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJAMgMWxujmXKW/AyO9QvV0UcjFXbouGehvYFf8iJ1lBlcZtxtT84R7mLmuUHRChCNgJy6v5E9lCul67Nos7bZOBJuk+NA2TP+bNpcTnZlTX2QF9KT1a0NmEhktwoTkhwUX6wd+ghAAXiEw5bwz2QNe9RqMs4NTshyfejYF/Ig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957f617ff0so7456249e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Nov 2025 06:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563416; x=1764168216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=;
        b=YUvAiyC9abTN4KCM0xdwVtsOvWuCocT8eBgEbB0zd25Fn2sZurCuDv5iIc6XIUQFgE
         Joc2dC8Os2mNnhP5Qx4G8MPVqKI4qJLsP97Y4TzHph2GoWpOZFsdcQHgn0EHfupg5kH2
         o8v39g+pH2e6PRuqT25VHFD3GzdmmuqrRU4+IFX1lQ0zWUHBdxQ/vMjlZkvWdTC0urFM
         LnJeSnu4CczgZWpAvU+wMjZgLX4A8SDFsxA+adHNIkEzGLBHRL/OnxdGPdUBnrs9Q6LP
         /ul18lxmGORWKNSiiqIHWCbuE4TObj1e7RmHafDuA1l8DQyGjoOhJ14cUivJj6Bo5NGT
         d7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcEnMdh+H2GbWk3I6u/ubMO5audsVkLYiQSwEhB1rqZsUBGoB6CrrAOyDuu1jk2XsNWZfUe9nDzUovhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoXTjYMUZ4FLAK3gEUL53HAHhOxhRG+pBKlejnMaK3ZpN2pwNy
	S9c0M9eFj+f8Prnljp1ojIwcZCxoLNnJC7SvVU3HXmFjzq6OCUjksdX7+B0wy+us
X-Gm-Gg: ASbGncuqzJAV+HyRIK4RSCR0UJtaDngPkDA5HHRzLFRGNhe8SWeHbK0dhX80nMpKJWs
	71BWuZ9nqF9I3LXah3vyFt2HH4Sxuo7YwXQa7I65+G+FnHY9k9upLtkPqVKVSjJpxPXhoPUQwb2
	hKSlD/pu+bwhPxyGsJpE5NmcuMSP0YxK8mba6nrEKNgEHLH8DeWbDkV+sNUl/xIjhxZb0twWSB9
	2WbIFIkO+YQSxrZupV98Na/7pULXNtjdnXzs2N4hYm+AGQut8UNjNVeGRcYBAs+V1LEbVIctJP0
	N53CStQqgOadKgjPmj+WfZSzLhWkjys4YqGQO2rP2WWHAsDX817ItnsjOSXa8dBvEmZvkXJbhrL
	DFfn0MC5C48uCqbYOv4KbPPOlgioJEiW5Rlszh2Ev9W95O2w4KOevjiHlnV5nTPVVJfdLiZRIgQ
	JkpbVWBUuTdGrzd3Xd6BMqVt/7N7H4afb2PN17j/teNRHFbmKIXm53pDT4xRHxPgzK
X-Google-Smtp-Source: AGHT+IH+KI9LEN0cpH/3wXSucJBIz6mhYBJJnmGTfGyFk67hjvq0h/mDGqG5OBGQ/rkgtF8I80Jzbw==
X-Received: by 2002:a05:6512:3e1a:b0:595:8052:111e with SMTP id 2adb3069b0e04-595841f94bbmr7846695e87.31.1763563416122;
        Wed, 19 Nov 2025 06:43:36 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405afbsm4744031e87.93.2025.11.19.06.43.34
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:43:34 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37b983fbd45so54072711fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Nov 2025 06:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK+v29SiMRpJRvVph9pppTefeP3CTynvdtlTg/jtWomleNGsWoL2BHmUbFRzcL/EhVJkKl4qUliywSVg==@lists.linux.dev
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr45635351fa.28.1763563413779; Wed, 19 Nov 2025
 06:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk> <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 19 Nov 2025 22:43:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEwqpydG-ZRtqWc8I4l30DitJuwNrACYzTdhyRCjLGsAnpeFb-cKD8BLA
Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: pass struct device to
 init()/exit() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:04=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> As struct plat_stmmacenet_data is not platform_device specific, pass
> a struct device into the init() and exit() methods to allow them to
> become independent of the underlying device.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 12 ++++----
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 14 +++++-----
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  4 +--


>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 +++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  4 +--

For sun8i / sunxi,

Acked-by: Chen-Yu Tsai <wens@kernel.org>

>  .../net/ethernet/stmicro/stmmac/dwmac-thead.c |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 ++++++++++---------
>  include/linux/stmmac.h                        |  4 +--
>  12 files changed, 47 insertions(+), 45 deletions(-)
