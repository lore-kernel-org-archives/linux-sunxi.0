Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A37372
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 13:59:30 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id lp9-20020a17090b4a8900b0019ea2b54b61so259663pjb.1
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vH2YhvPec36tzF9CqFvv48FWCLMK8cS6dcfU+nnIHyY=;
        b=MULBtZwJXLYw882PNkC1wdIC6xsntlfC3Jqk68hXwFyDrHTB+5MPik7dimveBvicK9
         czoHkx9kG9TCx/Q0u/mXNOVOnge0HpxCKoo9h1TN4Th3MREoijDCtzjsI9IzhTeV8JJL
         vRiuoKD8opz3Gwxmjxn7QjH6rynmXpiiqOlLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vH2YhvPec36tzF9CqFvv48FWCLMK8cS6dcfU+nnIHyY=;
        b=EEtQmtDXTnQkKuk9CmW65Vs/35P6zwLFWpTNYN1qa3Hc4sin9U9UqoiG5pBNep0wBS
         RHvc0HRNaCx1uBJzKslKDDgl9s1CpsgM04fgNOCe5tQxCfR9eMfTzkRRn0ST+ahYHjG2
         YLZ/69AW3BZEhIO4hoIN2Z1j7pgUvh4Exkr4/OjcRlZjT1mZ/TuiavWzma6OYnB3LbzF
         zfDqSwavFcOv1KROIqgiWr9YHZ+slkE5KlBwnNwBcNjICy9aYkQY56DzblcfpNvFP23g
         LMJdDfjpL/A0qWQwbuYsx6qIVW3vO2dIXwh1wDVJBHuzikcO7T0U0i/pd2zbFhg2F4ro
         LitQ==
X-Gm-Message-State: AOAM5324OY91PuuDionbZT1DvIqxow5iPOW0x9qMjc0g4mUc1mz0ZwIx
	hOuzZRUTeeBB/HNhObAms59TPNhxVL8VfA==
X-Google-Smtp-Source: ABdhPJwM+v5uofKK7i36IV6kdhDj8PTnVD4ETvAo5GP+zdZ12Ci4fQXarzwjBy2IV59eihgWgk4uEg==
X-Received: by 2002:a17:90b:4901:: with SMTP id kr1mr2495609pjb.80.1632491970200;
        Fri, 24 Sep 2021 06:59:30 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id k127sm9372149pfd.1.2021.09.24.06.59.28
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 06:59:29 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id g2so4864272pfc.6
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 06:59:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id n13mr8008800ili.142.1632491957963;
 Fri, 24 Sep 2021 06:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
 <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
 <CGME20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b@eucas1p2.samsung.com>
 <874kaabdt5.fsf@intel.com> <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
In-Reply-To: <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Sep 2021 06:59:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
Message-ID: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
	Maxime Ripard <mripard@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Emil Velikov <emil.velikov@collabora.com>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, smyakam@microsoft.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Sep 24, 2021 at 2:10 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Hi
>
> removed most cc, due to server limitation
>
>
> W dniu 24.09.2021 o 10:03, Jani Nikula pisze:
> > On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> >> Pushed all 15 to drm-misc-next.
> > ...
> >> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
> >> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from
> >> the EDID
> > Hi Doug, Stan's reporting "initializer element is not constant" issues
> > here that were discussed before [1]. I wonder what gives, you said you'd
> > hit them on a draft version, but not with what was merged, and I can't
> > reproduce this either. Curious.
>
>
> Apparently this is grey area of unclear specification.
>
> gcc version below 8 reports error, above 8.1+ should work [1]. I am not
> sure if there is nice workaround for older gcc.
>
>
> [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18

So I think the only solution is to go back to the character-at-a-time
version. It's slightly uglier but functionality trumps form.

I'll post something today though it might need to wait a few hours
before I can manage it.

-Doug
