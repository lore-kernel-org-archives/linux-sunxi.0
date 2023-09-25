Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFEED297
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 17:39:01 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6515d44b562so42162186d6.3
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695663541; x=1696268341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTbKVRUtifK600GcTuB6H5T7Hq7nQwjgpsYUbwhLkRs=;
        b=ZZ1N8Ny2mJbiOAFGw4bYgDCQjFvk8RpBr+T1L007asUgvvglL23MyLefX1cVqcQwZa
         LYqHVNl2QL8a3GwUm4dUGUAj65yt0Gx3zE+EtwsR3vLIoNRob7RQmtRv1Tcg9ch8aKza
         iYoBi4RhubypZuEqq9/hwBmvAmTzkjaw3rocqvdqNTJAk/K8LutL47YAwhLmenCl/5wk
         J4/zG8ypQ4K9gmn85J7qJzdXKZiLI83hitUP7EMGIZfWg4lqx+xh7AG/goxzSzxbkFbC
         aUfBTvI/QjtD12Egtu4tCXXsQyOkt0wdXPkznUeIGnLp7kNeUDsVRq1UJn/zRSIBJaUh
         yhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695663541; x=1696268341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTbKVRUtifK600GcTuB6H5T7Hq7nQwjgpsYUbwhLkRs=;
        b=KyMLjgPBNQm16hOOmTUMpO0rBF5YIvqCJghVjKrMvTm/YMipHZlj1708Y72W3u/TqQ
         TZKxLBXdP66XINlHVDSvlwu0ND7zbX5Vu5USwagVWVl6FFPuBbdL7nAfDIV+pATitwyx
         le8CmyeBrxre9nFnzfKuedjl9Yzy08yZs3Ijr6PrVBbfBQv59H0Ux1+Z1z0TdoFhjn76
         sjvS7WHaFJx3QJ9M1rveNmEqYr4aNh/aDoACOC67bW7bigLsvQA+3SIxk9k7WEC5i4M1
         2D0MkJjgn0gP1pCVYVMKLvB1msUhceJX2loSPfJjPWxI810ejDiV5m7HF7ZM0IpEMbRL
         qsCA==
X-Gm-Message-State: AOJu0YwsMSGGKAIyY//38bj8mV6THqL5wjj9ctD0qmIyTZbl8y29wQ1h
	+Cl7LVd+bS3xCjCK74Oc5wDGaQ==
X-Google-Smtp-Source: AGHT+IG+tSQcs5F1udgePekSyNFg4nS/3ON6TuwwuW4o4BqlQE4HXLo3X3tpbTYJLPBv/LJ1Cwr8Wg==
X-Received: by 2002:a05:6214:4307:b0:647:22cc:1784 with SMTP id oe7-20020a056214430700b0064722cc1784mr8149193qvb.15.1695663540981;
        Mon, 25 Sep 2023 10:39:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:75e1:d26a:c179:14a3? ([2600:1700:2000:b002:75e1:d26a:c179:14a3])
        by smtp.gmail.com with ESMTPSA id ph7-20020a0562144a4700b00655ebd053dcsm3167034qvb.82.2023.09.25.10.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 10:39:00 -0700 (PDT)
Message-ID: <a43ef21e-ce26-45ee-be28-526238e3e88f@sifive.com>
Date: Mon, 25 Sep 2023 12:38:58 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/6] riscv: dts: sifive: convert isa detection to new
 properties
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-4-conor@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230922081351.30239-4-conor@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-09-22 3:13 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the fu540 and fu740 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 15 +++++++++++++++
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 15 +++++++++++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

