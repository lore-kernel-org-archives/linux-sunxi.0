Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB4ED2;
	Wed,  3 May 2023 08:56:41 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-55a6efe95c9so39257557b3.1;
        Wed, 03 May 2023 01:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104200; x=1685696200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLIjSxvkFoShCDz7/AeeChAXiJ9TCtnKs3s5wZ5JN+8=;
        b=IfduI/tHb2F0dh20tOn09HepZSyYdPTz78LawBlT98ZN3gPxI2cESeDTGkFNZF8W9j
         6u9/0IuGG9qBrBotZN+YtWbMVJM3ZO7pmZELhgH3IoX1Dse5gAY08jeqXgo3TOd/Op2C
         KCx4GqlExW2HrVFnD5aAWmsNqqWVOkOhaaoZgFItXsWAPdVaTJp0xOw1bXjcVQxvFCU/
         LRK2q7SPdCbSyDAKdDjHlOVja19BJtKKwWKvaerq580F/Dxon3an/a0d78zcjjTyE/3J
         jGak5630LbmjRha7YtjjHPhgva5SozMSeTzh70glRt8apKKgRlCxi++vIJ1FMABJYtVU
         7ivg==
X-Gm-Message-State: AC+VfDx0v70Elb6cEb47CEWopJ+TUK4u4ELK+g6GSTTUmBJtVj/CuAmb
	wBEjLfSicq4A02vn8fbkICXVQaJATxiXXg==
X-Google-Smtp-Source: ACHHUZ7+G6C+hb8D8R1mYZO9rlZaVvL7iqhrKo+sT0Yq32NiGDaUlt3ErZDYq2wobyNVDdqjVVKa9w==
X-Received: by 2002:a81:52cd:0:b0:55a:20d5:e103 with SMTP id g196-20020a8152cd000000b0055a20d5e103mr12905018ywb.34.1683104200211;
        Wed, 03 May 2023 01:56:40 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id n143-20020a0dcb95000000b00555df877a4csm1322974ywd.102.2023.05.03.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:56:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55a6efe95c9so39257237b3.1;
        Wed, 03 May 2023 01:56:39 -0700 (PDT)
X-Received: by 2002:a25:fc1b:0:b0:b9a:6f77:9018 with SMTP id
 v27-20020a25fc1b000000b00b9a6f779018mr19158460ybd.41.1683104199175; Wed, 03
 May 2023 01:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjKwfBizmH8cZYEmVC2ZYLLqQG4kyrHm6Ct0j4EK4eQg@mail.gmail.com>
Message-ID: <CAMuHMdXjKwfBizmH8cZYEmVC2ZYLLqQG4kyrHm6Ct0j4EK4eQg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, May 2, 2023 at 9:40=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:
>     'r7' : 'renesas',
>     'r8' : 'renesas',
>     'r9' : 'renesas',
>     'emev2' : 'renesas',
>     'sh73a' : 'renesas',
>     'gr-' : 'renesas',
>     'iwg' : 'renesas',

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
