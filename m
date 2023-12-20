Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F640BED
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqea11Wt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c3fe6c1b5so62921845e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 07:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703085953; x=1703690753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uS6w3rNmw0cdtYnw4LMSsxjjgZzl4QPxrmb81MWLsvk=;
        b=kqea11Wt8IPbvLlfFi4294190I5ypsss4cWiKOlMWMFVfXkTlxt7ceMCr6Vma2KaMJ
         QTrMszhfFYKmH6UxFPAorGWoHRDo2aueOT5sqU4E9+FXly40I1SgbzcA0btLSmd0T8wS
         NWU6Lkw46jbL4hkMApQSeB2BCTYtpWVgNgDX4zhPzLMVa+TPBL3kxXYX4l9njBdbbX+5
         ncBpiCWtIN3TNp/n/T/QiDRYRwjhZTD7B4oQlMk3rXZbFu0m+EnPd3Lp8hC2H1rKk9Xf
         8MPoR9mtXYQbeMuy4ydece4E8i/MrHu3afTeait0E5ZUjnU2Tne63m8UOdkmXho8yFhP
         DGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085953; x=1703690753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uS6w3rNmw0cdtYnw4LMSsxjjgZzl4QPxrmb81MWLsvk=;
        b=OARL/FFWw5QxYDz6aZyFhA8SBun814bjnlRyij0Cd9MzdOs3gDbqR1pHch3z1ScRUP
         0F8zza7oUwOMNmF9hkavSlW/mz70Lfa2kJ/J0TGLNjvBawOQ3OuWwMq1mbXwg1pkinAX
         DeFhs7BxCbRzrFm2t9/Y258EKIF5iHVGcxw4zk5ovsuapXfg/zkkk4sh6j8ya0o9qEMH
         mVdDwWvnQg+DV9Gclrgjp6fmZEWBc9r47t1wFBgCIdhjYggh3+ItzLoinD/F1iQpTALH
         cRseSX5J5xBJ2SOeZ5NuxcDPCNpnyXLC+r1AjBEPYg/fJK5pNUZYlxINGh1CjEZmEWw5
         8dkw==
X-Gm-Message-State: AOJu0YyYAwdqZJaBGy68y7TfXCf6xfqngMKIt3bPUbGQMlFQ7YG4Gy+9
	rOQg/YQuAwRpWVTQx0Cr+hc=
X-Google-Smtp-Source: AGHT+IGqN3fsaKks2Cw8XAX/rXbmEt1dkYX1uzdoef3zSrDXFU1J51FjOJPUUlBcU0nkMxM5sTgiRQ==
X-Received: by 2002:a05:600c:5d5:b0:40c:34e1:72e5 with SMTP id p21-20020a05600c05d500b0040c34e172e5mr9978141wmd.69.1703085953376;
        Wed, 20 Dec 2023 07:25:53 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b003feae747ff2sm7858073wmq.35.2023.12.20.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:25:53 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: Re: [RFC PATCH 2/2] riscv: dts: allwinner: Fill in OPPs
Date: Wed, 20 Dec 2023 16:25:50 +0100
Message-ID: <113541315.nniJfEyVGO@jernej-laptop>
In-Reply-To: <20231220095141.27883-3-fusibrandon13@gmail.com>
References:
 <20231220095141.27883-1-fusibrandon13@gmail.com>
 <20231220095141.27883-3-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 20. december 2023 ob 10:51:41 CET je Brandon Cheo Fusi napisal(a):
> Specifies two voltage ranges, in order of increasing stability,
> for each OPP. This is heavily inspired by
> 
> https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
> 
> and
> 
> https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Remove links from message. If you really want them, add Link tag for each.

> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 2f1771c19..8e7bc8bd0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -48,13 +48,17 @@ opp_table_cpu: opp-table-cpu {
>  		opp-408000000 {
>  			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <408000000>;
> -			opp-microvolt-speed0 = <900000 900000 1100000>;
> +
> +			opp-microvolt-speed0 = <950000 900000 1100000>;

Second value should be same as first, otherwise you'll experience stability issue.

> +			opp-microvolt-speed1 = <900000 900000 1100000>;
>  		};
>  
>  		opp-1080000000 {
>  			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <1008000000>;
> -			opp-microvolt-speed0 = <900000 900000 1100000>;
> +
> +			opp-microvolt-speed0 = <1100000 900000 1100000>;

Ditto.

Best regards,
Jernej

> +			opp-microvolt-speed1 = <950000 900000 1100000>;
>  		};
>  	};
>  
> 




