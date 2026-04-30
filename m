Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56297401494
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550411; cv=none; b=HgOm9jpcqrdgLJ88OLAHEmV010eO40ZCFA5elMc0E+eMmSSFh+dq0ckbJlJq7Qe/JXw0MBKBNv1rOu+lMBW7RCrJUTd3KMC42/NUuQqLMFhvU5EWkyeWK7vu8lrgc88yYQe2dh2preErhnV+wSpkKv4h3iVN4GyEUAvzugmSZyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550411; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLvy/oRrbxONiy6aN85fbE5V5PcxyE15y3AXJ3OmsSuo2sasgWzOXaOxNty5og3JShdF0Z3eWwgVK3nr+gRrgnVl7pOkhNR1j/IbqYmgDR/RI6Eu+yK+m5R/XG1j4iidJCA8nBeAjlpLXZG67yu+IjBrd6pSBzl8K6fMVR4Sn08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so1739101e0c.1
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 05:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550409; x=1778155209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=Vi1Ya01A6yvMPRvR73gsx3Oxe5yukpgKeaogieq5KwUlcoEFGTEzx6GiGWRo7YTRIA
         pP0bn8FWR2lEe6aOYYlMyt4pvPT4a6FFXHBD5X+7RyPHZsWqGy01Klmz8W9M6OmEI1oF
         89m9OJrA3BCwQI1zyvaQjwtfoolz50wrh6SYiNMHTvQjefwE99lmd/cT0yNoBGX6kKkK
         zvL+Ocb02RZn88sNNVqOYhZ/4YyEMqI3RFq6e3yxhzyZx2vWweR8nMbbDhjgCTnj81tp
         V50fjiR1x3+TMgtekZyPdja8A6OzglaoqAC2kbhMBAG/9QHskklbKnwXpeIUA0AajfrM
         9DNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IoEX5eYN/C0IPrjckbW741/WpmNG073JE2Ya8/zUjgObr8hNrfXCtQ/bJlIm/IOBavMSnUVaFWow2Ig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6wduPHH+ux0MgQAAR4HPreaItEsn67nl6qG6Kfgt74QdYO3QQ
	MH8Qved3V5FWSY1mw2FxFWukjcCvzk0XUVTIOHCXs/ZM+X6fnDkULBeB4dSf47GVxXU=
X-Gm-Gg: AeBDiesRhuVB7NPLIjT7gZ8l21/wBr412eyq2dyOKAaELrMcZP8Jp2x1rOodYn25WVL
	5uToI7t5k4JFw9M/wwQMYGbr+W24kruDs90Y4BzPU5mBbM+ucNc+R8wdaRlnkrrynYq/F+Giskb
	1934fYJnCYeAEBFRcL3Z2ASwt01vq5DVaxOs86Dh/l/OKhJaWG2DvYnM2foCzcsa816djCu10Sh
	oOoUs/NDyRNBhoZ7QLmTMO36X1yMzriyxqNmQ1aDpISEpCTVofbR7/Eiw6RuO9mbpwA+EvW3D+e
	cZgUXxI+IJ2AucuBtKvtsB2KiLGo2F26/3UJikEY4XyV+w5PuKirE50TqhdH9HRX2/J2T+c+KZW
	KON5qSY8KseCcLn1R5ItPjJTsC+dSBWujxHKw8hQomYHEkA3d28qYzxZr9OLkiWfYkiGNqsXZAT
	6UtZb/rk50FXzbKBuGu3N04FWVy5tVO7fOX94EPGHyG1P9lsk6L9bdyYU9jqAgszB0LSiODRfq/
	em+E5787A==
X-Received: by 2002:a05:6122:1074:b0:56e:e652:2c10 with SMTP id 71dfb90a1353d-573c9e6cff7mr446228e0c.4.1777550409133;
        Thu, 30 Apr 2026 05:00:09 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6df59edsm2830773e0c.14.2026.04.30.05.00.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:00:06 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-953a5defbbdso534731241.1
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 05:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92Jmzy07o5J5vRKlq+uZdUJOrf433Io7c7Agjn9e+vqGlLtvHuFjjqRAh2YLnIaycGU0fRaaUEVQH2xQ==@lists.linux.dev
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
