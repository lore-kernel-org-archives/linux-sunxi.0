Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD2070
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 07:34:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M1HmG-1loUjm1INu-002rQJ for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun
 2021 09:29:08 +0200
Received: by mail-wm1-f52.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so4457742wmq.5
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 00:29:08 -0700 (PDT)
X-Gm-Message-State: AOAM531xPkWt+JwATnZDZBqN/z6LcKRSABVSvvmibLNubW7HakjLapA5
	PRNIb8nsMjHVUId5Gihnh+uy+GjnTDHtCfQXKn0=
X-Google-Smtp-Source: ABdhPJx1sZM7+jb/Er05kwck+NjL97VzTgij1Tl9s8181a57Xul7USu5v5ud860aYtGnhwYz/l+yS+/2ilFrTbwmUPQ=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr15633427wmb.142.1623050947892;
 Mon, 07 Jun 2021 00:29:07 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org> <20210607071916.kwdbtafbqp3icgia@gilmour>
In-Reply-To: <20210607071916.kwdbtafbqp3icgia@gilmour>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Jun 2021 09:27:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
Message-ID: <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
	Palmer Dabbelt <palmerdabbelt@google.com>, Chen-Yu Tsai <wens@csie.org>, 
	Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com, lazyparser@gmail.com, 
	wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wGArjuYm0AxZPha0bqaXIo1lUocsYMof2RCoAK3xhGbK8Ihucm5
 9a8hNnuJk+0wLvsxWyFVGcrOepztIc5nrR+ABBoMJK3UorrtHYaoGdkT4rEl/C5MjbbcQGj
 4lmQWHuqWi76NBd9xIATq7Gkv6dKcMRwqK/VEIplVtiZO00EY7CYx3Y4r4O2FJxd3bwA6Ht
 yQpfuREJTRGK37W/I7Ykg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IRX3lizS7g4=:btvhrvnGYdZWghdIRYbDk2
 vpA9zxBcW78aoi4UeOATuLztAkWIV7gGNn9KQx9iKgmO1c03CeaBDTLg1J7q9ISxro2lyGVz5
 9g9BlYbLk2FApQytGWlrNETnnJZv7rXNMihWuk6ubkZrEaqO4lQm+lGdrQsW8/CPgqrxydgg+
 LJTfsipxZQN3FdjxbLUbQQjyBmYXlZazNMLgbCpXlaRLDMYm0U+NcUPJ2bF3i/z75Buxtnb3X
 +UpXW1dBWYr5HtSXOopn7gzc9Ypf6xtJEkr6MB/STu7ZUO4c1LQTT8TBL3EhryWuEbOavvBUi
 nl9o9ggr7DJtEd5Z60Yo4Se4juGPOaZ/fyoMjQPLvGPevMaoy3Fk4jN1o1nlpPEdyFw35ZWeA
 GL+AwK92QvChIv3iBXLiNFEL2u0fZ75yB4xLdZK57qpPBL43LowymnlOdL1C2gfu13DfRzTJL
 zixMK1s5p2rGgfVjMprr+Qnry0LdPhcvXtB0urteuMP2dbuRkZTQOttSKNj311n7DOpRErTX+
 2bCU2sySACiyPQ5YOHDDv6RaHCYL5lSMmVzl8U/lnLI7ozo2sAq3UtzDBMLqcKBDCjlsvEdyS
 GtE2j+mu8+Th6rCEKkWsBR2J30uvVZr4F2QBy/27XVfF/kq8J+vDEdAsAcWeLse5uGLvP3TsZ
 9cxU=

On Mon, Jun 7, 2021 at 9:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:

> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index ed96376..055fb3e 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif
> >
> > +config SOC_SUNXI
> > +     bool "Allwinner SoCs"
> > +     depends on MMU
> > +     select DWMAC_GENERIC
> > +     select SERIAL_8250
> > +     select SERIAL_8250_CONSOLE
> > +     select SERIAL_8250_DW
> > +     select SIFIVE_PLIC
> > +     select STMMAC_ETH
> > +     help
> > +       This enables support for Allwinner SoC platforms like the D1.
> > +
>
> We probably don't want to select DWMAC, STMMAC_ETH and the 8250 options,
> looks good otherwise.

Correct: those subsystems may be completely disabled, which would lead to a
build failure, and a platform should not force-enable drivers or
subsystems unless
those are build time dependencies.

       Arnd
