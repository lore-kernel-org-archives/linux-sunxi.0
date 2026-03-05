Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434EF30B514
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696881; cv=none; b=XwKCpKRB3P4t1OAEKv6iKVOMm24U4iCNuHMYGKm9J2mq8X9NMZSmCmPtBEfH3iA4dyOz4Z4DTptY958dwJke+PJTsVlIbyZCcacIi1qslUH+ZumXRDAgXhcO4vGtkGuYcU0hB088vRc9I29cQgQfWaB/pJkfVhW2CmpHuTX77GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696881; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggY8+DOmy6kiDwy5UcgYTCCg/Beb2b87HmrzMDIfVF1yRealmKpwgSnXiufWZGZozQTaIK3CLa4Pf2zHRq4ITr1Mf+R2mztPSARwIYF8SoICPwxtV8J0+HMB63IBUSPjDdle5B5sKPoHY1u0PrHtDNdr255VSimrq77BN8TTNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5673804da95so3275450e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 23:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696879; x=1773301679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=gHPUcgMCpgsjfv79PIv6nI6mHnU9Glma63graR5MtXNxufI+0cyw1QvdR80GNXzntN
         lWArONMnyTTIyVKIl4V6s/VEpVsjQSaqCFt1Y6W90bpHkbN5SEhP+ABWuKdjZzrhpdAc
         n0mY0AZNy6lkjMj+Hng2W86JCrdrSVt4dbd5uZ7f2j6ZM10gnNRZjMyTSoY7Fm35y2vh
         PdmSsv5TNjniQiPNVYFVe3aF2wPhE0q5R3bNsmZ5DhBpKrXRuwxiBzj33VOqOd0BFWRZ
         jy5fYvqJW4EzxcoBhXFa65c+ZqtgvNYCIlQG11XPFSy5VkH2yReRTimQxrYWzSNDeHDS
         gJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXRJQfn0RvMIyEspY7q7guy3qAfpEy3DUuZna1y2hHI7ndEropQHWRQcxd0ZaqIB2N3jclWBq9bPfRqhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLzR3mH8DLKaFZ9HpsdVAKlPsmGwzQVh/AODhzmFsDj2eET1us
	w0rFdqJCiAjC24Ge9wtZd+QxeTpikiuD0f5TGVWmd+XiXAow3jujYdvAzBC25YlM
X-Gm-Gg: ATEYQzws+hfSkBMWPynFbj3qBpereBVgvqObwVSu1KSR2Q8FUyLPIse9E4nls95KHj5
	oSY8oJFG+hMEFpWhg5h0+a3KCRsNBHx4NONf1TSWg6aWwdOeXj8PDONTXGJ+lWxEzDtTucFQmBs
	gCMSj6YOELj/qMuV0J4U2iHar0vc2aTlCGFw+swJG3ztCHqPRXPz9yqF0fUaL/iuWWEvCGuUzp/
	bMi57zKEEzDXCGCMFiQ4pbXtn/J9l6OCnhy8mEdMdgW+orpDdYqku+QhDFA1/F8FoAxT4BWSaUq
	/bl1oFwVCdCcDfl7Ab6PIsECMWs0txe/4FCIqvz01MMo+toKy+KZ+Cs0eeI2gbvRiej1/INXw6B
	jvpd0zgFGsflVaX/j9Wm+yDujNnZRDfiATjStavy9fr0qe/WoGXgHrwGC5FvL27Pwih0txfBxZI
	q19CoZUVLAd6sP+7lPfp89zyEy+m1G3c3pCaXu2kbfDCs0brmzjxqTY9I/k4cT
X-Received: by 2002:a05:6122:8c01:b0:567:516f:256c with SMTP id 71dfb90a1353d-56ae77d338cmr2149578e0c.16.1772696879210;
        Wed, 04 Mar 2026 23:47:59 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae7a29c2esm5008966e0c.7.2026.03.04.23.47.58
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:47:58 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffa0b23a60so857998137.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 23:47:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzltK9xAmMk5Qc8nTDsa98/wmeHxF7ev5QE53eQaybDw2/pYmifjupAIbGGihdR8imB5QDvd0/bhf3Nw==@lists.linux.dev
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
