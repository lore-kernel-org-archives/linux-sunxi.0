Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9D70
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jun 2021 16:26:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i94so9568789wri.4
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jun 2021 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LMS6521uwLvF3d0VH9aHVTLaSPCmp9aqfX/Cw2Qkt8=;
        b=qbMma+/EYBI89XYXH6O5Gn0B1ZxLNxhf+QnPVywlVhDpm4TQtWpC0b58caEwBCMnIC
         rojWchC/QzXkvoo9WoG7CkI/9FQOI/ImTnp8KF9xJ6yXQPr8BDjhDq21NL0nfbd2sizR
         l6tqoyurBVltuw8jmKvNFidWuqunqEb0N01jo5k/NUrcQOzJHlE3WwqvUw62xOA7Jxq6
         Mo3cMHRMrgw9rnd251x5xx6gBnUmLtODkcYSyUYZV0XkokBiAOZV0tPdD1XiycamAGLX
         7nyyz9G+fmLZT4BvvIZ3qaVccg5yRvDDocQocDtbPhUwfwBS5705coTiHcjG9EbA4cG1
         YVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LMS6521uwLvF3d0VH9aHVTLaSPCmp9aqfX/Cw2Qkt8=;
        b=P1hCI1AtXMh4eM+GaFxuNEEM5Zg/M2Awh7dN/moeo+Z2XN1u4Swl1jr7SPjv8Ebqew
         cs70ZgC5k0eyIZ3tAmbS35lPpRwYlXVD1ZcKjquhfTu8VgdOeJSIcppeJyKpUV4KhSVS
         yCyqJ/LQpWQIed2QpxY6EU753QW+dnGd4K7Q0YY53mtH2HYwkvf4XSMg0ddH5CTnoJ5V
         6ahwGtR30tfxvlewl/Z+UkgbPOdRwfBD4O8p8ST5iFZeEpdT8FPJUQB8C1KLFxXpeKKP
         CP6KbEmco3KSEdR5tG0W41Zt+71pVgSSG+xia2v8E2YFIBwdOtHrwyiyPmYJegIowBkp
         Lx8Q==
X-Gm-Message-State: AOAM531oXLeMy0rq/RQtdZ7XMbHu2zqpqxBIb/6GpGJRJGaSc6HhzDML
	MJCWGqm1TZ136EvrGrI4A7k=
X-Google-Smtp-Source: ABdhPJyerIt5K+ze4U8Rv+TuJdirbauulSeSldhLjdb6CNMv2sLlQ70UGAhvFiVs4ybWr75JK9jngQ==
X-Received: by 2002:adf:fe4a:: with SMTP id m10mr13371826wrs.332.1622996792572;
        Sun, 06 Jun 2021 09:26:32 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id p12sm13492367wme.43.2021.06.06.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 09:26:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org, liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1 NeZha board
Date: Sun, 06 Jun 2021 18:26:30 +0200
Message-ID: <2490489.OUOj5N01qN@jernej-laptop>
In-Reply-To: <1622970249-50770-13-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <1622970249-50770-13-git-send-email-guoren@kernel.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

I didn't go through all details. After you fix all comments below, you should 
run "make dtbs_check" and fix all reported warnings too.

Dne nedelja, 06. junij 2021 ob 11:04:07 CEST je guoren@kernel.org napisal(a):
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add initial DTS for Allwinner D1 NeZha board having only essential
> devices (uart, dummy, clock, reset, clint, plic, etc).
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Drew Fustini <drew@beagleboard.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Wei Wu <lazyparser@gmail.com>
> ---
>  arch/riscv/boot/dts/Makefile                       |  1 +
>  arch/riscv/boot/dts/allwinner/Makefile             |  2 +
>  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  | 29 ++++++++
>  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    | 84
> ++++++++++++++++++++++ 4 files changed, 116 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index fe996b8..3e7b264 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -2,5 +2,6 @@
>  subdir-y += sifive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += allwinner
> 
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile
> b/arch/riscv/boot/dts/allwinner/Makefile new file mode 100644
> index 00000000..4adbf4b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_SUNXI) += allwinner-d1-nezha-kit.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts new file mode
> 100644
> index 00000000..cd9f7c9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts

Board DT names are comprised of soc name and board name, in this case it would 
be "sun20i-d1-nezha-kit.dts"

> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Usually copyrights are added below spdx id.

> +
> +/dts-v1/;
> +
> +#include "allwinner-d1.dtsi"
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;

This should be part of SoC level DTSI.

> +	model = "Allwinner D1 NeZha Kit";
> +	compatible = "allwinner,d1-nezha-kit";

Board specific compatible string should be followed with SoC compatible, in 
this case "allwinner,sun20i-d1".  You should document it too.

> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200";

Above line doesn't belong here. If anything, it should be added dynamically by 
bootloader.

> +		stdout-path = &serial0;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0x0 0x20000000>;
> +	};

Ditto for whole memory node.

> +
> +	soc {
> +	};

There is no point having empty nodes.

> +};
> +
> +&serial0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi new file mode 100644
> index 00000000..11cd938
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi

Current naming approach for Allwinner SoC level DTSI is "sun20i-d1.dtsi".

> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

> +
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;

Since all peripherals and memory are below 4 GiB, why have 64-bit addresses 
and sizes? It just clutters DT.

> +	model = "Allwinner D1 Soc";
> +	compatible = "allwinner,d1-nezha-kit";

Compatible and model don't belong to SoC level DTSI.

> +
> +	chosen {
> +	};

Remove empty node.

> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <2400000>;
> +		cpu@0 {
> +			device_type = "cpu";
> +			reg = <0>;
> +			status = "okay";
> +			compatible = "riscv";
> +			riscv,isa = "rv64imafdcv";
> +			mmu-type = "riscv,sv39";
> +			cpu0_intc: interrupt-controller {
> +				#interrupt-cells = <1>;
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		reset: reset-sample {
> +			compatible = "thead,reset-sample";
> +			plic-delegate = <0x0 0x101ffffc>;
> +		};
> +
> +		clint: clint@14000000 {
> +			compatible = "riscv,clint0";
> +			interrupts-extended = <
> +				&cpu0_intc  3 &cpu0_intc  7
> +				>;
> +			reg = <0x0 0x14000000 0x0 0x04000000>;
> +			clint,has-no-64bit-mmio;
> +		};
> +
> +		plic: interrupt-controller@10000000 {
> +			#interrupt-cells = <1>;
> +			compatible = "riscv,plic0";
> +			interrupt-controller;
> +			interrupts-extended = <
> +				&cpu0_intc  0xffffffff &cpu0_intc  9
> +				>;
> +			reg = <0x0 0x10000000 0x0 0x04000000>;
> +			reg-names = "control";
> +			riscv,max-priority = <7>;
> +			riscv,ndev = <200>;
> +		};
> +
> +		dummy_apb: apb-clock {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "dummy_apb";
> +			#clock-cells = <0>;
> +		};
> +
> +		serial0: serial@2500000 {

This should be uart0 and board should have alias for it. Check ARM based 
Allwinner DTs.

Best regards,
Jernej

> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x02500000 0x0 0x400>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <18>;
> +			clocks = <&dummy_apb>;
> +			status = "disabled";
> +		};
> +	};
> +};




