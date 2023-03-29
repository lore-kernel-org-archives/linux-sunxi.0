Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36FA2F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 16:05:32 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ew6so65356933edb.7
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680105931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=;
        b=ZP8azEYR3T/kmocgq8bSZlNTouSdAv0pqNbONNvK6pjIOYfvW0EWRaDVO44E5sowbA
         4MGZKJiXz7VE108ciJQNXn5/hHquTqMqhb6tRaq9zC55es7aV4eyXx5sWcvFrwBw8u31
         DcptBNfTU6x5mTKuHF7vCiSdOphP7f1dZ5xyT7jA8pE036EK0r7Mwyj+wpf0qOtr4/dO
         PtsdhtBZV/jUZWdd6KSP5EkVxa9qFL2fQNK4V/Imeno6KN+BWXvR2ysex446RXd1SjcJ
         RuPjjhn8s3ln2xq7NpQb+o1cGn+mn2pwwyW/FTHZVbW4BbukRommLkvptqsBpXQc4gTR
         WTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=;
        b=TFeU+AXWHKwM1WbJJWDTcv4eck/Uw0sDJ+g9hnPMZpMAwFIF42TLtMmlJZWNTb3JKq
         RLxgNDB5UCz6kOG+jNg+gjwEokC/I9G+H8fDZi7A6CDLKrC3Y8Cq2GSwmm4gAAEyAwxB
         FW2qNkZ/LTy8VrB97kg/zPyC64sNI9ZKS4sJGoNxi6UBTkmMjiDpgHDNq7FiQrtyGP3/
         4EbHfoMpct29hZxgqhdsq+Gq2rdBWTpEZoKiXklBrQ4+mYIW+nrY0i3NO48FhPs5oiIP
         8TWRLA+2K0JZX1oILJp0MR4BxtZ8tjQvmldB34kb9jgT/zoXkaJ5flN/riiGXlp7xJ+Z
         29WA==
X-Gm-Message-State: AAQBX9e0CPKuoXwykVEfgYZmmzh+WdCBYRb6d2RVRjfzrLAT27CSgy/X
	i5lHT4d+SErUARXMWERE9z0=
X-Google-Smtp-Source: AKy350Y0SxvEseTuQQeEwplPrjnDboy+i5rUViT0BUXK5Dv5qulkowom3JNTJJ/XP46pJIz4L/hzEA==
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr20841888ejb.19.1680105930843;
        Wed, 29 Mar 2023 09:05:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906079300b00932ed432475sm15417251ejc.124.2023.03.29.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 09:05:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Date: Wed, 29 Mar 2023 18:05:27 +0200
Message-ID: <2672894.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
References:
 <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sreda, 29. marec 2023 ob 17:52:12 CEST je Rob Herring napisal(a):
> Removing the include of cpu.h from of_device.h causes an error:
>=20
> drivers/cpufreq/sun50i-cpufreq-nvmem.c:42:19: error: implicit declaration=
 of
> function =E2=80=98get_cpu_device=E2=80=99; did you mean =E2=80=98get_devi=
ce=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>=20
> As of_device.h is not otherwise needed, it can be replaced with of.h
> (also implicitly included).
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


