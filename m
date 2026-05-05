Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79A9480333
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991126; cv=none; b=VnVj6sX/v+nwKiu0RkeVvMZ+/w/jYo7XpKWp8bx+q+R5bV1WzeF0WVYB5BvTrDxFQSbvmZIlnXz3FvIZNCytpzjfz9LhCm4Xlw8YCdpojfHE+OhL0c59TMAMSuIM5fDQM9I3wgmlQjPf67g621pCjunE0WNTJugE+CQuM9ahh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991126; c=relaxed/simple;
	bh=FORlK+sjCZq+WnkrbZRE87a/mr+mp/lLtTIwtThOmz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukkd5fgTF8QoBkT1mCX36ZaVNZdXjefYluYfmQ31WkKtQhcwOIUUMpY1Qfkj0lS0oZxWUujT62EHkHZ2BhSmLxQOCr/nBTEmhEpLIHwnPGqjaCHfLFTilHdIRonC8Mk7jWzMg+ldHXZyXkzYOpWaGBjn8paZo2hE4qALegCa7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso25268911fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991122; x=1778595922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJB83vl3T9PGErvvTDc5wH9JWe4E3bqf8aMmSgeiFKo=;
        b=PaZQpaMTgU+K0iz2OfA+lmTDJJ27hLiD8u/RjliqNQRpnR38xcW+HR+fDwkT+CzZAq
         XOMLRAYguPyzdAUVhmr9klTFxXqx8iY3JE1xz/gDNxrOC9Tvc4q6088N0UKNQOMW4I0I
         xZs5efpv9VoHO6pmHEphPjd1wJJoJox0oMt1VsAXf8b45p2gXqAYzJrE42i/WGQMV1Ol
         C6bdAItHrfQyNZZMl+QSamF2JlGsDn1IRyxlOFacwN+vrhZmGvnI9tVtHJde4TMW9Ddr
         d7F6zw4UOTth0qROVqVkos1f2U8BO30dDUXqKPHDaeFGrC61YfPEnXXDcT3TTbPR6e8U
         jTgg==
X-Forwarded-Encrypted: i=1; AFNElJ/hJTQfIGxZPT4v2m0N6NdyKpz0mDRD1/Z3kweEZtGjy8TITOCnuspMgP38BfcVjnxpZvN2NSzjAKOnGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPF4oEV7OUjA/Q7Zd/aAoITx/mmXkU3vFyOOuFefpGoidB7M6H
	XNUA0nmKlnADa+UkQ2EX0Q2kxus8iGZbrxbjCHSW5PM0TyMFXcjYr+o7go20d/xA
X-Gm-Gg: AeBDietSN5gMY5jTXZjeyy95ZlaF8wPwyzWl4P7ViHPC0YOMoqpeYdsv+ZRBuHWxkOe
	wsIAg+nb+7EKgYJkTEADq+C8dskZ00DNG05mfPjaZHzJ29T7oaHdXYevka8WW1e66GkgsHl/F5J
	1cSmobVS9Cxq6Nqdry3lQi6+zkJtLw3tGk1nx3CoJoUNMX3Be4a8gCgWiGCqovuI3/FTOtHSHhI
	u2phgXd1BTwrtboaHukTB4p9ejq+HPx8I/ND1B+58HYd2+Xtkizh8TRZMBQwdfT6QTaLWwZV7Zy
	oKHXBf/FqaggVUOwE28TZMy6kuh5OFi175/XCT5jAZfykp2xcJ88zCT/tianv2k6saINZP8eeoW
	k+pEiqTT7QZaKFzaVo0czjZnFK3ThNr99HWZMq/GJher9/z9vfPI0lcUAlFf1Qe/l257EPhpfre
	JQGoxjapNEraweaPTGka4d7K+zdqcEPuzbICly1wTSz7ihMM2yakvnmAbvkoeOmqhPfQ==
X-Received: by 2002:a05:651c:12c3:b0:38e:9eb1:693b with SMTP id 38308e7fff4ca-3937838a8c4mr61438881fa.3.1777991121829;
        Tue, 05 May 2026 07:25:21 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361356c5csm41356641fa.36.2026.05.05.07.25.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:25:21 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39397d63804so25260311fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 07:25:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Vd/ZVDEXBy9HnJAQei/RgtvR61gCQsBT1ogENfOvEkOW4lFY6GawM2IklHMW63cxENDFjIftSFoipzA==@lists.linux.dev
X-Received: by 2002:a05:651c:3259:b0:38e:1ebe:960c with SMTP id
 38308e7fff4ca-39378522d66mr50880261fa.26.1777991121043; Tue, 05 May 2026
 07:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 5 May 2026 22:25:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64g_NKa94XX6Yw0a0L2_KozPOztWKVGTTaJa0TNOhfpnw@mail.gmail.com>
X-Gm-Features: AVHnY4KoLg5lkX21q-Zxo6-eS2QT5rZsBxGQaAbQih-ztZveGoNZSFlXSF4D-kI
Message-ID: <CAGb2v64g_NKa94XX6Yw0a0L2_KozPOztWKVGTTaJa0TNOhfpnw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
To: Nisarg Rajput <rajputnisarg17@outlook.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 11:58=E2=80=AFPM Nisarg Rajput
<rajputnisarg17@outlook.com> wrote:
>
> From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001
> From: ixnisarg <rajputnisarg17@outlook.com>
> Date: Sun, 3 May 2026 15:42:38 +0000
> Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2=
-plus
>  pi boards
>
> Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree
> overlay support. This follows the same approach used for H3 pi boards
> in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable
> device-tree overlay support for sun8i-h3 pi devices").
>
> The -@ flag populates the __symbols__ node in the DTB which is required
> for applying device-tree overlays from the bootloader or firmware.
>
> Boards affected:
> - sun8i-h2-plus-bananapi-m2-zero
> - sun8i-h2-plus-libretech-all-h3-cc
> - sun8i-h2-plus-orangepi-r1
> - sun8i-h2-plus-orangepi-zero
>
> Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>

Please use a proper name for the author and Signed-off-by.

> ---
>  arch/arm/boot/dts/allwinner/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 296be33ec934..2e0cc454df74 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -198,6 +198,12 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> +
> +# Enables support for device-tree overlays for H2+ pi boards
> +DTC_FLAGS_sun8i-h2-plus-bananapi-m2-zero :=3D -@
> +DTC_FLAGS_sun8i-h2-plus-libretech-all-h3-cc :=3D -@
> +DTC_FLAGS_sun8i-h2-plus-orangepi-r1 :=3D -@
> +DTC_FLAGS_sun8i-h2-plus-orangepi-zero :=3D -@
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a23-evb.dtb \
>         sun8i-a23-gt90h-v4.dtb \
> --
> 2.43.0
>
>
>
> Thanks,
> Nisarg...
