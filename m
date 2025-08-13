Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE6F219A8E
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098643; cv=none; b=rMXsB3P9fSueEkJCySCwOWVEzIzIBDjpMB60TAFTJgqDT+NaCpqG2U03rHM+TEd3WyzWnwvdoZAgI+BgZ4yrX4+1F+W6nM9FSpls+tsqDB0ivrEIjLJShvtPUq7DUa1HlLhQVyal1RCCNusmroHcHpfCMrGZcFTYDoCsqj/9chY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098643; c=relaxed/simple;
	bh=UbhBnuInugUu2cTjmEDB4YCiAKRUPYCSJOrFRfqKV7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzCDU5JeTJPLAbbWXEwKC5s2X7saCniN0VYUZtFm0IJADQEPuRxGG44Y82pVC8LJQDQ7RoIqB8kP3onSrQHuSvkSSO8VzUqfs+o/QNJ5hUHZdIPmr2mqe4IHoKM8eWaXNL1BHEqYotdXFg7ehqeURe7rx1PVHadHSQU43xLB2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxSEvRwC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxSEvRwC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so3834537f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098640; x=1755703440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al/qX1qt84RxLjmC8/RQc6iv8G0Q8rgfIYnhnorUlSI=;
        b=IxSEvRwCkPbG1cwo/P5nbRMw1m41SjMPZay14hRISfD1eHj/Vn4X87a9zGH15X73ZD
         HKacfYNDTg+ZMK67vzopE9XCPgckdi2XQlrQR/nfzSEz0sq9xsU9RMgid8k3GXVPxvUh
         WLxQM2czfZkV9WZRABtAsRkRcA8c2gKwUOTk0kr3XTOmdA6gHoV/fX7uuRCXwM7nrF5I
         AMTV7O75VqQxpeHRCzmJuwci/GRphhJSWysaUMs/3XhpZBk5WBvWD7xp5SC2Wwbxmo1e
         +EeAiOgJvNyUIz2qF0bzfseasSQ2/fqX8FtXEJvgeWbIVl9/tqulJVQPacrRC1pVolNg
         5PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098640; x=1755703440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Al/qX1qt84RxLjmC8/RQc6iv8G0Q8rgfIYnhnorUlSI=;
        b=YDL4DhtEBCdMFF/D2Ht4Amfr7oSW5mF3DkvrnyOO67V1zb37rPa6QsYIHkNTe86G6t
         GMiUgGl9E/VT2K2JcF4Ff1CykXfOaJlpNjCRXuid74bPHaNxbQJ+tYyOH9RNZAaQWbwI
         ws68q3FWSfuFro2BUL3HbCiIA610yL4tm7DP/ExVI4Hh8KrFRqgV4PEBxGNt2zzx6x6C
         /sfkL8LKzNNn7L0ebwOOSVC3kYZfiPls3+i8dNXYYeFTen0eNyOkU9asAmJHGjATlGji
         A5gFRYx/pk1LP4o9qwxkqYMJAPL5c+oxEk3QnmSwp7XDDsbc+pIlRRz9SKnSfh9ggiEY
         1PTg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0/xroenZRJT7DbRiY8aAyHrrKL76buRsfVHYx9gHGdDdgCX/b7bsHVfnZtrSKI9yW2UixjDQ7VfCoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrX5clerq2yrwrh6kV1p2azDhiqCdB5ED8iiukdEU619oRkIMf
	MNx7IoGS2zCie0aVOga1lYdpHxmMzI8EK1uXgSzfJuBrJ9VbqGC2JbkZ
X-Gm-Gg: ASbGncu8/VsdJpLJRwH+75P6rjq8lUaf6H+Csxiafh1CyXHsLj1vJMlMP8428Cx76on
	sg4fkPp/KSjBoVYYdibKWE+iJOT2IAJjd0MCqmzRdjsaq3lr/h5KAVNHDMxWe7vqj3ZA/6ZRN27
	UXYzE0W3fxH7CMflJuUWY//LDwzRqN+/YMfIxnXyKaRluruiDX6W/Cqqz80IjAlJd40gSE+XruY
	TPK4QfJsWybD443crz7VeoaSbHNZRHxYdqPupaqmdIzIYC9jrpfBZKjOVWCQDDkFUZ5HnQmPuFQ
	8uG86iGrao+lxFhV8tJWbLEtPJ4JK68euVCS6py9rDyR5oPBJdG3Nzcff6rHF1V5uj7gUB2CrJo
	FWh/c1RPG4sWQUz5O78ffYniH4f8pzE45ADXXlADGiEYjlhxsYwLF9rGENkBg2F51R7oPxTSHjK
	guruoOP/Jq
X-Google-Smtp-Source: AGHT+IGYHFONNUotKor9AwdwBpAKxhh3g61crvlGCa5AwvCNjlgzokphZFqfiS3bpgh4iCtgc9HZ1Q==
X-Received: by 2002:a05:6000:1a8b:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3b917ebb5bamr2437420f8f.47.1755098640145;
        Wed, 13 Aug 2025 08:24:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm21721544f8f.51.2025.08.13.08.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:23:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 03/10] soc: sunxi: sram: add entry for a523
Date: Wed, 13 Aug 2025 17:23:57 +0200
Message-ID: <2791868.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250813145540.2577789-4-wens@kernel.org>
References:
 <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 13. avgust 2025 ob 16:55:33 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 has two Ethernet controllers. So in the system controller
> address space, there are two registers for Ethernet clock delays,
> one for each controller.
>=20
> Add a new entry for the A523 system controller that allows access to
> the second register.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 08e264ea0697..4f8d510b7e1e 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -320,6 +320,10 @@ static const struct sunxi_sramc_variant sun50i_h616_=
sramc_variant =3D {
>  	.has_ths_offset =3D true,
>  };
> =20
> +static const struct sunxi_sramc_variant sun55i_a523_sramc_variant =3D {
> +	.num_emac_clocks =3D 2,
> +};
> +
>  #define SUNXI_SRAM_THS_OFFSET_REG	0x0
>  #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
>  #define SUNXI_SYS_LDO_CTRL_REG		0x150
> @@ -440,6 +444,10 @@ static const struct of_device_id sunxi_sram_dt_match=
[] =3D {
>  		.compatible =3D "allwinner,sun50i-h616-system-control",
>  		.data =3D &sun50i_h616_sramc_variant,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun55i-a523-system-control",
> +		.data =3D &sun55i_a523_sramc_variant,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
>=20




