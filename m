Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9F126F3E
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934818; cv=none; b=joVUV8yuEPU2PeKD9LLhIIKF890SGikezW0DmMEDHB8i4osC2THg2yg30qzDXebuKlsVt5gDSwO/Rhutd20pYo/1wmW3WP5vY9DBJP9bnenbQbw88GxhGquY+6JIBc4ReYBcOC84DBvk5OpNm0c7y3tDZJpinFaBYfyMuFj4Iys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934818; c=relaxed/simple;
	bh=zUMsRHLPQC0qtS5dSZJqLfKPUarA4jJxlrQmuu8tiXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rECp2YwKBw0U2cdcCu+GGiD5gIMlk4G7Gria4dNHHVi6yg1wWHUIJz0HQwSi0NUM7jk9R1wXSpNJ+UYRbg2tZULK81QHHRtZL3ASC7+0QVxFG+z6vh/YGV9HtZjQp6IMAxHvqL4xX5RVt/KkgAb5hgg4XmkJAPG2DdqJRb8p7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOeXNuhr; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOeXNuhr"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5620595f743so46574a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707934815; x=1708539615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PP34yk7oOynea6CHC1QRC9Iv8jbmZngNsL/j60HriD0=;
        b=YOeXNuhrr7IbfRqrT8B9AzPzXpV01zGz6+4gVidQjmOPplkHIUNpAiqfuy3z79HunC
         eQ1m2Xbsf48gM+6GVNtZMuU/aytp4zCs+tSLtuKKR+TdTLVGdB9I7R5DoAaUUvsjn0Ud
         mAvUGJz1JXArBLJuyi8/Off1laKW4m+1dTXmEzRsJghx8zj+VqIGpDYpA1dmXnq/DNbQ
         /YUBcYxhmZJzwJ+w5jFqsSM8Y3WoWB7JqjekzZUaUOKeDdVw+XsAvSQeHaFlbXh9GRzK
         Jhu3QRp+duanJ7qXy6wNH4knY2dwvX+xib4hulUzx9u0hvPlC6gGE5bZ0/2jfLtgSppO
         aLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934815; x=1708539615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP34yk7oOynea6CHC1QRC9Iv8jbmZngNsL/j60HriD0=;
        b=LUipFRO6uZ3LK0PLgk2bpYh+r4ChYDdPR1Xso3QtJIuI8klElijIncEVGz/aUYKYAk
         CRvWX4YxF3GuVI9+sYXtyUu7VIOG/QrEykK0Qad21mbhDKVpvP3izsLO8drGh6Mb4H86
         LYCiti8AUznc2M23RS2hFrdtAG5/PSY1Hoo36osd8HS+dIsedFCblv5OcdCV1G+XDqGu
         24+xdBXNMr0tXtJUWT+W/RK1o0mhbegRNfbdjOcHP8KF2ii65wQUp3m6p5qmHLNbMXsq
         t72LI795yCTlQppLM5am7eGAifDKAmCRLMm6LfvcLWTIlgW33rUzVHdytlO/QzIbuFPY
         6Ajw==
X-Forwarded-Encrypted: i=1; AJvYcCV1jLhxnujeDNgRYhl3rrMykNDkidF+07Vc1i/4wFku0oz2FJnbzCYb+qBKHKzFrqXvYwEFW9+Sk69WwGAOxiRU0TFsNSxP78v1hg8=
X-Gm-Message-State: AOJu0YwsNGqCIRTWHjSo285gdiDTmKgzei3MPFMsSZ+lNBJCQgNMwlsG
	cZdXnroOJ2bcGjwdcKkS9sJHtZqfjHMbH+RU1T48o7jJqrhYwJmVxE51s/GD
X-Google-Smtp-Source: AGHT+IHnl9vWIq4jk4P+8F4sKWK9iouX4C7uaxoER6CmvE8w4g4daaknDkYKDzjBwh7BvsWl3eDs0g==
X-Received: by 2002:a05:6402:1491:b0:55f:8031:501c with SMTP id e17-20020a056402149100b0055f8031501cmr3013556edv.30.1707934814830;
        Wed, 14 Feb 2024 10:20:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx62rDzQzEZiuxkrVw4ugxvFbYR4hlccvTZbHwZVz3CRI3rBVRL7EVVoTfug+sBTg0nVyW5zVYC4NuXtu5axN6lqvQvzAu7I3JsfxWKWCkhPGDS/ViG/3zxsws3dWI/W39vzETKNnibqVjPXj7l/GBKvOWoiNkJ8vxJFIdcc3lw5qAYxfMuVSsQp2SuD6Yj99TY8sDx5fif2INN+47mrfdVO1IWbs0sWDmK8u3ax8lBvfB
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id p2-20020a056402044200b0056200715130sm1534672edw.54.2024.02.14.10.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:20:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-pwm@vger.kernel.org,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:
 Re: [PATCH v6 126/164] pwm: sun4i: Consistently name driver data sun4ichip
Date: Wed, 14 Feb 2024 19:20:12 +0100
Message-ID: <4544997.LvFx2qVVIh@jernej-laptop>
In-Reply-To:
 <705f54a13b59fff50eaa345d8b1e0c691345b996.1707900770.git.u.kleine-koenig@pengutronix.de>
References:
 <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <705f54a13b59fff50eaa345d8b1e0c691345b996.1707900770.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 14. februar 2024 ob 10:32:53 CET je Uwe Kleine-K=F6nig napisal(a=
):
> The driver uses three different names for variables of type
> sun4i_pwm_chip:
>=20
> 	$ git grep 'struct sun4i_pwm_chip \*' v6.8-rc1 -- drivers/pwm/pwm-sun4i.c
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:static inline struct sun4i_pwm_chip *to=
_sun4i_pwm_chip(struct pwm_chip *chip)
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:static inline u32 sun4i_pwm_readl(struc=
t sun4i_pwm_chip *chip,
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:static inline void sun4i_pwm_writel(str=
uct sun4i_pwm_chip *chip,
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:       struct sun4i_pwm_chip *sun4i_pwm=
 =3D to_sun4i_pwm_chip(chip);
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:static int sun4i_pwm_calculate(struct s=
un4i_pwm_chip *sun4i_pwm,
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:       struct sun4i_pwm_chip *sun4i_pwm=
 =3D to_sun4i_pwm_chip(chip);
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:       struct sun4i_pwm_chip *sun4ichip;
> 	v6.8-rc1:drivers/pwm/pwm-sun4i.c:       struct sun4i_pwm_chip *sun4ichip=
 =3D platform_get_drvdata(pdev);
>=20
> "chip" is usually reserved for variables of type struct pwm_chip. So
> pick sun4ichip as common name which better matches the type name than
> sun4i_pwm.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


