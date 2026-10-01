Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CA39FCDC
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871090; cv=none; b=dkdjJlsu8a+u+aF0XLqLJVuMEsVAVOvP1rbdN676JZIZFOfeft86pKs5hUSI34yG6U++3tn+pd4Jaq3VeF1W6C1cHGEiEKzuxu3TeqkZbtg3Au/3hufz45Ku+2lF9pSqALeTdPzttuJ6ghseOaM0+/qT/B/6FBdA54X88mv3UZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871090; c=relaxed/simple;
	bh=XStV42dN90oncuZkgZa2fQZPOmDsXrGunS+USmh79ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKAOSit7BG+SJqLhea8JM1gky6TtrdmPgCkPfVJypMdXjJq40eN8P2cIaueNPaqeyeycOrWhC7ii3YHFcESF+F4X/w5y4RMKPDHkI67nVbPxauuP06W15VpjvjUYVXuwLrP2yA+wqd4fzGXKTFxgXIVkbkR+jmyWbU5CyxyAPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EofinJNc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EofinJNc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so13330635e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 01 Oct 2026 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871087; x=1791475887; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=EofinJNcUMy6nlAfqub7bpsqOTwV6q8qUb7wMlKd2WviQ8X+g5UqG41S9iTZHkyGJT
         FhrpSCVo18Pmu/JT50JGjqVbkRARJF/YDsMIA0eSkvVczv6jNiper4j82CYHA07QmLEm
         drN6KLMAloRm0kqdSI6pbnycs1nZY/G4cF80+1DKW1FZml5EZGFp+qrNRZHMslbrMCqR
         jh19lVt6YWVCQhuaCOw7TCoLE4H6hDmcNmgnu8dHkpYuxh6KJgTjr75k68oDwA27Lc3V
         wvcIoaoqcGFWEyMJGo/HcSy0wSRlzWvzgWUFv/OyyJYUEvzR3YGddPrPW+Mu8UPV7o3h
         RJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871087; x=1791475887;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=hZeq/gJYSrWBihjxuYQ5Y59Wa/wS0U7b5JzdBZcg0Dg8cUCYJMMLgfR+fiQbcdZ6eO
         6U3QQPt5qNjFWZkWpyyGl8ulW6VCrdAk4QEzk4jTSbGEp3uU0p5WRVWoTasPa3x3x28X
         SoaMvt89iDaZw+4yEFZ0ACMqrwzeDeXxOvkpwFfUV3f74usu+EM/DSyxiwHrfa4cAIA4
         3boINYLJQ0pO+jQgnDFWDnaXPnWSBtDfpPApRfGqC3CL/eyMXSCSavhvLDT+blK+XAjn
         AVDFHLVtMmrp633ocBgLCKAJ8BD2i1PVnXx7GDAkp1+BhzoNqDcBpTg+k5WjhpWtkQ8j
         gkrA==
X-Forwarded-Encrypted: i=1; AKwUvBwVa2s9LyxFP3TQVeTIXo2Phg6DA7eHJiCKrYUrDhFbEla89FbDSmi58YDRlNm026k/dA+4OEfq0iKLIA==@lists.linux.dev
X-Gm-Message-State: AFuF++mh4qb4lszBbOLVx4Pf2smT9BAtJonEQ2zllUILv+tK+8lrx57g
	AZ3vfSeEaRrgWpXHTt84DSu8Q3/PpVCZsf50ylqnyxHzKjjS4T2NcP78yEWRAQ==
X-Gm-Gg: AYBFou1Cw+PglkFV11t7pptdbh0R5R/TGl32CWs+J5F931s0cmfii8lFyZnkR2O26Jn
	QaapyDnp2CFnRupJBvH6jmld+DuApfGDjr2ejfIykGXEWInRoeMKx/PHYkiqaeMbiueWob1jQ19
	BqpboF0lOYw9ldlGpH5AYk5Dxh9ZloFtdEOaYUe4NxOxd33P8tQYANCvf9jNA1Q77AuRBK2HW6j
	doi4UaBFeyE73KuE7+4A4UfbAuZXGxZe4c6RJyn6b/wIiuQmaqmh+FfNKu04C09oTYn2NK8z1Lj
	BhZZjZvqfIJbsxFrTJvX9N9urGx9sU1mTindIT2z1nrVZ6jH3CCykPBVkORpR7IBDAc6nPsG5K2
	2D0/HECs/RdIgiMKgs908TZJXW1jEUtO42yBh5OjK2k1TchJiTgxSTPQoZpBKYeD/OnwyQVusdn
	XBtyFG11G1JB2pvc5nZUEQOXea6lXynPXtl+iwLFo0RNI4GhWmR43jnBMgd9plx+hS1BsCRJqRv
	dCaX4dTAuUdovWU+0+iGxFN7AKRFce1QcbEc1gxaMkrK6wqn64gHEEEroxAKy0/FnNQqZwhFLOs
	qQqQIPVJCqOcIBfoBl0nmvgLYMvMZXwF1mg0J2/6lRx+ZL4L6ZYy5RuCG0TL4NmUcVixSWYX4pB
	8HbWPcELZQJGko0sXgCDNAfT5NxytMY2Z+ACx/j3ZooljKZMvfzNmJwTFsYtGwKTawbHs0boyzG
	ESH1KJGRy2Dhj8gJQP2u2ejScu
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr3271805e9.0.1790871087229;
        Thu, 01 Oct 2026 09:11:27 -0700 (PDT)
Received: from jernej-laptop.localnet (95-143-149-57.dynamic.telemach.net. [95.143.149.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de18sm3629464f8f.44.2026.10.01.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:11:26 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject:
 Re: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Thu, 01 Oct 2026 18:11:25 +0200
Message-ID: <mSzGX1AcQ6yrkdDVueDg2Q@gmail.com>
In-Reply-To: <20260927200820.795348-1-olek2@wp.pl>
References: <20260927200820.795348-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

you mispelled "allwinner:" in subject.

Dne nedelja, 27. september 2026 ob 21:38:18 Srednjeevropski poletni =C4=8Da=
s je Aleksander Jan Bajkowski napisal(a):
> This patch adds support for Ethernet LEDs. Keep the default LED settings.

Reword message. "This patch" should be removed. Check other commits for exa=
mples.

Other than that, it looks ok.

Best regards,
Jernej

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> Changes iv v2:
> - add defaullt-state property. Previously, the LEDs were dark by default.
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> index 6e57ee19e799..c23315994799 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
> @@ -132,6 +133,27 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +		};
>  	};
>  };
> =20
>=20




