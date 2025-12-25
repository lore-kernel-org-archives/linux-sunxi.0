Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742AF4F1
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766687166; cv=none; b=EwqXlImlLD+9/+9/lJY9BfFpEnF8onu+wUrmwSK13xWYzUum0eueCsY7PXsmJeoX/AmnSPlskqETeymo+Vf4M2T2/p0NLo86iXyGN7q9al3pN3QP1U+/dMvNufojdG9hQv37lEUDT9t6TeOXnmIGEoNkvUSu4cdB2v/AvSpJGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766687166; c=relaxed/simple;
	bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IU4jFykKmqYNFPxmNjSRUhovKFPojvSs0gyhxRQrPFTPgSsHpGK/VLIpP84Ulogx0xjJP/htpYJKNmAM4Wbk1tjF7cwFm+ggQGiaz2sgULQNCr/go0EO2QDcIXzlmmaFXQnQNB5B1C7b2vHEgiPc32u1x7RO9tw7fyx95BI2ayI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwGIp7TX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwGIp7TX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so6869686a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687162; x=1767291962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=TwGIp7TXN2tAc7Ky58F3yuh0OW0EqrhUpEHeziNSC7sssnV4eB1VL22L6PuGbaqVsc
         8JzsI4QTSeZa/axsSYosF1wGr15Mn93ZIfp5pFTBTQAV0y+YHc5SBGbDIysmdfpXFL3X
         otWzjPijbta0/uZPLemo05txPOuuQ/x386FmrtCtkp8nKmUCr+12U4y09zyuj1FoMxyX
         5MrfhaGRhpPV5WENMq6t9V0GAtLBkudHS7SwEAZPt0FMqd8bU2Sk41zSoWdL2acssODu
         tImhdzUa1yUYbd7kre1Q4ANcF7J8vbqS1sIHnXeLtuYS4wjoAM4WzxYXc/8nSMoIHIKY
         LbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687162; x=1767291962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=o8boZIJ7xqtcMrE1ei8TEgH5+4MZNvbg3IadZnoIiC9AYwhVEeO0B2OE7ssK1Jyv/h
         Q5+jQMfrWpVw1dyI/5BJ/HK9IpQzAo4GTQe9aAoNtBhhjNe1qB7W94VnSKz5i1ejU9mn
         Z1NbljmATw42leU5wOcPF/7NUQONPsHTW8TODriZxslzwSihxX9UGA1M6C76GRHN517U
         9lj3BXNJpRbCTqsOiEpA7X2tBfA+QWM4b46XtS0Z3S+/RDfLpckH6JBY4uJVF5zEQ/P+
         5kVLJ2j1HsbrjjGtisc1wqzwu6Q/LEVyFW01wtokoVQG0aBwC3MpbCXeoddpFKj1QYZE
         nbNw==
X-Forwarded-Encrypted: i=1; AJvYcCUK9Xja74GaPksEl0hK+rzVzgF1aKay/RiHomHD0fl7+UIaMiLNN5eNCWjzM6J9XXf1QlKxUoe6JNIZWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+Iz6fkGCdzhcKZl80/QC9IwdVArAygBx9gRtYR1/q84BlyCLk
	ANlYfy+386MeUyCyI9PStYP+mLAva6+swFKQu8e/ns/z21h3V2fjBfCU
X-Gm-Gg: AY/fxX592BqYSgNwzZUS3zAc20BKiEDAujxs0lrZQ8Z9eaUjlJLQ8H4fJK8Hjfk8zrM
	luAbwOCT2Je1CEqP6hHLh6l3YF/35rQJZM1+MP2wnfzAd3amWxlOQpBMAo462Zten9/hxBIOm0c
	Eo2vQNo+LtByK5llS+tOU0CpJbbbuO3s73/ZRNJ9zLig2t3btLkDKISq8QlUwBcqRZ/XAHOuhPb
	lQGI9jjr8ffFqunyqd0qmLX4l3vPVvqeFK5vIzZOY/uq/RakDwupuPwMTNuvLutnrzIAmv1QPEo
	QhsQrHwLn0VoAmQVOYIKIozJ8bU9o0FGH3TzzpCCIOCX4B3il4jRUgCsC5P7yOjPJdV3Jfc3zFU
	XvmAHEUjHRGWXvx4aKubTlfWfc5B3jbBTEpHiQ3i5RwMtb14+dpDwssHRlFkjH316pman7dT+ay
	YVqSELodPx4S6HeTEHxWx6g+ag3i1tfe7o
X-Google-Smtp-Source: AGHT+IET7IQnJW9NBpb65OlItl1guG9woVszRJ+kZSW9RdHnKQccOHSFq/Loyd3FgIyi5fOFPYZV2g==
X-Received: by 2002:a05:6402:1ed5:b0:641:966d:82ba with SMTP id 4fb4d7f45d1cf-64b8e944ef3mr17759280a12.1.1766687162003;
        Thu, 25 Dec 2025 10:26:02 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b372esm20774242a12.32.2025.12.25.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:26:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add interconnect
 properties
Date: Thu, 25 Dec 2025 19:25:57 +0100
Message-ID: <5967161.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-2-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:12 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The Allwinner video engine sits behind the MBUS that is represented as
> an interconnect.
>=20
> Make sure that the interconnect properties are valid in the binding.
>=20
> Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-vide=
o-engine: Add R40 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


