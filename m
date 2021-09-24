Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219C43FCB
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 14:56:19 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id k26so4502172pfi.5
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BTzhRmtCWqSMLNXYgMz/A9yGJztHmzn9VR2FvTuT1X0=;
        b=SKj11i9J4weHpWL5gca5C27GtKyeqnzkCdtcpOIE6SIBamXV+/M7CCgWI59YoHaNnN
         iSF1u8VJNmzdE20M16uM0tZzJoOCJvjCiAKadITYS8Nm4YpI6rE0IFZKalF9NOxRcEoO
         HNl464XYupmzvQxjt3QsQLi35uS7yBRNytTbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BTzhRmtCWqSMLNXYgMz/A9yGJztHmzn9VR2FvTuT1X0=;
        b=jLgkIZPN9f1zdPnXZs38nYtDBX4Nx/T0vwMp/zLe79SJiCydboI6WKBLBUbFVJ2C6Y
         vjGMZqlF+EojpEF2GsWl4DLzGwfdx48uVRRNwuGeptAKGZzamQfDAd4LhNp/YwrlqPoX
         +utmXkPtpnXYFv3W8QthiyeVXYZiwqcmEATpcrc9/1TUMAH9oXJvUUrlY9uttgU6cZfP
         X8uAo7lS6mcBoOL07ZxsZfmuQvGlUzLGXZiAm9Pnq4LCF2q1gQWrTkfyMKICMNsK/JLt
         vHFH/79qjlApp0CJZwoW2C3/n8XTjUZ4PdBnjPtvZCy+IT4VDdHfY+85mlxGtfhnOiId
         yPjA==
X-Gm-Message-State: AOAM531CLnp3xv4taJkOC5qTCylfx78LauefyGB/vyFQ0OyzMUEscci9
	odpMR2rbTInNFvfo2S/CIPTDdaTuksJCeA==
X-Google-Smtp-Source: ABdhPJxT3OGLWNbM51/upe8NkdM110N/ch7lXgQjvCQC2MFtKAmHE1kb7+AOAcfz8KDJem8dc3KmYw==
X-Received: by 2002:a63:2b12:: with SMTP id r18mr4080405pgr.256.1632495378506;
        Fri, 24 Sep 2021 07:56:18 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id a12sm11797904pjq.16.2021.09.24.07.56.17
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 07:56:17 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id 17so10101840pgp.4
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Sep 2021 07:56:17 -0700 (PDT)
X-Received: by 2002:a6b:3f02:: with SMTP id m2mr9047097ioa.136.1632495366689;
 Fri, 24 Sep 2021 07:56:06 -0700 (PDT)
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
 <874kaabdt5.fsf@intel.com> <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com> <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
In-Reply-To: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Sep 2021 07:55:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7V0MLy9XeA=vb_dpMS6ZBKkrGS_dC8uMeAxOeok5C3g@mail.gmail.com>
Message-ID: <CAD=FV=V7V0MLy9XeA=vb_dpMS6ZBKkrGS_dC8uMeAxOeok5C3g@mail.gmail.com>
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
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Srikanth Myakam <smyakam@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Sep 24, 2021 at 6:59 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Sep 24, 2021 at 2:10 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >
> > Hi
> >
> > removed most cc, due to server limitation
> >
> >
> > W dniu 24.09.2021 o 10:03, Jani Nikula pisze:
> > > On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> > >> Pushed all 15 to drm-misc-next.
> > > ...
> > >> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
> > >> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from
> > >> the EDID
> > > Hi Doug, Stan's reporting "initializer element is not constant" issues
> > > here that were discussed before [1]. I wonder what gives, you said you'd
> > > hit them on a draft version, but not with what was merged, and I can't
> > > reproduce this either. Curious.
> >
> >
> > Apparently this is grey area of unclear specification.
> >
> > gcc version below 8 reports error, above 8.1+ should work [1]. I am not
> > sure if there is nice workaround for older gcc.
> >
> >
> > [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18
>
> So I think the only solution is to go back to the character-at-a-time
> version. It's slightly uglier but functionality trumps form.
>
> I'll post something today though it might need to wait a few hours
> before I can manage it.

I managed to squeeze it in before my other obligations:

https://lore.kernel.org/all/20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid

I didn't CC everyone here but dri-devel and LKML are copied so
hopefully if I missed someone it should still be accessible.

-Doug
