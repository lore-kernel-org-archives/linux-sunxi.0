Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A686344
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jun 2025 04:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751259249; cv=none; b=orYuBX6aqonhsb8Ll623PH9f+7zosJhU06IGPhHU9wGIATYWbKS/Tci4O0BZ+iqB8aCWWvnedh/J6MlARNLZ5vWlewMxDPLe+iHSRRySMiQUNAlZtKo28WDVSyT8FAfejiNXwi1LUSyLvcED+elTaA9zYtf43cH91RCBBMj40Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751259249; c=relaxed/simple;
	bh=q4cChbdvhDL1OSZn8A56fKuAJVHQOXAwQbXbtQgi6LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeeybC3gaThbT5mk/klld6YH8I4slc448r65kaXrwzZWXmxhm958XhJXdL+UUGXdGPB/ddLpmIKFNy6rJsIE9QiugUeldgx00S2vUFPcfNnfRTKXKhD0tUcacr+tOCxlQ9aWrnn/YNklLUAq1SCGghGACuM++0fCOmBw3pp0a3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso37446081fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Jun 2025 21:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751259244; x=1751864044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+et2JbQsekjoDqNx2V23zrGG58Up1Zz2cWU2HWIxxkw=;
        b=VsbyinpTgLNLOARLjc/FC5e9/0gKXIdpxzjP7F7vxdVj8EJF659h6gLqocwgDNi97C
         QA2ciH6FLS/aFZD3onrcsn8leUI7VAHQzPHuwnr7MYNLeI3Ql1qQ3BYFFrC3oq0ksAeS
         3WD6d0VZSGY2ImmNb+Vr8eF9sG3vH9Qf+hC6GobozaD4Jp7tsf/IB4ofH6MAEenYuTIS
         laaKa4haKknVPuwFBlysZIEeSYMqhfDAEfIIBp3NHAAZVuYXbBHUXipvsfZ5odsszcno
         qJkQCb/fiolGkoSteVBTNJCLIDsUq4YrsfsouLAQYzYNUSzDHHZ0G8wlRwb4aA3FEB4n
         hWdw==
X-Forwarded-Encrypted: i=1; AJvYcCVAH/v3b9YJTEiMa7SyHqwfDgG23B2OW+nIvE3Y3IPm406YGJAyR6a0huoyaT/6TwfuGIH/8KO57EzckQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc1lY9uT9IuXg+whcE7tZl1R73JTLv5ECgz3gRRTXS1otGer0E
	WhznI6ZlKwmPw3zoJa7CuCxgBBuz5+Z806iDij0bcHPOshSVCN5J+TsLoXwxdToS
X-Gm-Gg: ASbGncsGTb2bVbkz231/mFxCbfS+xJ0lt18YyjURqR2XXrmvVles+3I+/qoBJ8YfQgl
	cAnXaCEv2V7iwvF24PqQNMtFnbtwcPCyqRqiIc22ckyDPqBr3iZym1W6uAYxCUAtRQxLnQk/SyH
	BqkCWSLLvADgmaZUZE2WWwmE4mcZm7X+zALnmkmkZMwnwvtzn1XO9CfClRCRaU12KIAJHGVwiYY
	ioJ7CV3vvFQgNE+h5FBrLTWIsDBoFnTDzFmT4xgJNtndyesQEOThSoABcxhNe6fAbvrS2qDPy3i
	sV70OUdp3z7zJ/5lm08R8hBUKMISsDUQ/H85h0XvSDLtSqRvDhtFEjhu+9GsbjfvvzKIbpNHjr7
	L7PoN4D7PLV+SZKcybRc=
X-Google-Smtp-Source: AGHT+IGuSevJ+9CiAp4B7Jhl7OvDrdCIbJWo7BAWmGPXhYFc01hgnMGNZkJz2twCKmOkWIRBdrBB5A==
X-Received: by 2002:a05:651c:f0b:b0:30b:d656:1485 with SMTP id 38308e7fff4ca-32cdc533855mr28401671fa.32.1751259243774;
        Sun, 29 Jun 2025 21:54:03 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec5e06sm11677551fa.52.2025.06.29.21.54.03
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 21:54:03 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso22158991fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Jun 2025 21:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6SwG7eSS05a8+O8BtEtsCu7giZ7thjHUQiEk2RBUvqTb+ceov4xdB1dN33O+CrDbrOrUFM8mnwHTPLA==@lists.linux.dev
X-Received: by 2002:a05:651c:31ca:10b0:32c:a851:e4e with SMTP id
 38308e7fff4ca-32cdc575ebcmr24256581fa.40.1751259243150; Sun, 29 Jun 2025
 21:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411003827.782544-1-iuncuim@gmail.com> <20250411003827.782544-3-iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-3-iuncuim@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 30 Jun 2025 12:53:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v670s_r4NG8hWHQ_exc6TM5JnvAEYw-vp5ndMn39X-B4Yw@mail.gmail.com>
X-Gm-Features: Ac12FXylrAnNPmh-5tW8elyoVrQtjqLfo-AL1Tmi56dNnknRJjo1EfbWOyGYXgQ
Message-ID: <CAGb2v670s_r4NG8hWHQ_exc6TM5JnvAEYw-vp5ndMn39X-B4Yw@mail.gmail.com>
Subject: Re: [PATCH 2/6] thermal/drivers/sun8i: replace devm_reset_control_get
 to shared
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 8:39=E2=80=AFAM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has two temperature controllers, but they share a comm=
on
> reset line. We need to use devm_reset_control_get_shared() instead of
> devm_reset_control_get()
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 1f3908a60..dc4055c9c 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -391,7 +391,7 @@ static int sun8i_ths_resource_init(struct ths_device =
*tmdev)
>                 return PTR_ERR(tmdev->regmap);
>
>         if (tmdev->chip->has_bus_clk_reset) {
> -               tmdev->reset =3D devm_reset_control_get(dev, NULL);
> +               tmdev->reset =3D devm_reset_control_get_shared(dev, NULL)=
;

You could just use devm_reset_control_get_shared_deasserted() and then
drop the reset_control_deassert() and devm_add_action_or_reset() stuff belo=
w
this hunk. This simplifies the driver a bit.

>                 if (IS_ERR(tmdev->reset))
>                         return PTR_ERR(tmdev->reset);
>
> --
> 2.49.0
>
