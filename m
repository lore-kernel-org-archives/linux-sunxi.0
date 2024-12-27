Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3210111CA9
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735338878; cv=none; b=l2ikjcoYAc62QmNYuhqYqay0LLx5YL6KTrjGBGFjQGNm4oMKahu2WJ6CoPVlBkUp+kTUpPFWBYsYkEWVBM4SEYQ4BMwXHuT4JYxSkGzHIBIWDu8EdKmz4JSIx/trryt3lH9HWG1HQhTfELOv23oAVPUjDZNZHsToR9PT1YHmkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735338878; c=relaxed/simple;
	bh=hBUmPxTFvEugmhonLC7AHGxs+gMigWic/1AXVEtSdoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlRCAELdSF+WtWBY1Fa9ZuaozjxZa9LBY1Lc9bDGzPtaWLh2XQUMhLAhrUmwzf8ZJAtlPrsNoKADmPP2yhxk5z+kSvQDeSqT0D+rzx0we/e9w3KvQWiGM5mcsNYQMDLI60LsVsz+hatrAQ5x7MMFJThQjE4hkiuLKukq0yLXFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSIMni9X; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSIMni9X"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2a3a40c69e3so4055056fac.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 14:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735338876; x=1735943676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBUmPxTFvEugmhonLC7AHGxs+gMigWic/1AXVEtSdoc=;
        b=QSIMni9XtM0M3CqAGtvd5WoNRvteWPkzHceIDtq7R6K2WYi8SN5UyJXiVefe0LOcT1
         HbHFOz6r2KXyZHgqnoVtV878oj5TMiI37kqwjTOMqkN57rgMoo++mfIQEGmaYx7PIUpB
         MMR4iKpgpRmHVpWORpC1gGYxtUcVn7Cs7DXuDXMLdqflC31m3r2c/jug1hixpLi7j7aa
         usEIWPLRBDfl+PgEgCcB6dhFVFyGm/WjIH0KHqdplp7n8C0GbJFszfd6rithy6P0sMKI
         VW2d55yBO52P45WQ3W+/9nxdVT4f87cTRqh2kd1xJ6Iu4AHSMn7E7dufzqwMn3L5XZB0
         exlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735338876; x=1735943676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBUmPxTFvEugmhonLC7AHGxs+gMigWic/1AXVEtSdoc=;
        b=hGY5Bnax/EMhF/4cI2jZIVoNvluFkvnWtEaY3EUt6GGTqtuVOAOTDQQKlqYuDNr4eE
         qYowKA9a690pVgSTOYzlDn4Zfax7xacos+S2ngPxenyjjPf7k8iwOSm1V0hKMwQCt3fg
         IhwmEvMcv30zkZyOnjl+PKUMBnnNr/dPfkWw+CreS0IKDjhGsY7wsuhe+LQItcPclDsp
         mP0y6p+cE28t3KjOZjY9SDBrdsLNnvQU5YNz0d3T/zSPNWn2rSDpssLKZnar46ZoR7VO
         /VaZthUghS/Nmq9Db2OVcM9A6OmqHiDYMvf8/cjiVsl8iaw7y5kpGmj1JUHhoHZnC4fZ
         NRHg==
X-Forwarded-Encrypted: i=1; AJvYcCX7IuxPZQO50Hi22d3u1xOmWv8dmnFuXLLdTAn9hCCE1M9DjG4AKeV63N/SIGEltTMO6Y1CGTCMCmePPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIYLjyI2pUtR2GVIWzG/WkhHB18r6TN3CaUHHeG98ljO947wM8
	yIE4j95fK6qsrtF+S4qUcKrELkKST31bzoP8bKuIOMyxbUTmxTd3IpSaI+YPsLktnIjWvIWnTES
	Bu2MbMv/y4gZrHEhsfeNNwcHYWbM=
X-Gm-Gg: ASbGncsS45zARBxtPg9BSfSL5IBvoTfvR5+D2S90t5Cl+lxRCSrkTVwaw1izUtX/wlA
	OW68eukUAKxzRhu4N9/BBjP8LqDyzYR6sx0lr7gIhWNKciFCpLT7+
X-Google-Smtp-Source: AGHT+IGPwfw6kuUjAFDA6kF5F4HgRlWZuZwnMK/ENL1OPJ/20iwoJASam3MfJb+yHQ9p3ejmQn1fvhV9hJcadZlYtgI=
X-Received: by 2002:a05:6870:2f05:b0:296:e88f:8f56 with SMTP id
 586e51a60fabf-2a7fb4b7968mr17783303fac.26.1735338876144; Fri, 27 Dec 2024
 14:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007001408.27249-1-andre.przywara@arm.com>
 <20241007001408.27249-4-andre.przywara@arm.com> <675489c1.050a0220.8d73f.6e90@mx.google.com>
In-Reply-To: <675489c1.050a0220.8d73f.6e90@mx.google.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 27 Dec 2024 14:34:10 -0800
Message-ID: <CA+E=qVf8_9gn0y=mcdKXvj2PFoHT2eF+JN=CmtTNdRGaSnpgKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mfd: axp20x: Allow multiple regulators
To: Chris Morgan <macroalpha82@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 7, 2024 at 9:45=E2=80=AFAM Chris Morgan <macroalpha82@gmail.com=
> wrote:

> Using git bisect, I found that this patch breaks the CONFIG_AXP20X_ADC
> option which is used by some of the battery and charger drivers for the
> axp20x PMIC series. My current assumption is that the
> devm_iio_channel_get() call made by these drivers worked correctly
> previously when the PLATFORM_DEVID_NONE, but now it's not working
> anymore. I'm still testing possible solutions for that problem.

I confirm that this patch breaks the battery driver on Pinebook (and
likely Pinephone). Reverting it fixes the issue for me.

> Thank you,
> Chris
>
