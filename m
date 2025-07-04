Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE29328B1E
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jul 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616171; cv=none; b=TjgpblQ+EEfBjkJRABT8PoL0cw/PNuwWgk/D4RkXbUyyIKY5IchBphaV79PgwKWthnEBqW3AmyPDemAIBgr+tzQBGVdFgBr/GFbu8fnwPePTDyC9FO60kOKE5N0Ga1szzvehgQjiUxOHCXthf6bwqmUHao2qZ9ZXynCK6U4a7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616171; c=relaxed/simple;
	bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+KQTPK6AJTOqdmhXGIleCiMdkqYyTutrGfvWAhavIcW99mianAxkjkkAfvL4GY/e0qDMKQiAO9sVk5XySqRcZ37QuyDRRHiwg2+V2WHXjQxF3ptX3qyXEEPw+ytKreNOKQnKUCMU4tdqsotPb20cor5ZdjxyzwqASO0lxNfNyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WeZg2Sc7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WeZg2Sc7"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55516abe02cso739224e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Jul 2025 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616168; x=1752220968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
        b=WeZg2Sc7OVl8GoRkYyYz/am4ji3s0rA/yOo/W3SGM7T8owlsRdOAH0zelXB2joL2cw
         6HiA/JW4eF3yiUCyFHQwv6tMOx+gtkiEGPWmSHDoNOAvq5H53Ic/G5ElLmuHBDfeby0v
         g5XrypSNl/lBuEkSBPbs0YmLA4ntpMv5+rXYb7c/U8R3ea8Blcbj+2VJdbh5qwcqmLDW
         eg3OeJ7hLivmiN9P9UeHccA5bKPeisnDy7qXYwKOXaClajMThbIhzLdpcGZUJEza+efJ
         +y0Soe3/5AaylYrEMsvDrUahKrCsV0EnHaJFvHwR3xITMjiA+EFp6Dg134/0IE+Ahkqv
         6umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616168; x=1752220968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
        b=OrB49Zs4yuB6vQiUknK9GeCmJw0xy12SRqNt8K1WIchUkR13MQMk+us+24IQjkIhDM
         S8W3RoJ7k59NBwfWzj19uHSJjJCjZsIsNJ985MOeNH4hUnsZyHMfTgRdUbbrTr4bTpPb
         LhKsyqtIiQ16u8c+2JWrrzitQ+Vofp3AQ8qY+CWFgy6wva+aep5tU4t7lRYzDRiZnqhS
         /LT/iy/uOX1kFq4pQMEps5Ij3OEvbPch9UI6J/ocGxXxFrl/xCtC5DPKiblP6btmxT+E
         X8NGkG6wn0Onn75JzedhKDLfECJIXBrRYs32OCFJepNPZdFG9g8jXaf+TfLWlTHKb3i5
         ZDgA==
X-Forwarded-Encrypted: i=1; AJvYcCWeeO6GE7MBNepf3kQbv0GESz4hN7xXK0QYzdsWf6aQ54/V3va/AXcGDhX3UdhlyHW8sVkxcMl8/HXR1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjSszUwxfFMLhPRupj4wqS12LI01/dxdvHf9J8kRM5dl11y/rS
	0SU0OpTF10pHJvgqcEn9tHAG5MfR6IRo8Ekir6O12hjswPKvRhR96MFXV6N+0FmZnfRypcS2ejT
	I1XxHjjdhirJy+tJFSBWhVGyNGW5qArRiCr4HHgtc6Q==
X-Gm-Gg: ASbGncsHRejLRYhFNMDLfpsYvIwvhCNuupVXs16uGvFMQrjWXO4jdeqGsY5XKtH7+iu
	IuU35G+aVI5+MK2BV0u64VKb4MNNWahRAjRJYE0Z5RneaNqcaLzZrTShZQWxrHSTcoMgiiL4Kgf
	dpI0U5Cba7MbSFbsfn3aismhwiNGqeqdaJijE3hAuYTyw=
X-Google-Smtp-Source: AGHT+IEViFXCMcn+u4hb5R0d0ojGEnFpfDhNI4g0r3Lc44CnC/koM/mbdYAwzUnF/KlRRn9NNEY5bmwt+E5RollIb+w=
X-Received: by 2002:a05:6512:1102:b0:550:e692:611b with SMTP id
 2adb3069b0e04-5565baa727cmr564962e87.16.1751616165679; Fri, 04 Jul 2025
 01:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:02:34 +0200
X-Gm-Features: Ac12FXzEoK3lIRrRhHYuQcLxyMKzE37BJ8MYgC7nOBJcQ6FysNDrbqPOTwFxTFY
Message-ID: <CACRpkdZ+kw0=X5L90Wuno9GjEi3pEnAV_bdJX=ELUxCbk5spRA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 10:11=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:

> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.
>
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 =
pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij
