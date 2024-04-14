Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084E2C684
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713087094; cv=none; b=sNuiJZEaGQbq+5Fg/hhk3NtFA82801W7WaqhGdN60oFcrH/1IDhV6NHRldfilEyn9MD6FVbYm+iZsIA4yph461p9bsyVYh433b3ZNayKafaSAjZgx5h2xSex/HwpIr3nnM5tVogF7NR8cijla5e89lIHtKmgo7mUUI1ETApHZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713087094; c=relaxed/simple;
	bh=ufm/NSKPgn9w0SSRoPasgwxiVmCSJi2egeet0Am2uYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByxxchNHSAwwQ9o+YQ8xqBRN6ybMldkZGDH1Yg6I85zzDvqOIPIlmZCTmm0+XVXkAHazwldqOFlQoLlyEiQmExnGulawjgiieo0bzuxEF8bXVGitEVQs7+kGpOyqWxFM3eRbOe1VCEbkDbmF4aN6eOxTuwS239LwlG0Cr+csGhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUuYyu9Y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUuYyu9Y"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e69a51a33so1884808a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713087091; x=1713691891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoaklZTZ9NCwiKbFyGM6/ChMIATe9pluxxswHyZAh4Y=;
        b=JUuYyu9YZdo7nC+oJZfshCvR6633n3xLVJYfGbhdmLccALnn3bjMsbwrMgGZa1Y2nr
         onrq/vtA6FX5xjBNoy9wlDKYP4aXNvDR4R+B/tqQ5dgootpBFoD4tALT26Y8y9DicsEC
         H41lwy/BhG7noGWOfImixY6a4WI4aLuaaoyewVhbZT4LNgLzQ+GRV+o95/SqpnhvqQy/
         GkqX6ZXdyDgebCmxlJTLFf2Je4K0sCSBZessbM+m88OtlBzOEvlVV4fPxGr5kTT5Q7H+
         I4e1fUuC/89KHzj+3Bq2n6rYuTdOnB15IVNSrFjrSpFcpFz/8svYoigptEQbCI5znC08
         LkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713087091; x=1713691891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoaklZTZ9NCwiKbFyGM6/ChMIATe9pluxxswHyZAh4Y=;
        b=C7b0utDxWe4bNEAkbj+86Dc7MCgT+4jgexjk2+X9he6EWiovq0wy7pqqBJXGmsTjIz
         +35urEx8PDZcqYPIGw5He6JKTUMlFAgLcOd7dImHcYqLVWniiYGjLDaXa4GsDdKFv3Vv
         kUbbzp7HrE/nb2v85Bw1WelguHso0A6u5BeMtk+/LUG9WUCyVaIbZQt2jSzrgSjRheZ6
         4KyIcX8k+08IO6W83BDB8DwhA2orxIzfwtCZk9RCAayhL9PlQlbBuZaUO6ybeFtRrHkx
         bzB38AWieuYWP2Dh4/sT8QfjzfHoQbGYbiSvOwDY0RRQyRWtSOS+EoUA9kovMjqi79X/
         vIZw==
X-Forwarded-Encrypted: i=1; AJvYcCXE0iXbft4QIN5hZ79IhgSuKAjZ13QlaVTb7UjLnNYZtH6vvNFe0oawpgy56JYjNlYRmIt/0/6+m/T3lCDShKADC/jacr1iJiD2Tvg=
X-Gm-Message-State: AOJu0YxE3/1pytlP2e6QQFnUyd2lH+K8D9AxRl8hMrJeycyeaLBxeqZY
	ENhhS5zB7D9RpvSAdDwYf1JrK0u8149M+JMu4/TXKOYeDfAeht4t
X-Google-Smtp-Source: AGHT+IGTTePPgNtVQqkXtvZkliB5JtDw0VtMTdsNejV7BqRipW9b1m8MMjjtVi+b+r3S/s4mKHeCJw==
X-Received: by 2002:a17:906:f598:b0:a52:4394:888b with SMTP id cm24-20020a170906f59800b00a524394888bmr3416247ejd.65.1713087091124;
        Sun, 14 Apr 2024 02:31:31 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-252-50-gprs.simobil.net. [46.123.252.50])
        by smtp.gmail.com with ESMTPSA id el16-20020a170907285000b00a5254ec731esm1295058ejc.176.2024.04.14.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 02:31:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: h616: Fix I2C0 pins
Date: Sun, 14 Apr 2024 11:31:29 +0200
Message-ID: <4909821.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240329103825.25463-1-andre.przywara@arm.com>
References: <20240329103825.25463-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne petek, 29. marec 2024 ob 11:38:25 CEST je Andre Przywara napisal(a):
> Currently we specify the pins for the I2C0 function as PI6 and PI7, even
> though they are actually PI5 and PI6. Linux' pinctrl driver and the H616
> user manual confirm this.
> 
> Fix the pin names in the pins property. None of the existing DTs in the
> tree seems to use I2C0, which explains why this went unnoticed.
> 
> Fixes: 0d17c8651188 ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index f756a396ea3da..95f09204337f0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -227,7 +227,7 @@ ext_rgmii_pins: rgmii-pins {
>  			};
>  
>  			i2c0_pins: i2c0-pins {
> -				pins = "PI6", "PI7";
> +				pins = "PI5", "PI6";
>  				function = "i2c0";
>  			};
>  
> 




