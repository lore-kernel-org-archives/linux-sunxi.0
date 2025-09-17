Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69B372885
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122732; cv=none; b=TmpBw0rCtQtFzkcArQ080EdWO47ll81jND6jF9E+nXfhqueAWfc4AqAow+smkVyIi6dlYOCPQHe5gSz0kg9o/U98GB1izkDj7rRbD8qJk5zu3MVS03fxMu7xPScgm41OCMYB3vEjVuFvJ/kyOUCdGvm+rtrxi7dTrUCkte4rNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122732; c=relaxed/simple;
	bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzSGZrtP3ssRLnfAKP4gar0qoDcbnQHHExdzSkUqjZXM5nxmZUmG7psXgG7n4MAHFZHfmakkou0uQjfWKmOADyMW5efgeAIrTL30P1aKavArCzRKo7KcZtuKNC/YBtXN8NHqk4voB438VjdNYHbkGGC61HucFALu1mmihW6Lkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5720df4acc5so3824969e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122725; x=1758727525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
        b=OY3+zsXlwJmUK9NvFB8ujnuGkyU9ZeKb18LwROYoFCxCtr3tQG2vZ9VayA49FzyWHO
         IoorJU1qJQ0PqW7AsrmKOGK9frmAet+Tq/+91B68aqJINEDUZdmcZ2ZVSxXFG/jp+osz
         M+5BRoM+S+cEaNhLqGjZeGEozlhnuL4UGOvgZBAlB6Ie/RnV4tASnySze4ZMZuWx8qNc
         PA2WQ6H9ljlC3FOUdfLp+TelQAIOGBM0R/L8fleC03If0bQhp4G1HLwOwdzga3UEDGth
         2D/WwBp3HY70ivdL16sr3j4ddCnYnfxxswN8YtTMW2P1FQMHNB0lkvSU4KPah4BQhGRp
         7FBA==
X-Forwarded-Encrypted: i=1; AJvYcCU55KlmJX6xTncAHwyk6MVhWILXRCW4QZ8CRE1uJ7QNGPd+BVFAGLiUwE2aPtNEf75Aa1OeLPZFQQjXXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbXhXgfl1nZI2kTSYGSXquPhs8tNjg6n07weVcV1VCJnbHHVze
	RYacuzC4DZDnr+L1tffXpPVfFTOjIPLy1q9GH4BWbW6G9V7goNTCEVCJXFqo+u+f
X-Gm-Gg: ASbGncvHdpnoJKfUEgKSUfZd0f3+Zw0ExFapM/hBall6o0Ul1iUVEhUjyLTh475wPV/
	hg624SKpCyvSXfLAJdaz+xovD2Tnt6QVfveQ6LlHs2v4/MC5qnm2aqM2ekt8jgZQ/nKFmcieU4u
	oEbLUOj8ePdm/ij/I1UvQhxpWqcz3jD0yuh09ZMj7x2IQvgM3GFSvr3uuyK0IiUfQHP6s+mrosM
	o2ChpUNj9OPzYS3dHiD3PvFVTOMLjRD2H2BFNacgXwxFxU7HOa/Hid+xfnzPuWSs4+R7spVpcUF
	e/AqV8kT1E5EkYct0KFSL9A6MoqhDSEVX3cqAMp5q0hrsXcxC52csI2cJehebRm4Uq0QQwDpMsM
	SR3fkl0Zw1j65s2WFcrjaFqjfbvcGbf2UzPPllxI8ABn2nBOOJvjOBDk=
X-Google-Smtp-Source: AGHT+IFEeCbOoJCY99/WGT2lIUkVYNs9p+ejxKGts/E/KkEHC+7Uz+Mc3NgvQbU9TnDGnKsnk3HXAQ==
X-Received: by 2002:a05:6512:b95:b0:571:3b37:a491 with SMTP id 2adb3069b0e04-57797ac833bmr1092535e87.22.1758122724449;
        Wed, 17 Sep 2025 08:25:24 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5730a572b8csm3200516e87.133.2025.09.17.08.25.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3601013024aso8098351fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZD+JXegEaxV5ghkMN8EeKyviriLfYilCK+7vzYLFi4Eg3TYkqm3kggi/BzRL3hRUzcDjb7fkSdfRaEw==@lists.linux.dev
X-Received: by 2002:a05:651c:2129:b0:336:ba05:b07f with SMTP id
 38308e7fff4ca-35f63f7b5famr7302181fa.21.1758122722394; Wed, 17 Sep 2025
 08:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk> <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 Sep 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
X-Gm-Features: AS18NWAKSCnNyj6DLBKT_D2jbUlV9UmfcpG5sUkS8PNH_1L_6YQPZfrfuWMUlOI
Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
Subject: Re: [PATCH net-next 08/10] net: stmmac: sun8i: convert to use phy_interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 11:13=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> dwmac-sun8i supports MII, RMII and RGMII interface modes only. It
> is unclear whether the dwmac core interface is different from the
> one presented to the outside world.
>
> However, as none of the DTS files set "mac-mode", mac_interface will
> be identical to phy_interface.
>
> Convert dwmac-sun8i to use phy_interface when determining the
> interface mode rather than mac_interface.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Chen-Yu Tsai <wens@csie.org>
