Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805A1B1515
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Sep 2024 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869343; cv=none; b=Bq1ciQOnDOxNv1RZbQLi4TltLvSsToNbFBc54K+xcwWvH4wwlD0OJBil6wZYBiz4ya5a3ei6WEfTBWMwFyBFSFlk2UITFsZqxxfHHQDJWzXzKIH+0p7C8IN3ix68JWtBEZpvEVd12CErJmdS3SZJ6SPMOBdWg8hiC4omeP7BNJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869343; c=relaxed/simple;
	bh=C9iWBq5U4o1SOT7F5/EySRlPQJIRG43rEx4sDBIv5EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xz7MlgsEzWQwbqSG3otyXTOtLj+QQdTqgb94dnEX0bBunssTjsBqLPYRkGu0TnQwPrgvs40N7UbmumZL61DOQqKPYe8+fgL+dGTCoL8t7c5YqNJuM5AArLJBpK2peNFueQHMKx4hfagGAx04J5LeQPwvtSGncj3MbMBQ3nxPoiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f762de00fbso11836681fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Sep 2024 01:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869336; x=1726474136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1iZIvL68Sxe3qZBnfU/kh1fDv3H2QvFOPZFkgsEqJQ=;
        b=GhPsAjzyiZ+sG/4xOXNfx0QPjfijVrmbNjzgC8foJhV72sC6X4aS6HttpdL3+BC+eR
         YKwB5FhG4j7a2H5OdkU6BaqeQPgWTGWWfWW5rWXFVtJ91nW/WHr0sFgRGO0ouWSTFblu
         2brfWl1v5k0M1RXHdITn4+sPjSURYYHADn1bc6ULlBCXfv6Smrp0FB9uqb0KxcQzZ9IF
         LdNaZjossPXsKw8wxY3fUu0zAuTzr2Befk/agIGEDNVql6Q7Ih/A5hZFkw+GOzvLoUxl
         iPvnoDHg/CRF9PNbQfy/HuNj/CBEakCS4oF0cKfVlm4i0TXx+gVkXJpRqtPkdQvFCTrh
         2aEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM8Rro06I6iljGVUoDdGspJPVT9nwfv1k9qnl1Te8pJvjbWGIoZSmkCnVUJLxzxj4j7kzdbOCOoLklaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1QvGL+nucZaRhii9cmBlaP2AQ8NqctrJSBsnp6/BMYXf2CJga
	1LwF/DNsJQJnthQiT8X8Ax4JBkv7yRpACO7sftKo5RFpn2kLJRSQgUDoiZNc
X-Google-Smtp-Source: AGHT+IHMea6KxzbLBj8OR7Zo/IVmJ34dYcy8oZdqfBKSV1y8o5kpt9sFN3pUQ9hlUTrw6lfplMesnA==
X-Received: by 2002:a05:6512:3b86:b0:52c:e012:efad with SMTP id 2adb3069b0e04-536587a350fmr7799508e87.12.1725869335525;
        Mon, 09 Sep 2024 01:08:55 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f868d42sm706903e87.13.2024.09.09.01.08.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:08:55 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso18246981fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Sep 2024 01:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtf8EQEU4sPfWWMA4oXXH3fyUZZFaVr4siPkx8XZa/FTdYX0VpnY36Iwt02iVYqMr5WeICp8541I1enA==@lists.linux.dev
X-Received: by 2002:a2e:e09:0:b0:2ef:2344:deec with SMTP id
 38308e7fff4ca-2f751f9ec91mr48068811fa.45.1725869333796; Mon, 09 Sep 2024
 01:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com> <20240908214718.36316-2-andrej.skvortzov@gmail.com>
In-Reply-To: <20240908214718.36316-2-andrej.skvortzov@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 9 Sep 2024 16:08:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
Message-ID: <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>, 
	Icenowy Zheng <icenowy@aosc.io>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 5:48=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> From: Icenowy Zheng <icenowy@aosc.io>
>
> New batches of PinePhones switched the magnetometer to AF8133J from
> LIS3MDL because lack of ST components.
>
> Both chips use the same PB1 pin, but in different modes.
> LIS3MDL uses it as an gpio input to handle interrupt.
> AF8133J uses it as an gpio output as a reset signal.
>
> It wasn't possible at runtime to enable both device tree nodes and
> detect supported sensor at probe time, because both drivers try to
> acquire the same gpio in different modes.
>
> Device tree fixup will be done in firmware without introducing new board
> revision and new dts.

FYI I've been working on an in-kernel prober [1] for such alternative
components. This does not require firmware support.

[1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org=
/

> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Link: https://patchwork.ozlabs.org/project/uboot/patch/20240211092824.395=
155-1-andrej.skvortzov@gmail.com/
>
> ---
>  .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index 6eab61a12cd8f..66fbb35a7fae9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -188,6 +188,18 @@ touchscreen@5d {
>  &i2c1 {
>         status =3D "okay";
>
> +       /* Alternative magnetometer */
> +       af8133j: magnetometer@1c {
> +               compatible =3D "voltafield,af8133j";
> +               reg =3D <0x1c>;
> +               reset-gpios =3D <&pio 1 1 GPIO_ACTIVE_LOW>;
> +               avdd-supply =3D <&reg_dldo1>;
> +               dvdd-supply =3D <&reg_dldo1>;
> +
> +               /* status will be fixed up in firmware */
> +               status =3D "disabled";
> +       };
> +
>         /* Magnetometer */
>         lis3mdl: magnetometer@1e {
>                 compatible =3D "st,lis3mdl-magn";
> --
> 2.45.2
>
