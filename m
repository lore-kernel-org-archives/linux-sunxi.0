Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360CB70
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Jun 2021 21:27:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBlgy-1lfPT51Rqm-00CDP8 for <linux-sunxi@lists.linux.dev>; Fri, 04 Jun 2021
 23:27:55 +0200
Received: by mail-wr1-f53.google.com with SMTP id z8so10567032wrp.12
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Jun 2021 14:27:55 -0700 (PDT)
X-Gm-Message-State: AOAM5307oDzz/dzSW9bpC1EMtEP3+a9Pl31RotpPZQdwf3jUKRXyp0aF
	uBynVelmIQzipZFWr+p6ml5X7r2QHbh3eaZU+9o=
X-Google-Smtp-Source: ABdhPJzJDHuyMCqX6WOws3xbJdiVdgcELrwsCfZOh8KOJCGiTnqEKWWc8yDd/bMkdxBixLXUQF+S4GmeCWLLk2+jBEc=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr5998470wra.105.1622842074948;
 Fri, 04 Jun 2021 14:27:54 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJF2gTTpurWpPUcA2JkF0rOFztKQgFBhOF9zQyuyi_-sxszhRQ@mail.gmail.com>
 <mhng-423aeaad-9339-4695-9a85-f947dd6135ac@palmerdabbelt-glaptop>
In-Reply-To: <mhng-423aeaad-9339-4695-9a85-f947dd6135ac@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 23:26:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04C8HObpSHNYqQpe4V96MoSLs7sEpiPvp4OpvyAU1_fQ@mail.gmail.com>
Message-ID: <CAK8P3a04C8HObpSHNYqQpe4V96MoSLs7sEpiPvp4OpvyAU1_fQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>, 
	Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
	Christoph Hellwig <hch@lst.de>, wefu@redhat.com, lazyparser@gmail.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AaKhn3fLFVmxMQA2Dp6Nqe4WjyggoE1/ppHv4kPR8YEFBuCTqPF
 QjGdVcgy9x7UgrAGtPdDExVOEQg2cLSL+39+ZQcMdY45Oi5Vo7x1ovRdHDDHFDp/aj4bkp+
 jZHO9J1c6P4VRjB9F+Pv5wZNe639rgF3G5+Xp9xG18Nrd+pNBhFwCI6AFeEoEz4hfnxSSkR
 Z9n2RxT/NmaRSfjPsQyXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yo6HgNoxois=:LJsuIY0lS+f1JDtvPKr+Gb
 fxcATzMCTQ5eYS4G1WsiccZChwkBc9gBoWfmlmohaytsKESIgGC3LGF46DFmlxGz4i2Vd8dmD
 XfbtKnIfywZ3pYz13HCafu9ljlbdqrNvJTOI45BV5IKSkud+NushF7A7TvSSgcJzhuy3lS4tf
 +u3bi3y5JYzlj9BOMu/Ue7pSOumEmJy/zgvDxwDOn49o3hWjGDI/QZP0EvIPkEtT4lc5dLDg6
 2bFlBDK1cpKdkFo9sX47hg1xvgOvVLzd804aKDZRzAppttncAX3ScqNQzEyIp+TKJYnPqyEtr
 XUFyj8zqNM6BWW6ukM7KIdAXeLB2SVu1DOi6yVWGfJ+USeBJKLF9A036E80FIKVRc63iKhE8/
 TLc9RDysdYl8F25IOY0LPXpqgXILlB0KrJex+bEYGVsrqTWcvmGPBXepcaYh5H6VkxUx9qQ6V
 rCOkUv8qeoC2JtIuBSmTpUR9C3n+i/0hHeNTGUA9rEBiGRwK+jQwFDprQt/MUpR7+lJz6rVER
 OtJqFWjirmJ8ctAYx2bPr8=

On Fri, Jun 4, 2021 at 6:14 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:

> The hope here has always been that we'd have enough in the standards
> that we could avoid a proliferation of vendor-specific code.  We've
> always put a strong "things keep working forever" stake in the ground in
> RISC-V land, but that's largely been because we were counting on the
> standards existing that make support easy.  In practice we don't have
> those standards so we're ending up with a fairly large software base
> that is required to support everything.  We don't have all that much
> hardware right now so we'll have to see how it goes, but for now I'm in
> favor of keeping defconfig as a "boots on everything" sort of setup --
> both because it makes life easier for users, and because it makes issues
> like the non-portable Kconfigs that showed up here quite explicit.

It's obviously easy to take the hard line approach as long as there is
so little hardware available. I expect this to be a constant struggle,
but it's definitely worth trying as long as you can.

> >> To give some common examples that make it break down:
> >>
> >> - 32-bit vs 64-bit already violates that rule on risc-v (as it does on
> >>   most other architectures)
>
> Yes, and there's no way around that on RISC-V.  They're different base
> ISAs therefor re-define the same instructions, so we're essentially at
> two kernel binaries by that point.  The platform spec says rv64gc, so we
> can kind of punt on this one for now.  If rv32 hardware shows up
> we'll probably want a standard system there too, which is why we've
> avoided coupling kernel portability to XLEN.

I would actually put 32-bit into the same category as NOMMU, XIP
and the built-in DTB:
Since it seems unrealistic to expect an rv32 Debian or Fedora build,
there is very little to gain by enforcing compatibility between machines.
This is different from 32-bit Arm, which is widely used across multiple
distros and many SoCs.

> >> - architectures that support both big-endian and little-endian kernels
> >>   tend to have platforms that require one or the other (e.g. mips,
> >>   though not arm). Not an issue for you.
>
> It is now!  We've added big-endian to RISC-V.  There's no hardware yet
> and very little software support.  IMO the right answer is to ban that
> from the platform spec, but again it'll depnd on what vendors want to
> build (though anyone is listening, please don't make my life miserable
> ;)).

I don't see any big-endian support in linux-next. This one does seem
worth enforcing to be kept out, as it would double the number of user
space ABIs, not just kernel configurations. On arm64, I think the general
feeling is now that we would have been better off not merging big-endian
support into the kernel as an option, but it still seemed important at the
time. Not that there is anything really wrong with big-endian by itself,
just that there is no use case that is worth the added complexity of
supporting both.

Let me know if there are patches you want me to Nak in the future ;-)

> >> - SMP-enabled ARMv7 kernels can be configured to run on either
> >>   ARMv6 or ARMv8, but not both, in this case because of incompatible
> >>   barrier instructions.
>
> Our barriers aren't quite split the same way, but we do have two memory
> models (RVWMO and TSO).  IIUC we should be able to support both in the
> same kernels with some patching, but the resulting kernels would be
> biased towards one memory models over the other WRT performance.  Again,
> we'll have to see what the vendors do and I'm hoping we don't end up
> with too many headaches.

I wouldn't specifically expect the problem to be barriers in the rv64 case,
this was just an example of instruction sets slowly changing in incompatible
ways over a long time. There might be an important reason for version 3.0
of one of the specifications to drop compatibility with version 1.x.

          Arnd
