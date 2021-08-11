Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42F370
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Aug 2021 09:23:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id d4so4256886lfk.9
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Aug 2021 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wv2obZIW7bS+yaiNicFM8A4ncuxkejW+sA4cvAfXZlg=;
        b=jX3O/8ysjqDcQbgJVpMXjGfnrZGp+OmpsIcnbEK9hVCl+2IdLp1c21IDLPnDw4Lvyo
         9vCstxnPeIA/181verJTuJ+1jEZoFk56PYqGlaEgJN6cb8j4ptetHB7YkJIqgr+n2z21
         TIy3VC83Ukbr0Wr7lkmxqVRMncRZOugZNDq+dJFtHqZy1jkN8bTgbA8RZdDfQ/JGoM7l
         tCjPkFHa9D42lmmuaPWimBl44b20PKUaoUtTp9ciEg/ya/TZhInDQ9yrOLWDjRPUKbqi
         quAxUT/4moEE2wjxEvWtq47tzT56or6CDJZ77E80Fgo6/wRzb2/54Vn0yo2EqjuPo7Dt
         lMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wv2obZIW7bS+yaiNicFM8A4ncuxkejW+sA4cvAfXZlg=;
        b=ts0ZgPzdiU0cs7rYJyBomo880Lruaxo/j1ZuLWtw0DBU98dWDG56ohpUE6cJ62Oz/3
         tuthwyizcwJytp12Oa55CqMFwSVtUuI4PBQbyH0BayvOU1NlXbezbHGkNiZJWxINFhJb
         ewiV6DDvsbZlZu+bqxUvckOp6Sb1G7BnimLrOP02r3SA2knnjpHOlPsD4w59gwNGHlVD
         EEenlvE8UmJZ+zRvXyex/HgWfMvAg5pOyh3mmWk5MmnwC2/RFWys9GRNgWL8KzFYO4aa
         CZHOUa+n52zh5S2q6G8jLyYLCski/O/k2X+eO4tuNlxN8eChFl8vyXjQtysp/8Ukm1YP
         msmA==
X-Gm-Message-State: AOAM533YyCUnXnQoOFm3EnzZca0/kMMm+UoDabKytzDgRlNDx9tBDrzi
	1NAgegCrwbRcXdSCvbNN0A08SPTbOp68bxMfvhTH1Q==
X-Google-Smtp-Source: ABdhPJyTeVHbDouXlckDIvDSJ6/AR1HfBLteshMqv3PywJcQx+H0DVOfsZHvFYogqF2k07PL0S+wamjLfLzKzj6y9ew=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr8676419lfc.29.1628673805805;
 Wed, 11 Aug 2021 02:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210802062212.73220-1-icenowy@sipeed.com> <20210802062212.73220-8-icenowy@sipeed.com>
In-Reply-To: <20210802062212.73220-8-icenowy@sipeed.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Aug 2021 11:23:14 +0200
Message-ID: <CACRpkdaPf76ORB4wHGZdnzszb16SMUa_PEoPqhuBP+Wpfk0Hmg@mail.gmail.com>
Subject: Re: [PATCH 07/17] pinctrl: sunxi: add support for R329 CPUX pin controller
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andre Przywara <andre.przywara@arm.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 8:23 AM Icenowy Zheng <icenowy@sipeed.com> wrote:

> Allwinner R329 SoC has two pin controllers similar to ones on previous
> SoCs, one in CPUX power domain and another in CPUS.
>
> This patch adds support for the CPUX domain pin controller.
>
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

Can you send the pin control changes separately?
Also the bindings.

Then they can be reviewed and merged separately so I
don't have to pick out the stuff I can apply.

Yours,
Linus Walleij
