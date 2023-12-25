Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8635380E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Dec 2023 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdEOtmnK"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7810c332a2cso345713485a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Dec 2023 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703538410; x=1704143210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGDVYoNIIWyiCkgdSSFbUJbJwyQv1O09fglEbTWCQV4=;
        b=FdEOtmnKZ3AMkvZ/PBAJDtykx1jV83YLhCYizw1KeAohX+M7bX/sgcMU0Zxl3jMp2u
         nuIR7h6xH8+fKVEPx3LNqrTG1EFpnZ0lzeZw5eEAbVAGX/1Tlk1Bt3wWFopT4wwzGrfy
         yfz6omWg8mrtxvp2KH/mcQYqE34A9BkM3pQsxVzaNeSvEGkJQgqgLWzsCwpWiP1tWH2D
         9GQxEMneXyHqph1yoNA8Lp54leqAvZEfoV9x8KQHZLNr8WM0lOilPdhvoKi0Ts89md7C
         xw0IZk+bkmxcaZgA92PFZQ7LKR/geqxNkRnHkNjHCxszRh4S6cY02j34xTLD3PyOKsvV
         7Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703538410; x=1704143210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGDVYoNIIWyiCkgdSSFbUJbJwyQv1O09fglEbTWCQV4=;
        b=hgPNo+xdI7DzozGweNGYmkI6XhzaMBliMvFeUYDoEIM9koAJH61PJGLkJ7R8sqvrgC
         N7/LrHi+XByJ5QrOtl0QSsMw4uex2l8Cke+Z4o69sWbMQ+vV5tM/xI4VjzkcRbmi8B6d
         4GTM+wetLsnBNI6XygUTTwGRZOGCtjrpNSeeL4xU0Ff0NjaScYgeyc15wppHsBxHSorj
         0qTyz6DLm0YJovVOX1FyI5M7x3GUPl2UfSF9FkvbcuSzAjaTGKXDGK6v+3wRUKz316TJ
         x+z+5SEEwU9a6ep9pg0spm9siwq4D9gMFpCMwITRZVS6yCeVlHP6VOBppwd9c7DlkM0j
         IQNw==
X-Gm-Message-State: AOJu0YxZPVfhNin8Aa7/slWDOINJlYcfjuoTF572sxGfLNspe27ECfEJ
	7DirvpY6YVegvL9u2QLraedbtj/8yDitlCxrqbs=
X-Google-Smtp-Source: AGHT+IHTfC4IvI32xoqINCBSsocRoTKNzkLjTfpAEtn6LgG4kDC6m58rQ0mR6tMnU/vPvukNQS74BZgTSh6h+p/YqWY=
X-Received: by 2002:a05:620a:14a9:b0:77f:8c54:da15 with SMTP id
 x9-20020a05620a14a900b0077f8c54da15mr7742403qkj.40.1703538409803; Mon, 25 Dec
 2023 13:06:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231225103308.1557548-1-peterlin@andestech.com>
In-Reply-To: <20231225103308.1557548-1-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 25 Dec 2023 21:06:04 +0000
Message-ID: <CA+V-a8t7g8ctPQrwdB9tgtmgtGfqQ-k2N-1sSwnjB-b1F71-AQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/16] Support Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com, 
	chao.wei@sophgo.com, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lin-san,

On Mon, Dec 25, 2023 at 10:37=E2=80=AFAM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi All,
>
> This patch series introduces the Andes PMU extension, which serves
> the same purpose as Sscofpmf. To use FDT-based probing for hardware
> support of the PMU extensions, we first convert T-Head's PMU to CPU
> feature alternative, then add Andes PMU alternatives.
>
> Its non-standard local interrupt is assigned to bit 18 in the
> custom S-mode local interrupt enable/pending registers (slie/slip),
> while the interrupt cause is (256 + 18).
>
> Mainline OpenSBI has supported Andes PMU extension:
> - https://github.com/riscv-software-src/opensbi/tree/master
> Linux patches (based on v6.7-rc7) can be found on Andes Technology GitHub
> - https://github.com/andestech/linux/commits/andes-pmu-support-v6
>
> The PMU device tree node used on AX45MP:
> - https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_supp=
ort.md#example-3
>
> Locus Wei-Han Chen (1):
>   riscv: andes: Support specifying symbolic firmware and hardware raw
>     events
>
> Yu Chien Peter Lin (15):
>   riscv: errata: Rename defines for Andes
>   irqchip/riscv-intc: Allow large non-standard interrupt number
>   irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
>   dt-bindings: riscv: Add Andes interrupt controller compatible string
>   riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
>     INTC
>   perf: RISC-V: Eliminate redundant interrupt enable/disable operations
>   RISC-V: Move T-Head PMU to CPU feature alternative framework
>   perf: RISC-V: Introduce Andes PMU for perf event sampling
>   dt-bindings: riscv: Add T-Head PMU extension description
>   dt-bindings: riscv: Add Andes PMU extension description
>   riscv: dts: allwinner: Add T-Head PMU extension for sun20i-d1s
>   riscv: dts: sophgo: Add T-Head PMU extension for cv1800b
>   riscv: dts: sophgo: Add T-Head PMU extension for sg2042
>   riscv: dts: thead: Add T-Head PMU extension for th1520
>   riscv: dts: renesas: Add Andes PMU extension for r9a07g043f
>
The above patches dont apply cleanly on top of below branches. Can you
please rebase and re-send.

https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=3Df=
ixes
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=3Df=
or-next
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log=
/?h=3Drenesas-dts-for-v6.8

Cheers,
Prabhakar

>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +-
>  .../devicetree/bindings/riscv/extensions.yaml |  13 ++
>  arch/riscv/Kconfig.errata                     |  13 --
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |   2 +-
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |   2 +-
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 128 +++++++++---------
>  arch/riscv/boot/dts/thead/th1520.dtsi         |   8 +-
>  arch/riscv/errata/andes/errata.c              |  10 +-
>  arch/riscv/errata/thead/errata.c              |  19 ---
>  arch/riscv/include/asm/errata_list.h          |  19 +--
>  arch/riscv/include/asm/hwcap.h                |   2 +
>  arch/riscv/include/asm/vendorid_list.h        |   2 +-
>  arch/riscv/kernel/alternative.c               |   2 +-
>  arch/riscv/kernel/cpufeature.c                |   2 +
>  drivers/irqchip/irq-riscv-intc.c              |  89 ++++++++++--
>  drivers/perf/Kconfig                          |  27 ++++
>  drivers/perf/riscv_pmu_sbi.c                  |  47 +++++--
>  include/linux/soc/andes/irq.h                 |  18 +++
>  .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
>  .../arch/riscv/andes/ax45/instructions.json   | 127 +++++++++++++++++
>  .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
>  .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
>  tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
>  24 files changed, 592 insertions(+), 151 deletions(-)
>  create mode 100644 include/linux/soc/andes/irq.h
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.=
json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructi=
ons.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.js=
on
>  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch=
.json
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
