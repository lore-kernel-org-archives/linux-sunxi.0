Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945381A4F2B
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Jun 2024 10:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718878039; cv=none; b=YE7B3wakEu2FXegYyK6+MZOnHpMPmfDfK1kvS3T3xBYVlp0As+RUu8KY71ptv0PDDWFRx26OyQKDEdGkCpz7tHB+jFmH2eHffdZgObG9c5wd046z00DLXdevXiYZLbGl85nHeqdI85f8nTGgFm6eb2Ji9LSwS6MjJVKZQ7/EgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718878039; c=relaxed/simple;
	bh=gtlJye50+OfffKjggbOEmtKNH45g/zjK6ZfJA8b8AdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idkg2FS17LyFOGOBr7Dl/i6hHZ7hwR1WC7I4vt0LFVmSPqohGpxzUv0le7qsLIHchhV/loGFYjJ4vaTotDjAP0y46jJoiImRzNEx5z8B6bte5mQJrCW34uTrqLW0Z6a5AdUrkrl8YT6DP3MF6SLMS0W0vKkrcIk/hxve4SISeMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso732313e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Jun 2024 03:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718878031; x=1719482831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ir1hVcg7ykDi/DMYCtyM630+t+MR02LhBXB13vEhoEE=;
        b=L8Y3+gTN1QDu+ZwC3d3hfzDEN6dL0Ae1+Cl7rrSr+eZSylm2Cp3t+aDsvUBBms8Ajd
         +gQd2ZjVNlTf4umyxhT4ZqzmQd1JMMWBC8iKF2P+xKjrfvp7Z7bBep351vLJQecF0wiy
         vdqdedmbtsotBwMokB0VNRCG1S2XuStfh/9fTI/TxmhNfZ1t0vQO+22c+ytWA42QvRbb
         8ub1maRYaX2icd5xcfekCrp4/nlhGazAnL24G4h9BgLvw2zrjmwLOjeNRyP9/lKVWtIr
         os8B0O2dL79TH3IZ5XY08sNgnNicG2wUIHvmc8XnSQ6jHIi0VgDRAnXNUhheQZX9KRX8
         sASQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVzV1vPUz6Kv70sK1MvwZztf+SQ1Cmq5d0fYwwlm9LdiSQQyIz8WcUteTso92h6nZqX5URe3wWS/e+3sMpniyBTnA0ofZQQi2nG4E=
X-Gm-Message-State: AOJu0YzpLzPQziyZUgLHjmZRwmUicRqwL3D1PpwZDdfN/u9Ir8M2ZW2V
	7Co8vPrFkXE6FC0FHB0iLJZ7l0imnEsVBZsFnG9/iNEEoAD4trb4crjKtIeP
X-Google-Smtp-Source: AGHT+IFvfqvTE21y7Krr2ac67lfUk1xf8GCI/O0tiQAxAboWavXd9VTINnDkuRuuX+KyN25lCfjtAA==
X-Received: by 2002:a05:6512:3b28:b0:52c:999b:52f9 with SMTP id 2adb3069b0e04-52ccaaa8d32mr3408079e87.57.1718878030505;
        Thu, 20 Jun 2024 03:07:10 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2826269sm1986522e87.61.2024.06.20.03.07.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 03:07:09 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec1620a956so7274911fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Jun 2024 03:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOYIZyOTNfNyzusFYRWFt2ZvQfCUu9ooo/FW/+9Q3dBzoWl/iSgZfyxOuA4/8ggFz+4k4goAXpAzSToELMMSjGW5iGBTy3UbmVu/s=
X-Received: by 2002:a05:651c:90:b0:2eb:f8d1:87d9 with SMTP id
 38308e7fff4ca-2ec3cecca82mr30693691fa.31.1718878028507; Thu, 20 Jun 2024
 03:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com> <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 20 Jun 2024 18:06:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ZuLhnZn4G_Zbqqosh46Fh57WtXCcCFkwMA2phtLzq1g@mail.gmail.com>
Message-ID: <CAGb2v64ZuLhnZn4G_Zbqqosh46Fh57WtXCcCFkwMA2phtLzq1g@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 7:57=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

If the RISC-V maintainers want to take the whole series.

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..6367112e614a 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>                         riscv,isa =3D "rv64imafdc";
>                         riscv,isa-base =3D "rv64i";
>                         riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> -                                              "zifencei", "zihpm";
> +                                              "zifencei", "zihpm", "xthe=
advector";
> +                       thead,vlenb =3D <128>;
>                         #cooling-cells =3D <2>;
>
>                         cpu0_intc: interrupt-controller {
>
> --
> 2.34.1
>
