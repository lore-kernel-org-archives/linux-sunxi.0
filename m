Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86B2E610B
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Jun 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639883; cv=none; b=ScKekWwSd8YETSIBhcoo9RSzs0K1Mt5CR+C/I2lp0ylui5BK1NfM1AJhvzHhW/U4TgZQ+pVmXMLERAD3GYyA3ORl21AW4uPqnz86py5saIg5A85U+iTu/aU2Rh7+Nbcoay22VknMhlg3Xt08aXYVxF1bvxd1j+AQ0rkMA+vPl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639883; c=relaxed/simple;
	bh=vKM9URE6VH8VYC800QExPP7HP+rcx4qnoJaslsSum4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+eDLH84ZaJf5qgd9rA7md7QXzcpYCS1EIE5p2Bz5j1IwhdEPz9b+OfR7esCl7Tr4ayS+G7nr9UUWPJbbvIVSoAn/bNEQxGeNGmtt5RQJaiuj/R2T+uqLS+dJJLM9uAu8Oqg6KlVUraZ2h9huNw188nN+z2vLqqhv3n+OGoSvb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5532f9ac219so7512727e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Jun 2025 04:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639875; x=1750244675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIkIaaPsxO4m2eJwDcrS1OSphLUaIwh9HxpS06D3sV0=;
        b=IyWA/+0FVAsHaKyVrtf+g0D1uRbSW9iBkZl4at5On703hMvp5E4aSzSozlJZy5Ir75
         08miatfWQBUgaIR4K4KHwptfNSeTSSet1IzS6CZ+/tnhXq3meAYPNjUbGUDBbZ9t6vm6
         5wOu78WRvnNCSPz6GK7x/NA+57IjU1tJycD15BvQv9k57kNExU+Cgdd4140jKH6Db4Xn
         Gqx0FigBT09SI8VVDRFcawtUwED0kx/90dM2OFuTUhva1OpLVSaBs+XBU44DXnwanpNX
         ZWZz+weuF7ge4eel47hp+086fXVUkdPegFJcPtkhPyv1xIMZIGVlsPX7g34yNQrw3PR5
         GIVw==
X-Forwarded-Encrypted: i=1; AJvYcCXDjB5vCc5YDMScmENWg3NTHnGakJMB+HAWei+BP7CCR4UhILMnCvTa2Cg+ZBNQoGtnK6I1/TQyj9/8zA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYARNJRWSrjI4hAU8h/J1W3ipUmhfIXHBX24L4/ypP8554Rb/n
	/FEDKj1HyCgKIbmLzUVqTqhN5n20AIiSXh4tavsWWGnCQwOnyoDAc/omEcZ8uFSb
X-Gm-Gg: ASbGncudX/GLE0SDkbg5YHZpXt7pHyCja12wa9t7ThDOGDjm71TeQ6X7USyBmrRgSD+
	emXkN9eKbtuvOorR9qSUbVps9XP6APPzGzjYhwJnjmyLI3USCnCmjRfVMy4BoL+maKSXfztJkpB
	YGJWEAAVFOU5IoeEYPDKbLWRU+O33h9QWyiSQr+rm7zyp6NsUmUARMYJnc5Y//mpFVOcmiQQBn2
	FPBrz3e9M9EpEqtYMCUnk11RcHb3UtCOmcw4mgxBjQtS+zGzLrjG2V8G4P+FOkz3aVewq/dVYXi
	iMx/PahjGwNrhbOzcyRa032amyIRDslkv7vHDCsneuu+jKS7sp5Ztww2wQrhNyusl01By6fpWGM
	3c7SX2D3Pqm/ZlSISGh4=
X-Google-Smtp-Source: AGHT+IExlveyqzWq/iI+HpAjl+KXYUu07Pi1uccvrXXdde3S6YlZRfOXFap2lAsG1rO3AkoPHEqMgg==
X-Received: by 2002:a05:6512:224b:b0:553:64ac:4670 with SMTP id 2adb3069b0e04-5539c225903mr919848e87.54.1749639874802;
        Wed, 11 Jun 2025 04:04:34 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731196sm1895284e87.197.2025.06.11.04.04.33
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 04:04:33 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32918fe5334so62238921fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Jun 2025 04:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXln7Ne2Wkb5dznN+RlOqAv5Fh7E97rjjhzMG63M/QGv31iaJWDWVa2VFaPEc9G0BDmN3i1R3TWyiTRJA==@lists.linux.dev
X-Received: by 2002:a05:651c:b0d:b0:32a:648d:5c0f with SMTP id
 38308e7fff4ca-32b21d1135cmr7885761fa.16.1749639873377; Wed, 11 Jun 2025
 04:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Jun 2025 19:04:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zi_gXQN+6y6W0AiAVBrfn6qO0=Qoy3b1ojEMNFWaBSQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGlMh3Zzni8gRt8ry0nlQX_sI9OVMA75h6YXhmJIEc5H7iod5f7NlW8tI
Message-ID: <CAGb2v64zi_gXQN+6y6W0AiAVBrfn6qO0=Qoy3b1ojEMNFWaBSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 6:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kernel=
.org> wrote:
>
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
>
> --
>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c   | 4 ++--
>  drivers/pinctrl/pinctrl-at91-pio4.c   | 6 +++---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-

Acked-by: Chen-Yu Tsai <wens@sie.org>
