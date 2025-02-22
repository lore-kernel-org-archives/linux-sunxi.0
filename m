Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4EB206F3F
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216955; cv=none; b=IaFc7R+wK2IOH40MSQN30ZxWacPpJ9MjATxpVOHgoIkHti7eaMHqyYlEetiE78Mv9uGQ7gWvOz+yV9nwMbjNaURew5uKAxlW2o56kQnGRMLizD9QSBojpXaLzBbS+QpSlcE7Cr+tf5AUD/mpHKKg2CToWS6em3e88r0VvymolU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216955; c=relaxed/simple;
	bh=tY0toxuyeFkv5yLBBrKxkKw5L2ZKpN3XGwVbVHevqFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u86SZSsip6+VTp1eoRdb/UAIWYIFa3u6pKoOBpnKXAPxCej50bjcQwaJl8ThpOzUqJ0rT2Crk1DZO8mxTHR0l2fEY7Zksn1nifzMNln+xqOnmBxAhewHfCfaiMioIL7/knrauYJS7iX8hUUUYgZV+FcI1OB5c9pFEO4oBqG2fUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAVHCDOC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAVHCDOC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso29015645e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 01:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216952; x=1740821752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHlH9GRTTu/x712yX9JTl9QV/kQ/7As/47pnB+L0hd4=;
        b=cAVHCDOCvKi1JiywxzgZEk2BCQ3QGVj25lkdzA42+v3QZSiiF0W9igJLQedO6iBS3q
         iowkKq0iPg+LoSZVBaUBtV5cAjn5wHj+YrLqBw7DpEFBknA7WOesAg6Oewx4QLmmuvdQ
         13hZwl6X9wJPImGvFuLGiWT+bkb3i31+FEzfa7aMHxXtynC+bITpc9LemghamlWFMZ+t
         g3sX3x1SKafTyNn6jR2t41nqnFHe0NBUxNzW2K6yRy6E1+ZhHqhtDKW2UKAHZLVKN3ys
         AVNO8Hy03piG3JPvkOyHu/f12hRwsHA6ZyllQx2gnjD48HyHwVOjnQGvtQTu5JWd9Dxk
         52bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216952; x=1740821752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHlH9GRTTu/x712yX9JTl9QV/kQ/7As/47pnB+L0hd4=;
        b=L3c+4YUXZbLS8BDG0UjhXN7OolpZ4VRTeJPW64/JQLWehnByYVFb056nenWTuBY9cZ
         tZPdTNJvB/hy6J2Ddez2AQAfx/gSBjgs9xFGQ4c806Sr/czJRtK5YUChZrOBDpxJLH+J
         kylJkuzuCFc1cUV5647Poc6QxepfcL1ttuQdNLpN5he4mQIro7WDD/KitlEMvOGwh5U2
         HGEMzxCzQwvLd+t6VABQENTlm1rElPYzyKFFnelj+OXiVp0nWz63l/Ohpu3cXWG7dnMV
         vkb51ybYyLpBOz+7YFGARiRstZAWPzvPXU4D0h4RbpMcammrbbhHyyyW+NkxJ73CrNSb
         yDqg==
X-Forwarded-Encrypted: i=1; AJvYcCXZiqPRDwFstZUvfH7z/GxviN1Qfyerza3pfUDeC0NlxrZNQ/wufzj2KHVHo6zDx1hu3djWMQZU/PsP1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJIs2hVinSNsbRPlq3JpiI8lvdOEIqAyg0mXP/G/jenQ30zCeH
	lLULoAZjcu/htXDGz5jHo5pdTIoriBRRW+cvMi4hvi8vkGXML1yi
X-Gm-Gg: ASbGncvQh5bYpTk8JjzZNmA66U7uNDG7oF5gFZAEezZDxmxbGfF9D93Sl5SNy6LLvUD
	pOnPsAkMSHPOi81RPwdLTt5L4OkBZBDJiNv2lcXRXeTzaenL71BtfzdkvhgIZrzKprXYaBIR92k
	xaJhJGjywFH/lJZ7spHkC26wnm/20S03mp79KjqxxnQdI3bF2vcRrPPVIB0Sy82h+Dqcq9ztqoV
	2yEXUmiZj5LT4pzWGx+NAiDn7KPQtbBEVcavBDsaR9XPqk4nBFlH224TX4BGwY+AkDnI2WWjCEs
	GmBHJK6mT9lR0v84S+2MqOciysMdaqxNL+Nq2+ZmVdmA7uXOTagMbkJ51u7LhM2SJhwU+QXqEoT
	FWA==
X-Google-Smtp-Source: AGHT+IF/vk0QCfHjxCD3xQN2FAZ8znHgGm0G7SYedRPknv6M80yqxBaJ4GKJcXeQpUbJdA5Bq/HgXw==
X-Received: by 2002:a05:600c:3c86:b0:439:9b80:ca6f with SMTP id 5b1f17b1804b1-439ae1d7272mr66049675e9.5.1740216951812;
        Sat, 22 Feb 2025 01:35:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdccsm25767979f8f.24.2025.02.22.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:35:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH 1/8] bus: sun50i: add DE33 compatible string to the DE2 bus driver
Date: Sat, 22 Feb 2025 10:35:49 +0100
Message-ID: <9408152.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20250216092827.15444-2-ryan@testtoast.com>
References:
 <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 10:27:08 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> The Allwinner H616 series includes a newer display engine (DE33). Add a
> compatible string to the existing bus driver.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  drivers/bus/sun50i-de2.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
> index dfe588179acab..47c87d51a603b 100644
> --- a/drivers/bus/sun50i-de2.c
> +++ b/drivers/bus/sun50i-de2.c
> @@ -31,6 +31,7 @@ static void sun50i_de2_bus_remove(struct platform_devic=
e *pdev)
> =20
>  static const struct of_device_id sun50i_de2_bus_of_match[] =3D {
>  	{ .compatible =3D "allwinner,sun50i-a64-de2", },
> +	{ .compatible =3D "allwinner,sun50i-h616-de33", },

Since there is no functionality change, just go with h616 compatible with a=
64
fallback. No need to change the driver.

Best regards,
Jernej

>  	{ /* sentinel */ }
>  };
> =20
>=20




