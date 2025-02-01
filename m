Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1245C14
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Feb 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738407954; cv=none; b=HLTUHWCT3Luk/Qkyn92ItUg7ES1emhp8xc0Vx/Xeg6HOvETZcLk6U238qNMUtwxneWQvUF/OEgk1TY8a/WcUKP0Lg2lJ7ZtJAfGHpsPNIofpleAKo6TkaNtSQ9i8Q3JPNi8AhVRzYE/gJzKYOv4iXZQoPYY+LVRe8Pg6oV4xUIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738407954; c=relaxed/simple;
	bh=QeyoZ9JZh4ldAcSoJnAO6EQhHF4J+fpIS05dmP1aGBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOWhx2pnWE4TWrMNpwxscFfshT4iuH2zdHJQ/J50HOngMV8jpxjZ/VdDZmGaiXNtgeVHKmdK2gdFfZkChTkKX5ttJE0nUJHke4+Fdkexdqs5pDG+RVHWPI6ilfYxCilOELnYs9Lwax4KS3ox7ANuo9EGzlx5oosC6GLbFvgZd48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30737db1aa9so26212751fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 03:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407949; x=1739012749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8U+1tpqHzLh27GaClK8FP8Rq3KYuov9AdiNEVI21x8w=;
        b=vgafgmEbyIYhP/CZAjBj+hJRwveGnMvUkITU0Di5v8d0C8Y3T6tiNeUK7VS3GL+j8I
         MkvBM36vru1EuL7vYtMwj15jf+QfBM3mAeszERuA/uTXR4AW/j39IdCdxD+DoF6EXCiX
         iYBHJgUyo2/lZknN6PQ6MxF9biEUsuM5e7/oqwk/bLrOQmQqvdQRhIKeF1bmJq+cKx4y
         Y5SyPeeZeyjCKdodlRik61aYQwkSvE6oe66OPQM9ILU6lQWDyDQKLqGhx3uKwN8yxf+X
         EvwCpNWg0a/v4A7kt67OezhcC821Ye0OsqR9HTy1wAGB9Fi2cE02UGi4BaMMReKOxDkQ
         VWiw==
X-Gm-Message-State: AOJu0YyrgKbfxXK2nEnsB0WdsKFhS6pKo/QC+nF4UbxVjutsbKJ3ZyFI
	bqCizNKhvMNQfFk+T6FQhJ5+c9iwF9gK8JCJNXunc8WyBThFmsNsOZSqQv2a
X-Gm-Gg: ASbGncuyVAc9sPqHqPw9LoLlT0j3Dy3btp3HEq0lIHD5Tr+9iyBQRi6ZAwj2BUZV91Y
	FwYVY1eHA9iH/OpMiqs38sM8e4bTOzr1izPSVF+7HNmCwm47ADV1zeoefbXwhX+ULg7Qs6+be/K
	5uyn2oMhZ6spmmjsH/R0mEArMJqwAyCHQHxfFp/zCZcxR5fHdRr27A3R5G7XfqqsbwAqCuoBY1x
	sPjEAhYcNl5bxMsipL3RTSCfAY+DFUZTHkMy73Pn2qhvVAOAA9SCLJ3ifRhjKO8YZP2VJEsijgS
	qOkCEorlcoCL9PW6Cd+yI8swhwm97oTN1/sZ4JlICNb6X97O
X-Google-Smtp-Source: AGHT+IFCWNXkEvCr9P0d7M0bLw+pCca2GTeBUqS7WchrP8f29bJ1WVTjAz17DRwdikQ14I/b/d8G/Q==
X-Received: by 2002:a2e:2283:0:b0:304:68e5:eabf with SMTP id 38308e7fff4ca-307968c9b71mr42859391fa.23.1738407949157;
        Sat, 01 Feb 2025 03:05:49 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a309fad2sm8213341fa.59.2025.02.01.03.05.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 03:05:48 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30797730cbdso27390081fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 03:05:48 -0800 (PST)
X-Received: by 2002:a2e:2283:0:b0:304:68e5:eabf with SMTP id
 38308e7fff4ca-307968c9b71mr42859311fa.23.1738407948632; Sat, 01 Feb 2025
 03:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131231455.153447-1-macroalpha82@gmail.com> <20250131231455.153447-5-macroalpha82@gmail.com>
In-Reply-To: <20250131231455.153447-5-macroalpha82@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 1 Feb 2025 19:05:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Bi__en5iw0Bv4=17MrJ2+HxbdDppoHiAxApPStjPw4Q@mail.gmail.com>
X-Gm-Features: AWEUYZnfWFSX1_fTI8oxEiVO5dHsIJ_LtTRZxZgbPDCntorA83Cj4iF28Ip2qHM
Message-ID: <CAGb2v64Bi__en5iw0Bv4=17MrJ2+HxbdDppoHiAxApPStjPw4Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] power: supply: axp20x_battery: Update temp sensor for
 AXP717 from device tree
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, lee@kernel.org, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, sre@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:17=E2=80=AFAM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Allow a boolean property of "x-powers,no-thermistor" to specify devices
> where the ts pin is not connected to anything. This works around an
> issue found with some devices where the efuse is not programmed
> correctly from the factory or when the register gets set erroneously.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/power/supply/axp20x_battery.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply=
/axp20x_battery.c
> index 3c3158f31a48..345a1bbe50ad 100644
> --- a/drivers/power/supply/axp20x_battery.c
> +++ b/drivers/power/supply/axp20x_battery.c
> @@ -89,6 +89,8 @@
>  #define AXP717_BAT_CC_MIN_UA           0
>  #define AXP717_BAT_CC_MAX_UA           3008000
>
> +#define AXP717_TS_PIN_DISABLE          BIT(4)
> +
>  struct axp20x_batt_ps;
>
>  struct axp_data {
> @@ -117,6 +119,7 @@ struct axp20x_batt_ps {
>         /* Maximum constant charge current */
>         unsigned int max_ccc;
>         const struct axp_data   *data;
> +       bool ts_disable;
>  };
>
>  static int axp20x_battery_get_max_voltage(struct axp20x_batt_ps *axp20x_=
batt,
> @@ -984,6 +987,22 @@ static void axp717_set_battery_info(struct platform_=
device *pdev,
>         int ccc =3D info->constant_charge_current_max_ua;
>         int val;
> +       axp_batt->ts_disable =3D (device_property_read_bool(axp_batt->dev=
,
> +                                                         "x-powers,no-th=
ermistor"));
> +
> +       /*
> +        * Under rare conditions an incorrectly programmed efuse for
> +        * the temp sensor on the PMIC may trigger a fault condition.
> +        * Allow users to hard-code if the ts pin is not used to work
> +        * around this problem.

AFAICT this function won't get run if there is no "monitored-battery"
property under the PMIC node. So if someone were to unfortunately have
a dev board that has a PMIC with incorrect efuse values, this won't
save them.

This should be exceedingly rare, so I only ask that you mention this
in the comment so if someone does unfortunately run into it they will
have some clue.


Thanks
ChenYu

> +        */
> +       if (axp_batt->ts_disable) {
> +               regmap_update_bits(axp_batt->regmap,
> +                                  AXP717_TS_PIN_CFG,
> +                                  AXP717_TS_PIN_DISABLE,
> +                                  AXP717_TS_PIN_DISABLE);
> +       }
> +
>         if (vmin > 0 && axp717_set_voltage_min_design(axp_batt, vmin))
>                 dev_err(&pdev->dev,
>                         "couldn't set voltage_min_design\n");
> --
> 2.43.0
>
