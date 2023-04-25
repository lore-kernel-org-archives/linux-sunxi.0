Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B57B;
	Tue, 25 Apr 2023 07:28:07 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-54fc94476e2so63676137b3.1;
        Tue, 25 Apr 2023 00:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682407686; x=1684999686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGl5U27dIAVcoPRAhAw7M++MtUvlNkzHHP3i/+uz8BM=;
        b=EBzDrBYDef+hyvN6tYgaPNH3i6bKzTQWJRpJge1XAtefLn0acoCgHF2ZnXnkiq6JKR
         ta4xAZeWfOTkDu1DMeKkMHh3eyFu/kX/7z87g2OXPceAJkEdGNN21q2m9HCMuiMc5B5M
         U9UZvh+68JQ3933kuZ5S489e3i0c0lXOjIUBnG/yrtti0FByGz1r2FmTcwUQCTg4yu8M
         wM2D3vqTBYJTrrJiI6DnPb+T6YWI0wlgPB214TSk/nYds+Ix5E4ermkj0nIKKiEO/ET2
         p4ttEh01veICtnxs0xZ4m3GkIbgHYJvfSScqZVU91ibUmi3SMfzTusL/SfSsr8Jng4OR
         xFTQ==
X-Gm-Message-State: AAQBX9edwy/PdwgtNQH92lYfIe262F/6+v/C6aidERXJqQ4umDX4fqkv
	MIoHSxOYtt431XFe2zNJAgHYNkOy6G5WIA==
X-Google-Smtp-Source: AKy350aRcvHlGtGzvWgMwOuxf/s8yGgIV1wpq7S0ZIRPUloSnhxm1zWN/vkDqydgJIQXvd24QhMZCw==
X-Received: by 2002:a0d:d905:0:b0:54f:5cec:a643 with SMTP id b5-20020a0dd905000000b0054f5ceca643mr10265449ywe.41.1682407686168;
        Tue, 25 Apr 2023 00:28:06 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id d197-20020a814fce000000b0054f8de7c6f1sm3432202ywb.70.2023.04.25.00.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:28:04 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54fe2e39156so63555777b3.2;
        Tue, 25 Apr 2023 00:28:04 -0700 (PDT)
X-Received: by 2002:a81:4e4a:0:b0:54c:9c2:d1be with SMTP id
 c71-20020a814e4a000000b0054c09c2d1bemr10102189ywb.13.1682407684508; Tue, 25
 Apr 2023 00:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 09:27:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Rob Herring <robh+dt@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.org> w=
rote:
> I have a script[1] that does the conversion written the last time this
> came up. Just have to agree on directory names. I think the easiest
> would be for Arnd/Olof to run it at the end of a merge window before
> rc1.

"emev2" and "sh7" are missing for renesas.

Does your script also cater for .dts files not matching any pattern,
but including a .dtsi file that does match a pattern?

> I'm very much in favor of this happening especially before *any*
> overlays are added to add to the mess (it's probably already
> happened).

;-)

> [1] https://lore.kernel.org/all/20181204183649.GA5716@bogus/

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
