Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB219BBA
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748293213; cv=none; b=RVJNsFC5Ex+F9QwescMWhFcqeZZ1sym9ijVtvm2d7SCFfinbJAPP+ebLh7Fo7SzM8gtEY+4j5H1Q/rFJZ+9uxY7Gvc5XMHNekhzgERW5Uy+rLmN/0Z0VWO/XCN4ZXbigfV/TJiHwgJqbT6UCS5q3Y79GrkK3pDNWQpkcSaJpZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748293213; c=relaxed/simple;
	bh=QnOzZJosDZwQmHUjH11bMfDX1vpKijtZ/w27pwfOkAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssEKX2iVXeSVqT126ceeEyGmOgwPCmoFvVGcnSdCR2TS3dt3Ght9nRL2rR8hH5apLE8KX/G+JEDZvDTpL7PJqMlP8sRMBcFMCckSNkrF/LKM0O4bb+QW9x0guFQEpaECaiUkBLhEkFlyqkZptjX0+Aj+pf6j0GVdhmnwM1w2cZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFpJzP7w; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFpJzP7w"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52413efd0d3so892879e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748293211; x=1748898011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=;
        b=JFpJzP7wJ5vg0uanFEfWFhJs7b3XIzuP35kDWsssHJ372W13zF1IoOBYnpw23ayf2x
         x4avY2Rq/TmvD46+26YFKjWaasIDjwDE6pIiSfurK7ufwsBd5SrRdrvO5V6n7mwRmZw4
         FtMaeFgzstLzvaTtFbG/ygzE0gE0fVnQWKQyEsDH4BPyEaI6dCG6+yW+ucp8CUSPsTE4
         tM38pOnUZKeOkROKysrfnp0LodGcpbp85zUat/I8azuO07LoBCHB6IvoWu29MxYfIc6X
         L2KrPQNcjzQqEZ2BIJ4Ne/yHjOtiyRo3GH4VX172JGCsEHzoskP0tOHnu3lZx4CNzFNJ
         gvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748293211; x=1748898011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=;
        b=LYBX9wI2Oh88zG+EGyZk+OdOZ1rBzI5fYKT6Sb680axk8Bu0hMmrx3Kz8rvU3S8Fto
         wCWrMzxZQPz7OKm2uncm2qoS2MKzCu1pltRRqrECKowD16FGLawM9mJfEf0rKm02ZR5c
         3M2tMmbJlt7KzwhX+EH7sLKLgkQlcKuY8KytnY/cUwNMVhV4mYdGciyALuRMm0U/yamZ
         wRXgOKtntXLsgL81k+o/4OpLrgn+reApC21ZxoPGgxDdBYdPQU3aHItHwc5sPFajdx+m
         gq+QAkYR4Xla59vByeTGChod3O0nartMjf9UxAJisxoqV031qxLCqXDXrHqtJA+HAqlb
         lPMg==
X-Forwarded-Encrypted: i=1; AJvYcCWnrMXw7/qzkT95g1pvxCQm6bJ51ff8S4LuZ1xZq7qprWRd6oBTvtUXacY+i/l0yGfuLTm3qonvthlmzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4sLjPg1BDB1zvvJqK2JtwO+EdkGQdSUAc2gskJ5kXZCoubBnE
	g1Aalk1TMHPEQdcptpy6y5mEo4paa3TeNYij/mbfW5jMApD2d545JBT6RVNg6vnrZV6BZ1/Gh8t
	zhoezvWmuAQt0xiFfAaAbo1y/rOTqetE=
X-Gm-Gg: ASbGnctN4zddtFingSHAcHj0zVDvthANXS1mS4cjfLevNudxBMiZEfX0jLpzNo3hDdy
	St91zdz0ZsXwkJxRZx97/UdHtBTp5kIb6/hXoooaM4CsL+CPmJPYwCaHZPszE/0JxqFGrwAIkVQ
	6D6TV+b4fnvTxvC4mnUafep6yNIuYYmHFmHA==
X-Google-Smtp-Source: AGHT+IH1F819UdbqKdjXVnrU+7ibb4kb7PWACyBEmwPcni1wlQBFRsB0+/IWFIf8hbs072AoO3ylAlqbgpDxsk8Lh1Y=
X-Received: by 2002:a05:6122:82a5:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-52f2c5bf4admr7622487e0c.10.1748293211020; Mon, 26 May 2025
 14:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com> <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
 <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch> <CADvTj4qvu+FCP1AzMx6xFsFXVuo=6s0UBCLSt7_ok3War09BNA@mail.gmail.com>
 <a2538232-be98-42ed-ae82-45e2fcff3368@lunn.ch>
In-Reply-To: <a2538232-be98-42ed-ae82-45e2fcff3368@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 14:59:59 -0600
X-Gm-Features: AX0GCFtdyKxOISq6OJd3jmhemPTpifVHzFplXIgoyjcfXkmvrrAzTnbwIsfNJc4
Message-ID: <CADvTj4pCo=d8ehkz6JoPNYEGtUWsgmGCqT7vFEyHTtD7yF5ZAA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:58=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I'm currently doing most of the PHY initialization in u-boot to simplif=
y testing
> > of the efuse based PHY selection logic in the kernel. I'm sending this
> > separately as a number of subsequent drivers for kernel side PHY
> > initialization will be dependent upon specific PHY's being discovered a=
t
> > runtime via the ac300 efuse bit.
>
> Do the different PHYs have different ID values in register 2 and 3?

Well...for the primary phy address in the device tree, no:
AC300(does not appear to support address 1 unlike AC200):
PHY at address 0:
0 - 0x3100
1 - 0x79ed
2 - 0x44
3 - 0x1400

AC300 address used for PHY initialization sequence on address 16(0x10),
appears to be used as replacement for i2c init sequence on AC200:
PHY at address 10:
0 - 0x1f80
1 - 0x1084
2 - 0xc000
3 - 0x0

AC200:
PHY at address 0:
0 - 0x3000
1 - 0x79ed
2 - 0x44
3 - 0x1400

AC200:
PHY at address 1:
0 - 0x3000
1 - 0x79ed
2 - 0x44
3 - 0x1400

AC200 appears to support either address 0 or address 1.

>
>         Andrew
>
