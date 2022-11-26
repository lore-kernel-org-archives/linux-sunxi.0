Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE01FD3
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 16:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFC9C433C1;
	Sat, 26 Nov 2022 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669480590;
	bh=0Khn6uWcuaNQoPsb0Ucb4JBc6cPi3AmB1rZoqw5H0jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LT/64CkCqT+lxpRwMlb0KPm5sqLpTCk95JsD1IWWh4mcbpHyd82D1KqcAlRI+OkIh
	 cIiYzXUfYM3c8zeTpKTP3uZt5LhfxclEWgOMtvGYMFjbmfo78FCY9VcFx0nnKYC+GP
	 V6+jbQBJqzvyRL8bNK5trTe5buT5KknL0I4kexZdXu1uLbcpC8+lBHIvwDyHZYcw/J
	 FMdU6Czuv4Iv2Gx+Gri+zGSP/gk3oQ8vIYcY/fXQBdkki/P1sXLmiLgPS9y7+y3BWD
	 lAN3Zg1rFIxmebAGn7jEAKR/bjc1GR3bAyhLf0GP6eUQPhrc/qDDKVWhUoTvIfEp3e
	 LvHU2sa5QVNiQ==
Date: Sat, 26 Nov 2022 16:36:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 11/12] riscv: Add the Allwinner SoC family Kconfig
 option
Message-ID: <Y4JAh72RUJFS/RtR@spud>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-12-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125234656.47306-12-samuel@sholland.org>

On Fri, Nov 25, 2022 at 05:46:55PM -0600, Samuel Holland wrote:
> Allwinner manufactures the sunxi family of application processors. This
> includes the "sun8i" series of ARMv7 SoCs, the "sun50i" series of ARMv8
> SoCs, and now the "sun20i" series of 64-bit RISC-V SoCs.
> 
> The first SoC in the sun20i series is D1, containing a single T-HEAD
> C906 core. D1s is a low-pin-count variant of D1 with co-packaged DRAM.
> 
> Most peripherals are shared across the entire chip family. In fact, the
> ARMv7 T113 SoC is pin-compatible and almost entirely register-compatible
> with the D1s.
> 
> This means many existing device drivers can be reused. To facilitate
> this reuse, name the symbol ARCH_SUNXI, since that is what the existing
> drivers have as their dependency.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v2:
>  - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing
> 
>  arch/riscv/Kconfig.socs | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..4c1dc2ca11f9 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,15 @@ config SOC_STARFIVE
>  	help
>  	  This enables support for StarFive SoC platform hardware.
>  
> +config ARCH_SUNXI
> +	bool "Allwinner sun20i SoCs"
> +	select ERRATA_THEAD if MMU && !XIP_KERNEL

Does this need to have the if MMU? I thought it only needed the
!XIP_KERNEL since the PMU errata does not depend on MMU.

Or have a missed some patch elsewhere that'll change that?

> +	select SIFIVE_PLIC

This is v6.3 material right? One of the things that should be going for
v6.3 is all of these select SIFIVE_PLICs. Palmer suggested putting up an
immutable branch for any of that cleanup that intersects with new
platforms, so I'll probably send one out at some stage.

Thanks,
Conor.

> +	select SUN4I_TIMER
> +	help
> +	  This enables support for Allwinner sun20i platform hardware,
> +	  including boards based on the D1 and D1s SoCs.
> +
>  config SOC_VIRT
>  	bool "QEMU Virt Machine"
>  	select CLINT_TIMER if RISCV_M_MODE
> -- 
> 2.37.4
> 
