Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DDA1854
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Mar 2023 03:54:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id x15so16078479pjk.2
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORTcc1S4DbhSj9bYXgbzlVEJUmJSEuJEOt6fEFrhs3I=;
        b=KDkr9GukbLDb5E0cjryjb5Wh0SCZaycf/IUr90YlJNe0yf+CJFbuqVLgseHvC1XTAs
         Mj696hVP3J+/JyxeccnDx4sbyBLoQR8t6nLYlyTiLLcc21ZTbl5DObP3Sn5N4aoPtg5K
         vT05+Dy7pELaLbJ3Jtjg4yd67A4IfUXlaie5LW1NfYlipHOIwyXNtqF0se+FNlmkrAW9
         0bSdtfv+XKaMh8hj340BwSg3B4py1O/ULmxkhI+S+4sADQi7xMUd3Eyip4T50rRfAII+
         GbYAWTbGyTjtff51zxbKYOhiJVlu3d4/NXIx3s+ZSTQbkwQZhq1bYkwIvzgmP/zufxWD
         V87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORTcc1S4DbhSj9bYXgbzlVEJUmJSEuJEOt6fEFrhs3I=;
        b=BA2m8W89FOLfSUbMoQLfxpb46kTGGzKdYh0iit027ag2otEarH3UHg3ceW/1blMZxV
         CA4IY91/jT5bozbNgjpO5wyZtX8uw9c2k7VMu9B+yUF5aETy9ov1RAaeKFq1Kpxi9ZLG
         w3vcS6Iql71TX783MpeIGeNoeBjHWVDv03VJWKC195/0aidkSO8wj7kpxZfMohTye5KK
         nIVxq1Xy5mtYDltu9jA91g1QQ1wseNsJPXyWdZ4ytch9E+Y7hKtHmcYZ/Q3Ko1fq/2rz
         Bs1O/vQAbYo+3AbKb2HKULV730tJBj+tnbXIR9Z3P7LMRqSCyKNzGo2nLjCHrrxrlkT6
         s8qw==
X-Gm-Message-State: AAQBX9dYRoOKabAUDNaOWoJKw4TOfkq9qC7hP1homeXRUyTUIl4ATwM0
	UtRY+Y6oxEyHXWXgngG7F+4nNA==
X-Google-Smtp-Source: AKy350Z3+wrY9ZgUHedACp4BaESa2FvIEkabhjg74d5bnPV2JCYBYbJoHjnYpjGWoPDBynyeKDWcRw==
X-Received: by 2002:a17:902:d503:b0:19d:1720:3873 with SMTP id b3-20020a170902d50300b0019d17203873mr24981326plg.57.1680148494287;
        Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090ad38900b002340d317f3esm2154710pju.52.2023.03.29.20.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:53 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:24:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 18/19] OPP: Adjust includes to remove of_device.h
Message-ID: <20230330035451.huc3ae2acvgoh4xs@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>

On 29-03-23, 10:52, Rob Herring wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  drivers/opp/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index e55c6095adf0..63b126c6215e 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -13,7 +13,7 @@
>  #include <linux/cpu.h>
>  #include <linux/errno.h>
>  #include <linux/device.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
>  #include <linux/export.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
