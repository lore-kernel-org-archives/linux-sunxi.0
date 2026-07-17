Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE33F4102
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287593; cv=none; b=Is+ehQEMq0fyyc/QPhUYi0XKU+nRT8XfT4Id1F+d5y9StZctQMWoiei7+h2Lg0F0oBA7dnxlEke19gTvxi6RjPbFel9xmiFKZ1J8A/AiLHCML5LiiQ5BgJrpyDCOv3ZqIrlVCGAsbR2z/SOMvZFA0XEMohmuMLFumppZKV9Pxms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287593; c=relaxed/simple;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zl1/8xZBnYA0LGd1aVROEWadVAp+4n4TNvHlgdLL5L5VHwTRuW0RiOAWw9RwbkV0gS0vKveT6IO/m64d7gZYikvUKiJFXXcomURX98rD0FLMCBgYylc2yZo24OOj+s4/VOLHAfDlkBOvKMQ31P4lMX8zfzuGbEWKvDPxV41Bf54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tz9KiGH4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tz9KiGH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784287580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	b=Tz9KiGH4CJ5ECbcCYm4nFLCj8efZERxj7BXNRFSfpbno92VhNRMXPMEQg7BwGL36dL9YYy
	3AthkD1ewJ9M7cqus5Rx5tf5ElYXcXnBJvFz5TgL1nEfbZEWuBIQZKbI/eJogiWxz5d89M
	SO0RiJe7uTolVO30jPs+uZEd6SDEfYM=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-aUhA17pzPr2KBTHB_fay2g-1; Fri, 17 Jul 2026 07:26:18 -0400
X-MC-Unique: aUhA17pzPr2KBTHB_fay2g-1
X-Mimecast-MFC-AGG-ID: aUhA17pzPr2KBTHB_fay2g_1784287578
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66807ba1ce8so4228148d50.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 04:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287578; x=1784892378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=g6v9FNWFhU7cziPDoKy/DMD5IC1ybAeUpud6XFSLv+OTHW7LtiWEO1HwKHdXUaKcwb
         mem1PWizPSpOg4N9AxlMGnJ2qaqgVXZmqu9QbaLrtwzwgsogvHaoWKM821mDSnxeMRJp
         qcEPcFW4SGZaHPZDTHN60/yeia5MclhpqX8v93XBznJ7p+9qvsMMHi90ETOZ0/5TiCqd
         DSCz3lpwfgXI/CniQyL20xCMufaJ/U94ZoRNQww2UpSnwPLqNDiXEr1LsofpEc/+t9zT
         /EBZSf7uHEPBlPkjc+763VIO4/B6b8g+BDTHHXdwOFiER5TcgJh5gYq+88IpILFAI1Tj
         1oxA==
X-Forwarded-Encrypted: i=1; AHgh+RpJSYgEeUgCp7eAm/pW2lGqvvAqtFm7eSNdphD5aG4dBsaDMhF/EQQmrgxX0qH66+8eqwfGHWgIxc9+aA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAW6MbvK9JjfMLwdExrVLyPq7iQ8yiiffx7Uiv/AGYgIv1vEoI
	sv9rSdThrnl1R+wbXVZZsjymN0Ms1sP3q954jR7XI9Qg9+eBbCS35pvOjo+EKm71DLmVOpFkJt+
	MZ9qnPE3zmL1lD+ZFnOyhOTcsvJHuf3Kt8LtelHrOJYHmzjer3nDPVP+zPxTHBtsUTUL3WCcXKY
	GC4VaKuLEbhkOzXT/61i6utoLaxP+vSiwlRT/3RYQ=
X-Gm-Gg: AfdE7cmmFGbxACvLJJNYkXcsJ4PdGSumtv8/i/eV+zKy65bQ2+ko/oG7jLmfmmcMOM+
	1t+FR0KIJp5WqQi/E8M6s81OmNg5hnuSJLKVj0RlG0Bzyi5ucH5KO+oRebP0V+bTs+pLfUFTh7w
	p2qKvVBia7ne6M8iI9eLCS64GiiMSpd7z/yv9GtfLQXZ419FpnIvHAijWM
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id 956f58d0204a3-66843ce511emr36179d50.53.1784287577987;
        Fri, 17 Jul 2026 04:26:17 -0700 (PDT)
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id
 956f58d0204a3-66843ce511emr36162d50.53.1784287577611; Fri, 17 Jul 2026
 04:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com> <20260717-heavenly-peach-guan-82f0f1@houat>
In-Reply-To: <20260717-heavenly-peach-guan-82f0f1@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jul 2026 13:26:06 +0200
X-Gm-Features: AUfX_my0X2LQ6M_jKeRcxy0r6pG-sYFIFgqEmiZmXcdV57T8jjudIQuMMnSFyJg
Message-ID: <CADSE00+7=2ph4kRQLc7_MFbp_SSt3eYz-bBxWcfCj6_oFPjwFA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm: release panel reference after panel bridge creation
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uujp25DLuHfcE9oGP8JXfyIKBejatZsQKF63kQv6ZJQ_1784287578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:56=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Mon, Jul 13, 2026 at 01:53:08PM +0200, Albert Esteve wrote:
> > Update a second batch of drivers calling of_drm_find_panel() or
> > drm_of_find_panel_or_bridge() to release the lookup reference after
> > wrapping the panel in a bridge.
>
> I would have expected this to be squashed of patch 3, any reason it's in
> a separate patch?

My intention was to make the series easier to review. Patch 3
contained the initial set of callers mostly found via the Coccinelle
script (simpler to address generally), and patch 5 includes the rest.
Including all the changes plus the core API update in a single commit
felt like too much.

That said, I am happy to squash this for the next version (fewer
patches to track).




>
> > Also handle the cases where a panel is found but cannot be used,
> > dropping the reference immediately in those paths.

