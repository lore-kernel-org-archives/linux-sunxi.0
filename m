Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0A79DE
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Apr 2023 19:22:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l37so14807228wms.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hCHlkF5Z3NmTqMnInVbTSc5iAXn26gWIw7YwXQgkr4=;
        b=g6sUbB29tDRqwWFaUjnPs6EJpXE5M1cKRPU9iBTc0LRSeeY2pnemn3+Ow7d7VJL9vC
         1UPid8/hMd1vpO8Z1HH8wUfyfZNWK5WVNz8O2iOSwFulwT14iN6cAJ9k3kYRxszx/8J+
         ZfVbXmkh0pMO1XRkO2ML4wn90O4bBd4syFghP/pgtFlNifs4VINxjJrPhysz2kyaFa3d
         ut2cSJXOHIi46pQrkm23u6p9HDSNAX9mJNsPIRMYtwbQg8sSv434+Zoa59dQRAEnpuIW
         UIBhBPrlBG9iosFOv68C9vWhjUSSn5P/QoCed33C2PtnKJGt1PfFOt1XJFjzTE6pAOu+
         O3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hCHlkF5Z3NmTqMnInVbTSc5iAXn26gWIw7YwXQgkr4=;
        b=Eftk1AvssYZ+rJPLqV4B/Vxu3sdw+EAbj71ez4RYhIMZrYgFeGG1rb49Nx27t3F1pK
         BOSoP1JxFecNKa9BsJUVs/aAcpXNgKzKUbHJptmibxHknKL/lmHdw0F4r+SLC1Ctbkc8
         d+8oc27uSoxLemNbMnPsVieDs9vil1rDZ218c09WvWuuQNnJIVfZ4cTn/z3IEdSWIMa+
         snCkBmI7Nq3LWpNLhaVJCUNSUn2pjS1K2moa3mFEjtQJfo6e9CUFX+RFLtEDUo7/TLFA
         w9U69CjEakkZW2hUvnynQM1VcSxQh6XKvneNBU5ub5bJD/8wWh/VTVvUmvFvZA3byZLb
         +0yQ==
X-Gm-Message-State: AO0yUKV2YOck+ClyMER9XVPwzN/XlrFvp2cRVI+1C0+5lJOW/qF8Z1rP
	cmo1OGao5bs81mzNFzJi6zYfdg==
X-Google-Smtp-Source: AK7set9h+h3Yx3+JglVGj8gMjIzM5W42Mci6pIwcqvCbd9w9+V46ksoIxY9Juxkx8HAEL/TqjQdSeA==
X-Received: by 2002:a7b:cb95:0:b0:3d0:6a57:66a5 with SMTP id m21-20020a7bcb95000000b003d06a5766a5mr22553123wmi.0.1680376923601;
        Sat, 01 Apr 2023 12:22:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id o9-20020a05600c4fc900b003ef6bc71cccsm14508987wmq.27.2023.04.01.12.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:22:03 -0700 (PDT)
Message-ID: <c0fdb192-43d1-760f-ccd8-2f9d5fe41a99@linaro.org>
Date: Sat, 1 Apr 2023 21:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/19] clocksource: ingenic: Add explicit include for
 cpuhotplug.h
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Amit Daniel Kachhap <amit.kachhap@gmail.com>,
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
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/03/2023 17:52, Rob Herring wrote:
> Removing include of cpu.h from of_device.h (included by of_platform.h)
> causes an error in ingenic-timer:
> 
> drivers/clocksource/ingenic-timer.c: In function ‘ingenic_tcu_init’:
> drivers/clocksource/ingenic-timer.c:338:15: error: implicit declaration of function ‘cpuhp_setup_state’
> 
> The of_platform.h header is not necessary either, so it and of_address.h
> can be dropped.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

