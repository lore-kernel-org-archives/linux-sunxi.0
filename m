Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819A6341660
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135747; cv=none; b=qz5YKQLNtRk1ZRi3JUZWBOv5n3twbKxLgLcFpftiXNhXuP3agGeplAm3n6m7iFayt+jphOz0ax0sHFBNzlPnBdkQLXrVAixzLaWSJHCHIv8lZihekm1pHCDUwju51P+/gc1n06u3JxXdkwutIvtgmEuWaX3QzFywRWgicTOEh3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135747; c=relaxed/simple;
	bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOe1HNDJSUctCVfeMn3Tl2e89CPJLGAclhA5IT1fG//aC/8Csxd9Z2Tz71W0YPbP4hh8sqV2p2OmPpuOjB+SKVAhAcn8hYTwavKKo4QG62Eo/Va973hgiHEXGQG31ZRs2Av727qsfr53LCVC3DPC3iqE4EtzYzYDNveLvxI6bBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cOA5Ush/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cOA5Ush/"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-591c98ebe90so7412191e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761135744; x=1761740544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=cOA5Ush/gCWLj4vV1VUvBvsEmQ/JFwnq5fgmvSq3AvhapSUQqQOcIHtuld/d9hcZ5h
         H5sQ45Ge7SPIUuKf+N4Y0eAdE5e3XzmQKPGH0kGnWxlO2qPfOdaDXly5lkoPC7gSpc2N
         2l4DDScaGh8BrXKtirTfcSdghvEXme9u6KL3MUsIJxe7h88OiQNkLUg9R9JOVBtOgf2z
         fE8xRiDqqunWPKc2Ktj0AkCZoqHbGIGYEoAns2MRlGZoLZ63VsN5FKx0YD01H3tDtNF7
         VcBslWK+7qAyVCrTZ8qsUDRtsluI7S1baxz9IOsuYAj/eeCBoX4GJHO59tP8XFgU0NyT
         Oxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135744; x=1761740544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BElxTAqqQJrOvJZFCpntAANa1E1RXpxMqA95MHL9q3U=;
        b=nMDtvglXJGmlmfhpEJLpHR9QyCjHSj5emRh80MNkP2fxyqjz3uMfaMNDnJN8X0AI6x
         5VaaOCC/xq/kgdcgxYUb2kuhDrV1+zukhBDcNDVGU+im5Aw3y5Ymz2EWP9+Jd6Skwyfe
         aK3w/kwMEIfo8Ao0m3feSFdxFZxa2HilRu9gmKc0bf3fKHyI/gmbGNc119L1E0y79u2+
         gCVEHxt7NQmxpAQneQgYFhlp+IPNH6yHl9huvT1sXtrz9v/Jvv0mxbbP4lCNKEjqIgI4
         3zIMlOVTWhpsA82i+06yGBN/LZDAAiTPdcuu8SnnGqDfaIVOmzoFVe7dc81zfOyNRTeJ
         o62w==
X-Forwarded-Encrypted: i=1; AJvYcCWRcF9WWgTsrnChmmtglyq/E+d2xDSs9oIkrK+kNrrfm8HOYekYuZv5y+m1QpZDQZpsaW/GoEwNDb4zng==@lists.linux.dev
X-Gm-Message-State: AOJu0YytsQoGGXFyERPvmv2lrGUphdKk4zxmzX4Jby3BW/GcHIibRmQv
	Nas+IkICiE/7GjghXEJxG1LZtrZAVAsM7twPrySjZtO9wllniMCR8wMwYEeaXgqMuSsAyqvoqk3
	fLYVZ5gfpkNCGcFNOiabs1dVm1C56DHWtqpjc0Wd/Hg==
X-Gm-Gg: ASbGncsP3zUXsH7Nr42e9q7zeCZ+jZUAbdoHNRgqd8/RLLnoGBQDMtj/o9igyLAb/M7
	5SUEFJqU4FYuNDCT0AoT44PJkNFo15ly2ELuZcjXkVUffvDfkZkBhAKanzSPYxvUlrBFnWPPhbA
	6ddP+3xO8WKSJqFm6/KTbP0QY8wTAiXOTxQSE7z+RKxJD/pDEJBog1ySUCQfoZtMFwufPHP/tEs
	GmMImWDsrfCI/0QF065zHmRKFL/Y0wlRVuTUrPdSetzD+ElNDcTW/ag4WCyij6zxFfKn4cmW9cj
	C+jueEF6ruolBRAM
X-Google-Smtp-Source: AGHT+IHopjIXv8jRnOM7SdbKGejL8HmLCEbi6BqZ/fl5zn8nC+umc/NX29TWVW5P2ry8JnLwjKerkQkMpRF8tHTR1Sg=
X-Received: by 2002:a05:6512:6c6:b0:591:c473:5bc7 with SMTP id
 2adb3069b0e04-591d858f85emr7186831e87.50.1761135743550; Wed, 22 Oct 2025
 05:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 14:22:12 +0200
X-Gm-Features: AS18NWDxwRikRa37d3sfSPIurHFNsUg5soxDVQrWVC_wnbUDqwvc55kIMFCSQNk
Message-ID: <CAMRc=MdWFL_+RJXPUNLd0BTyxbt9x8jztf5SDViPQCkxSqoHdg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 9:27=E2=80=AFAM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
