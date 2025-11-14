Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9030F52B
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Nov 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126244; cv=none; b=Rl5pUwbFGyTssF5EN/AJojDaGzS4f/J13RO+WmhYMEiWjW7WmTqwl9XqUcQlhODytLL8j8ztyaCvb56JAvlYQqqpFVdIPesuOk0Fi7wjLZ63GglGHPLRXR0UPKacspcSKXk+fez4no+/U8W2IoTZhCDUFwBNny7moNHy1T2zHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126244; c=relaxed/simple;
	bh=l14bAdG7sSenVgnTvQe0fC1UGWAoSkEFo21BRNcbNGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHTqRsXLpwMih7SZYwakaveCEsvyeoX5f0GGIoqHKLMQTg4O719ZtRTLVPsyq6M9iwuQ7Rx19oYxKf0kn3E1rijfD9p7epU4kTQrawP93L1pejH4WQnyLVkBKlii0NVPCv/zqtqdTeXPpXscpWPwGvJfGuE2oYrilookBd5tvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrkES43F; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrkES43F"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso17854575e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Nov 2025 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126241; x=1763731041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0TpL/uQKcXjj/1P0tKp0hA2j+bgPUGaGAw/0f/W2wM=;
        b=NrkES43FKa4j1Cyti0y5pOEF8/Y+Fvxl5Or+BCEl4/2Y+OJHxU20+yXILNJPmcJ5cb
         bMlGD5sCKnuXauKCXfNm9YK+hKPKiUNjKtmXCrWD85tI8DZXSeU+rIeQJRyEyzYdSTY2
         D/QHIfEynMDWx3c+l+Wi/jJFnApWvVAZAEA7dre6Y+7vqUEA7WxmMTPTrEi/tn7OzHCv
         XKhOWU7PIcODA5X160BGzzcAE/nWIwQgnIDHlmMVlWZJ+L3MwdAwrdERDuUPxI+rk9qL
         U3Kc/TQ6EhG5pKSSNhEeXQ4B1vaTecNk1KMZ92bUk80TonMBxAecTOFRtDqWYV04VbGm
         1o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126241; x=1763731041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0TpL/uQKcXjj/1P0tKp0hA2j+bgPUGaGAw/0f/W2wM=;
        b=jwO17bWxNxaRBTZEIvkPHsRIao+o0QoJrZFZum70asPb9+2wFTPxARm44E4jmPNUbA
         iJtytjf5/160N+ls9w8F2okgDJRgeA+lMnKJXOIWIXFyudm7hlPjBK7iXmtCZh9YQM3/
         ZI9El6zAkBxriwQWMEnAPOJZ3+74juXNcWRFlo7REyTYvHMT6TKma1k2xSvywj17VWvK
         8jj8JMBKmIqtlzG9nDqQSXC1i0hmQLGhuwpHWUEC2N5QsH1qUL2sqcLns05yiMmc/2v6
         WdnkQKVeazBODvVQbQJKlpq01Yekp0ZvzjA2KRp4A0++G2p2ZeDW4sB+pQSMPQ7ZpDM8
         NOAw==
X-Forwarded-Encrypted: i=1; AJvYcCVsCUhVpSAe6PCvNgjAsBHfRARTclGKM07msII0FwtO4o+t16F8sqC6A1FY7DKj0siwIjX7EAC83BB1xA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxRlZQELOIkVLTk9aUIasslBh4TH7ouYR2uVXyfl6mr8ZGgtyt
	ko60woG/7MprxK4GrqjTFN5G+H9RW8I91l0tDGAorlw63WVql8EO/we6
X-Gm-Gg: ASbGncvOnUdPk97ftTzjjUPm1N3J2Es1YGTGr3fujqsBjEodnFrXJ/SVmhz0COHp6tm
	tGA47y4gFaR/lUo94krl3qXbgGFP9dgY6m3eazFCEHNUElX3yypUhZLt65L0i0JeCn9AW4G/Erb
	FRMqlDWbCPhq5sraMKPEQn2tIxZUgUPZ5zJ0xEpdJwgG+CgTQrnzTPUmp3NXD9e4XByEtllOvrR
	LJk9rvIx2/fF3x2ZU/EZOO0UXelAKjUB6wJxh/EDJO/7b8a3pbsBmD48u43gH9sk8jJUtS8TEYH
	b/RDb/CJeOcuI4JKJy61tOArlf9BQDM1ETYz3C4QabncnyMjz7gImqkvjW7TtxdBFUW7qwUjbqf
	H9XTGXcsPUJjimRJvs5DbDkjQ5MeHjuFMoUtdf44RCMOrZmnKIc5nBrgyeP3aaT+xBsqmlesZY3
	st2//406cxFEEt5dnHIHM/WD+U7h8mWZNFFUzBO0cDDJ51B3M2bu2lPmWPtbBfieY=
X-Google-Smtp-Source: AGHT+IE9bBUs5+fK/teaotf1hwhzAkTnpdK+HO3WDqdKR+mWJDdDdywb+mQyN3FtSPr5SthQHUQsmA==
X-Received: by 2002:a05:600c:4695:b0:477:7b9a:bb1b with SMTP id 5b1f17b1804b1-4778fea681fmr33855485e9.32.1763126240242;
        Fri, 14 Nov 2025 05:17:20 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e43c2fsm141848115e9.6.2025.11.14.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:17:19 -0800 (PST)
Date: Fri, 14 Nov 2025 14:17:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
Message-ID: <jhrvha3ytpt3wqvyfrlt5zirfnnnijssrufzg6bc4cfah7ahln@wxnnrdv3qbid>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3uqy45lsar5fgfon"
Content-Disposition: inline
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>


--3uqy45lsar5fgfon
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 11:28:56AM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>=20
> Depends on the first OF patch.
> ---
>  drivers/soc/tegra/common.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

I assume that you'd want to take this through the DT (or some other)
tree, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--3uqy45lsar5fgfon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXK9wACgkQ3SOs138+
s6GJEg/+Lvwv/Uc4dUYUzG/6oY2h1PdiGuJvJA9YspnmST4S0yhN92w4uF7VktO8
48OfDwxqJHwx3SDbrqTyuzmBBpk+vUOVyILkxEFHIHHfU3FSie3o3o8xQ1reITF5
xRkKWVj4drW/J3lr7dXETpSnaq8ASU9LbXzjA5V5WEZIjvOwEDTOiUtjycoL+dJN
EZcP60yEeH9WZqPvBNJcDpppUFwZINIUJ41aLebwav40cxSOr9AWGyaIoirg0hAC
4B5FfUrlvpG6uToKYAI+F8onTpuhbY7ucFNx420eOkY1MfcBDx6CxL2rATwe0wso
U9+7SRCF59hiIZLQVvPj76JtLjAVrvmfanOKa5J2/Y/2vUG/3PfSdzCzqXykmv3i
fCsdqHqur0RkWwjayS76p/QSldpOQszoGL4Uio2k7u+RM5SXEA+E1im8qq7ed2+N
0XjgaZjOoGP24Gn+V1UUyD04j/IjPm36o1hHwa27wJnEf33rp932nOQch3/T0fA+
3MERBRP+Px+jXOgg3D3F/gzJa3Ps7rRNp3XRHmv4EwjSMU1Hoq9ePdT38fW1Xl0o
x+gIeNWpWoVeI7D+3OfAoJTthFdmNVUznKco4qxwigLQnoGo1s0Id7hRygTsz1fC
MGSxHO88pn2zCtJqXCByFHjVRYA+y5zQx0zB6IX5ndliVu/HM3k=
=GzNq
-----END PGP SIGNATURE-----

--3uqy45lsar5fgfon--
