Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54170
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jun 2021 09:55:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWRZr-1lrSDg2ZSt-00XpPy for <linux-sunxi@lists.linux.dev>; Fri, 04 Jun 2021
 11:55:31 +0200
Received: by mail-wr1-f48.google.com with SMTP id m18so8689707wrv.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Jun 2021 02:55:31 -0700 (PDT)
X-Gm-Message-State: AOAM532H0ieQg4c6mhQLZncVEokv0Pq2CYoAVAE2JJSBRUMCNQ5uTa6v
	ZHBmeS6jkwiSfRrcTpJEmy9mCO5k/0lsfFd0O1U=
X-Google-Smtp-Source: ABdhPJxshE3+Uw6+fWuekuuwJhK8oE6TcJIBm0QrwrkRRuWDjLhV71VM+ZrxsXwvq+Gqd5ead+heu/mutRyeZaqbM2U=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr3045824wrt.286.1622800531222;
 Fri, 04 Jun 2021 02:55:31 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CO6PR04MB7812D8905C6EEBDE8513866F8D3C9@CO6PR04MB7812.namprd04.prod.outlook.com>
 <mhng-3875d1bc-74dd-4dc8-b71d-18a8f004039a@palmerdabbelt-glaptop>
In-Reply-To: <mhng-3875d1bc-74dd-4dc8-b71d-18a8f004039a@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 11:53:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a03sxxnzpZPxNnXLtCFOFBZ6espEj4V5y=K+59dOLJc6A@mail.gmail.com>
Message-ID: <CAK8P3a03sxxnzpZPxNnXLtCFOFBZ6espEj4V5y=K+59dOLJc6A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
	Christoph Hellwig <hch@lst.de>, wefu@redhat.com, lazyparser@gmail.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:y6e4Et7PTR9OARuPX8FYQmBHfUmt+FqZDH862x+mAYqgP1fJ96k
 YrTa9Wgf923xpC6KWCjyJL5/D5g2q2Na3/Q+2Txgr0QadnwrqmIUHDWp4ohjkK5j5jzUNbE
 7bDqlIQ+ggfOR1hDUAAKLl17Xfg9ip+/ZkNDNhV4pzNxhnBA4+J+F8w30bOIME+vdL9Op2W
 oYRiXcDmTTxotmDpiGofg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7OtS1lk+6A0=:fOJCsy+6c0L4ijcTSqNwfI
 rVpGy5g1E3dMwdxywqbJSrcVK6LeOJkd8d7AFtNT09pPQaBGUZZJh206C+NLdy/bZN3JfAUa1
 sByoSfVkbu19Nb9PbNiAg/dmIvzZs3gW6cEe6zciNGdZCvQc+G7rndA2nZvFGgD2qQ/h7UN9J
 2HOd79Htt3sgqFVjDk0WxWoGsjfbIpNhLyQTSk9XrPatfiGMB83BCK0pSpA4r4spMhk5/t5cX
 9NTu2s83bIPE+pCoFsA8eB/LhcDeLS71HvWqMckhIUcjJfFV5VEtDlIp0k9/BbHpZMWp4U41U
 9HnlIU/4ldwt+RezCWFkJ0vs9NCoaXURuIfjxAS8qKVK1IvIW5yxHuXrDLQVVEZEvK8cv9CYj
 PO1hgiC9B3knxfG0LcdFuao7q2NHUutnjsOq2UjVdu3oMYTQnE/BUperPGDPklOo2GzsO/rOB
 dLoda2akQO7RujZYnobE/XUadzyOSov5ETCF1pCF1zZJ1jFyBiVbvB9GfwWpTuargoJGpJ7TO
 eLOytbQZbIAz5m/WYctN4E=

On Thu, Jun 3, 2021 at 5:39 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 02 Jun 2021 23:00:29 PDT (-0700), Anup Patel wrote:
> >> This implementation, which adds some Kconfig entries that control page table
> >> bits, definately isn't suitable for upstream.  Allowing users to set arbitrary
> >> page table bits will eventually conflict with the standard, and is just going to
> >> be a mess.  It'll also lead to kernels that are only compatible with specific
> >> designs, which we're trying very hard to avoid.  At a bare minimum we'll need
> >> some way to detect systems with these page table bits before setting them,
> >> and some description of what the bits actually do so we can reason about
> >> them.
> >
> > Yes, vendor specific Kconfig options are strict NO NO. We can't give-up the
> > goal of unified kernel image for all platforms.
>
> I think this is just a phrasing issue, but just to be sure:
>
> IMO it's not that they're vendor-specific Kconfig options, it's that
> turning them on will conflict with standard systems (and other vendors).
> We've already got the ability to select sets of Kconfig settings that
> will only boot on one vendor's system, which is fine, as long as there
> remains a set of Kconfig settings that will boot on all systems.
>
> An example here would be the errata: every system has errata of some
> sort, so if we start flipping off various vendor's errata Kconfigs
> you'll end up with kernels that only function properly on some systems.
> That's fine with me, as long as it's possible to turn on all vendor's
> errata Kconfigs at the same time and the resulting kernel functions
> correctly on all systems.

Yes, this is generally the goal, and it would be great to have that
working in a way where a 'defconfig' build just turns on all the options
that are needed to use any SoC specific features and drivers while
still working on all hardware. There are however limits you may run
into at some point, and other architectures usually only manage to span
some 10 to 15 years of hardware implementations with a single
kernel before it get really hard.

To give some common examples that make it break down:

- 32-bit vs 64-bit already violates that rule on risc-v (as it does on
  most other architectures)

- architectures that support both big-endian and little-endian kernels
  tend to have platforms that require one or the other (e.g. mips,
  though not arm). Not an issue for you.

- page table formats are the main cause of incompatibility: arm32
  and x86-32 require three-level tables for certain features, but those
  are incompatible with older cores, arm64 supports three different
  page sizes, but none of them works on all cores (4KB almost works
  everywhere).

- SMP-enabled ARMv7 kernels can be configured to run on either
  ARMv6 or ARMv8, but not both, in this case because of incompatible
  barrier instructions.

- 32-bit Arm has a couple more remaining features that require building
  a machine specific kernel if enabled because they hardcode physical
  addresses: early printk (debug_ll, not the normal earlycon), NOMMU,
  and XIP.

       Arnd
