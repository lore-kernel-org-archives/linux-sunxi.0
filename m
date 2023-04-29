Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0D5666
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Apr 2023 18:24:51 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64115eef620so19283534b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=osIreuhFqrOaZAAl/27+IK5Hi1AB1StDT3MQB4UJdmyvLv00XqfYnZDOR5DEup+Zbc
         EMMhztAPOHm+IIUb2Jko/Ql1Qxequoi14q5q6ioXxwV6ONNbTHbCpppQsquBotBv7NZA
         0xsoGYgWKOy6+E6yOM0QJd1lS7m7Gz/d+GxIdfE4O363XFxvr58OuzUA8yahfjRkgl76
         daFFl6DyngHfFxsVeUlgdYpwovv5SK9w21aq217ZLhFo3Y8jm5Njv+T6oNvGK4lJj/ES
         nDCkxSdKHcKkITKghp2NRdG/dKj2tCryrSlZDF5O3eK56lzP0kExP10+gizADZGE0dho
         uu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=BkJ6UQVh7O+NxEWtl/brErrWZYEkWovi+NZ34ApxEWe9zaHwc5H0Eat1PHOUC4nJac
         F+EyKTE9ihKijflrTa5+lus50PPBovIVJQAjM301wf9CuqHV3v6irXQ0E7U5sFQ8vLzL
         aiffwLWSgBe7Lgfjk3AqtloS5mLo0vI743m2uqpEFKlkwY18TUHNysXxNjEp/gKycEmK
         pNClQvRuCj/6mf/4C7qBVmI/lr4t7jDyq7WODaX0Eglu4uRvHDwPAtkm8P0hV1j8PdU2
         XjaLvIAmo0zAh8JhtExkD6SSA5ZBqd1JNLW6diJ5JON/znw+JVUIJvNSCxZKZMjnhAYI
         ceRg==
X-Gm-Message-State: AC+VfDzsiVbgHEquUtdh/diP/pobwD7KHMfwzGMr+PGoGOnqbjopGbiB
	KbEHN9lFJuQjBNHQEftSbultDA==
X-Google-Smtp-Source: ACHHUZ56+SNdXMph8Hdac6/dfoFg0Vhv/AYaUOOmwxyPYiHuY8kgDpOram8U+gPi6EA5PyHcO2u8+w==
X-Received: by 2002:a17:903:41cf:b0:1a6:d0a8:c70f with SMTP id u15-20020a17090341cf00b001a6d0a8c70fmr11307108ple.5.1682792690325;
        Sat, 29 Apr 2023 11:24:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001960706141fsm15126026plb.149.2023.04.29.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:22 PDT (-0700)
Subject:     Re: [PATCH 08/19] riscv: Add explicit include for cpu.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-8-581e2605fe47@kernel.org>
CC: davem@davemloft.net, robh+dt@kernel.org, frowand.list@gmail.com,
  linux@armlinux.org.uk, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org,
  daniel.lezcano@linaro.org, tglx@linutronix.de, amit.kachhap@gmail.com, viresh.kumar@linaro.org,
  lukasz.luba@arm.com, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
  angelogioacchino.delregno@collabora.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  thierry.reding@gmail.com, jonathanh@nvidia.com, tiny.windzz@gmail.com, lpieralisi@kernel.org,
  sudeep.holla@arm.com, agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
  anup@brainfault.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, Marc Zyngier <maz@kernel.org>,
  vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, sparclinux@vger.kernel.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
  linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
  linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-3fdcd7ba-9d00-4521-a55f-367cf53f5f12@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 29 Mar 2023 08:52:05 PDT (-0700), robh@kernel.org wrote:
> Removing the include of cpu.h from of_device.h (included by
> of_platform.h) causes an error in setup.c:
>
> arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')
>
> The of_platform.h header is not necessary either, so it can be dropped.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 376d2827e736..dcfa4b6fa4b1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -8,6 +8,7 @@
>   *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
> +#include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> @@ -15,7 +16,6 @@
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
> -#include <linux/of_platform.h>
>  #include <linux/sched/task.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
