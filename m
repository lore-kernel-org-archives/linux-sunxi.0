Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC3156E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:13:30 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so5909362a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692818009; x=1693422809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz1MWgS0Kw3RPDsoSM7UTlfMpiCfEWz8Ysbb2j2r7zU=;
        b=iYOtG89DcaJ2oYuras6JdFxgyWbjWTDl6iCy00FQZuYYSkMrPWGYdh8/0Eoz52w3tp
         OlgAYZl9hOhFGBCyZVF9ztE0xv8gyc6lvkhY66XL0qtzjDDa4EFZYAA0VsTBmIDzdpvG
         K/gWYBimeN/JqequfpfcIDmeFJA/mn4KZC1J5tNE5LdOayY6abO3DFr8XZ7YgF8psJeV
         XkPJV6azBARhDF0xMsFUU4eeeNwyCvp5qlhQTi2IWv9hpGAv36DIkClgFe8M4H3mCI3H
         dAOBJsG87kS0syhEbeqQTFdT+ZuBzgssfysfRoAIthqSd3uuk+43Y8eioENQQLlfE/oc
         iLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692818009; x=1693422809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz1MWgS0Kw3RPDsoSM7UTlfMpiCfEWz8Ysbb2j2r7zU=;
        b=bTzvIVDHzQH6mYNeA4wRtawqVGo9k/Nr18MqtDi/2tITo8Qif8IH4l30u+pz1sDh63
         HMNdICB0ysIDvhr6aK2qLRhmHRsiUIz2MSmp5ykwOchQSCvZJLjLi41c752cFuhOAx9B
         qXWlVo6027K538D8BwfTRSg6bHF9CE7DMuQQerNpV/7TeoXBJXpYtC0i/l86aFkvo+1V
         lTHgCuvNBdbbQlycvlC/WHTi3yKKJtq0V8j8xucJ0HV1oRIMV5qoA+Fv61WmHWK+GKtE
         /FSLBEqRAvqoCYIx3PjOOjgUlWKP/r2Erjipkb26U/cByMVyXqPZrzsZCM0wjhPU+hnI
         J8YA==
X-Gm-Message-State: AOJu0YxcLHWygDycXn1Qimasq+0Ip8Dl+VZXfE23j5ZAGQmk0P0Jl0yO
	tIgWC0o4Q82gIrR5TSF3nqs=
X-Google-Smtp-Source: AGHT+IHXMjvf6adPcZ9gmpwfh9HOCLDdJBiBRaFNq3a3Fk/UHRRT1kW86IkVgWl04VKAvfYXtqyQTA==
X-Received: by 2002:a05:6402:34b:b0:524:9564:4fee with SMTP id r11-20020a056402034b00b0052495644feemr10480270edw.10.1692818008843;
        Wed, 23 Aug 2023 12:13:28 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id k11-20020a05640212cb00b005233f2635fbsm9563660edx.21.2023.08.23.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:13:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 21:13:27 +0200
Message-ID: <5962565.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. avgust 2023 ob 10:52:38 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi     | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts  | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts    | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts           | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts               | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi                    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts         | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi                   | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi                | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi               | 2 +-

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

sunxi DT changes are already closed for 6.5. I can take it after -rc1 for 6.6.

Best regards,
Jernej


