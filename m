Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40295669
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Apr 2023 18:24:52 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1aad55244b7so4554595ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=l+H0JwRFKwAD4TzkKtg69sq/SE0iMjDe/NX6Txlv16Ba4kBdBRnOLJE9cuEp/EtowJ
         pvTfeswVQQvBqhKyncNpPdAR29BMkNe6LB9ZMzoVyBV5Q9aGwXPM1Fc+6Qr50SDIiKsJ
         q9xyHClsPNOcAaBRr9fQ8UfCjonz6jsBwXrYvJjTpLiOgKgKgvN8uwk1fTPbl8XK+035
         m3QY80DvBeDJf799u5hnhHuLgfMpPNb4a9jtTjDBw2OzLziw75OHG2J322CH+dAw1HCw
         HsmmVI7grjIDtuj7uBS5rk+EMADzgTEglzedbNWVOsorwBluoILEBWp5M0RLFiHKNfCf
         2+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=O1edZCPk/FIlybXb4hRPvL2GfjKVcT0IQvDsRuKyJ0Uj1k0okYdCn+h//swvM3RpFE
         lXZYdplfQ/xKQUdVRdCMlMmv/pSvhss40qgPj4VSeI82sYNmhaFt2J6edippC5Q1oagI
         skSRRmJgZc4pMbhyLquBh6vnlbZBvxg9N7UerAbuNb8JKOP1FN3JhrgsZYmyL1CeJ28+
         Azaz2fGGBvtvzEMPyR5/NfUCcgYiF88h+I17gbckWP53axVc7jU9sHn0AIOj401D9tl8
         6B0MKdHzeUEgacN75U+ZNX96+IcLmZQ7n6XDL5d26NHN0I3BiWC1YDKvi238LOfbq/dK
         4HYg==
X-Gm-Message-State: AC+VfDxOZxrIN9/LFUct+oDfx3K67n7UOCN2wr6vvAYEC7pAMMWXDkYa
	gTYsoPd/TFyMMsHRUIGdQyK4aA==
X-Google-Smtp-Source: ACHHUZ6ZiLzN9eR+ckFMqg7tN3D4bPpq4geojnHO1Jqz7HXa46oxZHVvxREPvQQtQygRvSqX/lxFkg==
X-Received: by 2002:a17:903:124b:b0:1a2:8c7e:f315 with SMTP id u11-20020a170903124b00b001a28c7ef315mr10630845plh.21.1682792692014;
        Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm15137375plk.64.2023.04.29.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:33 PDT (-0700)
Subject:     Re: [PATCH 09/19] riscv: cacheinfo: Adjust includes to remove of_device.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-9-581e2605fe47@kernel.org>
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
Message-ID: <mhng-8827afbb-9f5f-4a6d-b528-4b79b1a32f8a@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 29 Mar 2023 08:52:06 PDT (-0700), robh@kernel.org wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/cacheinfo.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 3a13113f1b29..e3829d2de5d9 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -5,7 +5,6 @@
>
>  #include <linux/cpu.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheinfo.h>
>
>  static struct riscv_cacheinfo_ops *rv_cache_ops;

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
