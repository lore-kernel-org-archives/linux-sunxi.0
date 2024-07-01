Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251B53AC
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jul 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719847628; cv=none; b=GnrNJN/GO2dIQ/cRSnxwf5tsHWRX5X1GbdEFTegls0LApnUMjhWbRTX2itZ51b7qiiwFIhz9G0GhZAwfdQeMj5z4ln67lI3pejHO6/epQdZaYjaclihx30iwvG+6ipxdZvplRAy12fiMOt81itkWhIXP5FjJE3Z5ccoKe/BvnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719847628; c=relaxed/simple;
	bh=prvpyfxMSkwGiYfGgE9IF5heVeaqD/cLLatLbI2ZMVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+h03EvO639PmNtiCelvHrQXJR8F13SjzfGe/GDEWnAc3s4ZW2CYtv64r/OvmIBVaPtm/GGLp1xGDYwcHL5uMJvcKZS1IXkoxAJgxU9G8Ee9p+ZfMQOHU8OpeeXLHQtwEUc+DaHGmTY1YYDaHmkhoZmHiYdP/i48/6Ym5HlcwKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=E3ylwTdK; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E3ylwTdK"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b4fdf56903so15627896d6.1
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Jul 2024 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719847625; x=1720452425; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGtKsAafTDSpHUpnTbaoLrGWrMjaJvN7kW+LOjav24E=;
        b=E3ylwTdKEr/nnhJ1WzKW2Og5SJIKOnHRbFqqTDJlEYbILHg72nNIdYBwIDMO1pHMde
         N7AaJNzpAaKxpBuC+oAsOyW7Q2jfRwxm5CSdXoHXxxTgzmOEHx2R1w91LzYbOH8ywCMo
         VwvHWAUxZP4S7gp/cCA22YEaG4QRfmqlyAVrHB/1zhYME/LHUDPYgaSVXXJojvRKDc6z
         AkrQzi5QbkEOKfKRF5P+0sp0ccH7ZpPXsxzkt5020jC+dwATAK7HoyKve0zZgKG4xF2K
         KhEtN7inr1pnSDZwxAIVnfp5R+hN0QhNiksbdPVSqzDwW8wlu+hwMfZnyqSnKTeizVsr
         nKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847625; x=1720452425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGtKsAafTDSpHUpnTbaoLrGWrMjaJvN7kW+LOjav24E=;
        b=XCsVivGZmpKkmQ6hZb5MIdze6KnYe4OpOi9JFrvwf7qpIr97oxuNiA+jOKVp6MuGIA
         hZBAfwLmZJz4JiYNsU2CJyVyaBX7DyYvGia0JwauHkEIGs1TBRC9TpyW3cDKh6sK+yzD
         rY8aptknBRF2cqDQ7ai7EtgsppTTLRCQRE7HVHIhOoy6BVpeTB5Re23KaIepeIL0UwVV
         ueuq2ZK/QYJZOew3VwhhrxM7ozja8CkqSoGn4gsMqq7HSnMBGQhD5ctHlVVguGG0TQ7C
         6/jELtlASSe05N9PhtC4zBLPRp667xTWz/Cw9DlcngW7+NXyi3E6Nb1y67yqQbGOTzSv
         A70w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+WNHcwNuiTUkwH/3V5W5AZz3l7uKrlZqpHaPJ+Lw+4uXF9Bfr37LCOd9cHsF5KmjXehtZSAMtss3v7KrZNCEsBW64K6JCJa+fjc=
X-Gm-Message-State: AOJu0YxTmokyiu5Sw0MvshYLXswl3OMnx3GsrgqjKMEqC9mkoW8ADnJS
	578q2JjFqTxUFgJ/BZsMFtvOt7lmGvJQPDOOFrDZLsVgmSeZrcm5JuLYnDfiKDM=
X-Google-Smtp-Source: AGHT+IFm7J11+wdhrgMT/TGaX0Rc7thLKL2Wg4raKr9nb+KKvQo276Bk7ZpHF10bnd8Q9L9dV3BTgw==
X-Received: by 2002:a05:6214:19ce:b0:6b0:4201:3840 with SMTP id 6a1803df08f44-6b5b7148e19mr79621526d6.40.1719847625201;
        Mon, 01 Jul 2024 08:27:05 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e581ed4sm33779996d6.69.2024.07.01.08.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:27:04 -0700 (PDT)
Message-ID: <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
Date: Mon, 1 Jul 2024 10:27:01 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Charlie,

On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-

The other C906/C910/C920-based SoCs need devicetree updates as well, although
they don't necessarily need to be part of this series:

 - sophgo/cv18xx.dtsi
 - sophgo/sg2042-cpus.dtsi
 - thead/th1520.dtsi

>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..6367112e614a 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>  			riscv,isa = "rv64imafdc";

The ISA string should be updated to keep it in sync with riscv,isa-extensions.

Regards,
Samuel

>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadvector";
> +			thead,vlenb = <128>;
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> 

