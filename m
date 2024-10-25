Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05970811
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867360; cv=none; b=P4GSiaBj7Ko5HVzOBMcvXWeGqPZnyIgwKZHkvB3W8R0RSW0HnC0yleuGz4WHvY6Xv7970A+91arBMpN7XTWR4GIbQnvBVhhtik4t95pG3gK1RPe5GjaBm+kGz9LHuNTDPxU5bLigPdDNl3j+Aor69d6/6T8XDD+zNgOhROJt8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867360; c=relaxed/simple;
	bh=n95HD8E2k6r9Hlxwi+aauSNeb77zvut1Fqom0wTaSv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlAMEwBw4lczZHedS+VbvJY2H+K3yJ4t47d1HkYvX9u7WERrkAgWB4YRAxg77CzqsR9VMiRbmK6iFA+FnGenAvqEK4Caext9MjpPr5ejB7mwtJXhD3L3V6eSaKc9k6NIHZ53tL+tpk11PQmLG9FuzSBFwpyjKNaTOOX7EWabR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a4e5a7b2dcso2930675ab.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867354; x=1730472154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vzo4e/k7vyxD+TY11vnCaJqkkqd2B+yShJL3uWcZknQ=;
        b=wYeVJiW6dAwMosXrvx1EDUJCxAcHmlp6cu0A0jcpHiWpK6yOaUom1pkyZeSNZzhHh6
         bCfbkehaFJWmFOBOqbHVv9I+fcYxHvoQm/aKAU8DpCPe5ldIAa+CP2JJfPizwJ4XrR1H
         vzASL4RAUTvLoE6oeKyLswAmFpBjLvzK++qQJq252vof9V98PgsRWEIiuFgOS0yPyZs7
         DGznDwUwtTSw0q12C+sZAR79cRjJTWCYHpvNCkoWxYmL/HJQUNlhYA+pAZgc7hLBnF29
         sSEWZTpzq0KcK9gZk2Jn4re6jtpGpGRSvAYkolCHP2s7xaDbr8uCdFTJcF6eCkNnCxUT
         NNqw==
X-Forwarded-Encrypted: i=1; AJvYcCXponSdCl2lWXkFHIMktzXzjJXC3QJqIfJU2taiiynSdPguJNfGm9b94jjHppn74uml07N6CbDJTYFpAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweKNfqGs7QKNmxFUOqR7Im3BMK39+0cZ5cJBDVwzMW5uBkIU99
	U/5z05ja8MmbFEtIp+WbWMcc1i2bpaeCJqLZvwLutX1y0Z0mi/NbxDqyVm4J
X-Google-Smtp-Source: AGHT+IFw0sFghXzTi77rRhX7PO0su7A8bnyWL6n3EYI5voaZo5UKOcgdkbLc1sryX0cDpc/z2c7izw==
X-Received: by 2002:a92:ca05:0:b0:3a3:4b10:65a4 with SMTP id e9e14a558f8ab-3a4de7a3dd5mr62937345ab.9.1729867354043;
        Fri, 25 Oct 2024 07:42:34 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4e6e728b2sm3033275ab.80.2024.10.25.07.42.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:42:30 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-83abdaf8a26so85482739f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4VOY/3bhjJLuGETwUWTIEMri5FkJ4eRmRyYN+DtajgiWbopn5kAJG8YGiWEd2PRy1pzd3pghNQddmtw==@lists.linux.dev
X-Received: by 2002:a05:6602:1490:b0:837:f951:38ce with SMTP id
 ca18e2360f4ac-83b040307c1mr597475039f.8.1729867350576; Fri, 25 Oct 2024
 07:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007222916.19013-1-andre.przywara@arm.com>
In-Reply-To: <20241007222916.19013-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:42:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
Message-ID: <CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 6:30=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
> 50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
> be set, when the existing regulator value is beyond this range.
>
> This will lead to the whole regulator driver to give up and fail
> probing, which in turn will hang the system, as essential devices depend
> on the PMIC.
> In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
> and the AXP driver's attempt to correct this lead to this error:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> [    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
> [    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: -E=
INVAL
> [    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register dc=
dc5
> [    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver axp=
20x-regulator failed with error -22
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Set the limits to values that can be programmed, so any correction will
> be successful.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Maybe

Fixes: 1e1dea72651b ("ARM: dts: sun9i: cubieboard4: Add AXP809 PMIC
device node and regulators")

What do you think? I can add it when applying.

ChenYu

> ---
>  arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts b/arch=
/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> index c8ca8cb7f5c94..52ad95a2063aa 100644
> --- a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> +++ b/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> @@ -280,8 +280,8 @@ reg_dcdc4: dcdc4 {
>
>                         reg_dcdc5: dcdc5 {
>                                 regulator-always-on;
> -                               regulator-min-microvolt =3D <1425000>;
> -                               regulator-max-microvolt =3D <1575000>;
> +                               regulator-min-microvolt =3D <1450000>;
> +                               regulator-max-microvolt =3D <1550000>;
>                                 regulator-name =3D "vcc-dram";
>                         };
>
> --
> 2.46.2
>
