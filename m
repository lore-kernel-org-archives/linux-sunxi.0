Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1920E5;
	Tue, 29 Mar 2022 09:04:26 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id v2so14663038qtc.5;
        Tue, 29 Mar 2022 02:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LLXUdiKn5zGolda6p6nU0L90Q8R5gkNG4kyWBHOgl4=;
        b=NQmRHx5zk81/eEsDMFGpOpMjQLUG/o0R+1x1/Y5vQMKz2xgLXqDXUyrObHq0g1T9i9
         5X+4AG56tTBKmIpqDgAfksJXOEklB/J4AVJp7dKvVcaMAtsd2Na17eDWz/ytgnyf/7v+
         LH0ieSInnZsg3jE+jRCTAEyO+LCjg3JZbLzwEYULzY9nuc2werZfHgHQRRGlJniMTL2O
         3b4YIv6NqoHwV5YcQ5fRaeAZaXsQCAfQiQOeXhMi21nsST0xpjWys2WP0vp+tqoIqbH0
         mqF/YIJXLIIZz/OhDRtrONbHw9dcGxeazwWLzJznHcAaBeAdbQB1Q8RusaoJw8kK3GwE
         PfaQ==
X-Gm-Message-State: AOAM5312PUVVGz4CtI+otYOqClt7Vn178an2cVrx9eM5zot4R9LUur8d
	+lC3Ngi8YwQ5al2oNgzZitl8D6XQTJnV+A==
X-Google-Smtp-Source: ABdhPJxSpYppNuPlVP76reMOneUJYYr1pAC+lbAx3hbSUsd1F2t56Iv7wXZwNseTKRdCGpZjVylxHQ==
X-Received: by 2002:ac8:59d4:0:b0:2e1:f86d:b38c with SMTP id f20-20020ac859d4000000b002e1f86db38cmr26344373qtf.285.1648544664705;
        Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id k2-20020a37ba02000000b0067dc1b0104asm9094142qkf.124.2022.03.29.02.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2e592e700acso176125197b3.5;
        Tue, 29 Mar 2022 02:04:23 -0700 (PDT)
X-Received: by 2002:a81:24d6:0:b0:2e5:b253:f9fc with SMTP id
 k205-20020a8124d6000000b002e5b253f9fcmr30366724ywk.438.1648544663596; Tue, 29
 Mar 2022 02:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
In-Reply-To: <YkK691VG6ON/6Ysn@atomide.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Mar 2022 11:04:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Tony Lindgren <tony@atomide.com>
Cc: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-actions@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-arm-kernel@axis.com, 
	linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra <linux-tegra@vger.kernel.org>, linux-oxnas@groups.io, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-unisoc@lists.infradead.org, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Tony,

On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
> * Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
> > On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
> > > as the title say, the intention of this ""series"" is to finally categorize
> > > the ARM dts directory in subdirectory for each oem.
> >
> > While I agree with this change and think it's for the good (browsing
> > the ARM dts directory at the moment is frustrating..) I think
> > buildroot and others need to be told about this as it'll potentially
> > break their kernel build scripting for ARM and probably messes up the
> > configs they have for existing boards.
>
> Yeah.. And ideally this would be done in smaller steps as these will
> conflict with all the other pending patches.
>
> For example, I have a pile of pending omap clock clean-up dts patches
> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> redoing or fixing up the patches with sed :)

Git merge/rebase/cherry-pick should handle renames fine?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
