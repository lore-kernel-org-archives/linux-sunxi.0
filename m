Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A13612D
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442426; cv=none; b=jxyictZW/OSy8Nf8u6fbvUjXnPChtXPj3X0JBdKmQe9f764bvs2BFXvqycgYETIrUL8I1L13/JbuBCcBdERw6dKVxT43uaBhEDKFv+musiglF29yJVISsBUhfUklM7Sg3PKpwMvsdAPOYhwGoJLx4VdU7Pjb83uCHO3yXb+RaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442426; c=relaxed/simple;
	bh=gcNV1hsDIUBNJNFwSLOY4Q92WfBvzTiZU4slSIPxLl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsbNpXc6z6zBg2ybtOSw4tHLvdTk3h+nFM406vqJxo7TwcLBW5jwodi94e68jCNnS9aQbQUbTuVj5EYgBJ+U3gMtSADS4x49xlfdklrnK2bRm5uMu/gOSuE+QVvWRWDKkkim3jb9plLSqfnpIHN9heZTAZVy9EweL0ht4L848uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53438aa64a4so7737364e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 02:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725442420; x=1726047220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zm4o9PdflRnUBvme5gzo/MMtfJqljQ6V9FZiYTJtlAI=;
        b=tst52EQu5eqsEYQPp6PUvhmO2rXBjpM9TWd94DFl8syoWhMcZ0/HxNWzhAJk8yJN5w
         BvWPa7SLsKyQgvXdxboC4Gooy5NsGdjnyqQwpyr+uKqMJPVXVQglBNt8zVioNsBXf7Fu
         AUlLdVl54pG6B2WaZ+ZhGgEhlAh2DS3lvKfGiibgH6GQfeeuDrS7T6gfcRXTeAO3+K8W
         5SmEaolTbroEQ5yly+ZNHEmkszA2hKVEeKYfhXtrucdkyE18rSLPYF+XTSIn3opT82eB
         YziMeNIGFMtc7wAsBbycDQRtGkAQUV0LRq1SrkSZZPjyPKWjQzpHRzq9nN+Z56cGkzw1
         N6xA==
X-Gm-Message-State: AOJu0Ywm6i38MXnYNHoasewLB/DB+MSVtWe9hc9DS/Oyb9xUAygBZRcd
	5f05Mj2YMLLtmyRDnknSV1ooPEf6lQW3Kx9ag/QTswf/C6L6Mf/cD5U2u3l7
X-Google-Smtp-Source: AGHT+IGM/q67pu9/a9X4qMfewb8ePjJgVHJYzF4Sw1S53XgRrooCS3QH4wEV9rlyrCFxX/zP/5SsVg==
X-Received: by 2002:a05:6512:6cf:b0:533:4b76:cb59 with SMTP id 2adb3069b0e04-53546b9d487mr11754568e87.57.1725442419303;
        Wed, 04 Sep 2024 02:33:39 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ad1dbsm2289748e87.71.2024.09.04.02.33.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:33:39 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so76410771fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 02:33:38 -0700 (PDT)
X-Received: by 2002:a05:651c:508:b0:2ef:24a9:a75d with SMTP id
 38308e7fff4ca-2f6103a23damr154317521fa.14.1725442417975; Wed, 04 Sep 2024
 02:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+vsu7uNL0N9XQp=gxA4wO14iVAHqo8ySFXuPPkQiTqMqVJJzA@mail.gmail.com>
In-Reply-To: <CA+vsu7uNL0N9XQp=gxA4wO14iVAHqo8ySFXuPPkQiTqMqVJJzA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 4 Sep 2024 17:33:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66pGRAt44h20fJ-UdywWo=CE7ykgcVY=E81fXjVfGEAQQ@mail.gmail.com>
Message-ID: <CAGb2v66pGRAt44h20fJ-UdywWo=CE7ykgcVY=E81fXjVfGEAQQ@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: allwinner: a10: Add DMA for emac
To: uis <uis9936@gmail.com>
Cc: linux-sunxi@lists.linux.dev, jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 5:11=E2=80=AFPM uis <uis9936@gmail.com> wrote:
>
> RX DMA should be already used by driver, TX still isn't

Commit messages for device tree changes should not reference the OS.

Just say that the hardware is DMA capable and should have DRQs added.

> Signed-off-by: uis <uis9936@gmail.com>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> index 51a6464aab9a..299e12aadf9c 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
> @@ -314,6 +314,9 @@ emac: ethernet@1c0b000 {
>   reg =3D <0x01c0b000 0x1000>;
>   interrupts =3D <55>;
>   clocks =3D <&ccu CLK_AHB_EMAC>;
> + dmas =3D <&dma SUN4I_DMA_DEDICATED 7>,
> +       <&dma SUN4I_DMA_DEDICATED 6>;
> + dma-names =3D "rx", "tx";
>   allwinner,sram =3D <&emac_sram 1>;
>   pinctrl-names =3D "default";
>   pinctrl-0 =3D <&emac_pins>;
> --
> I had to resend message as plain text

And the whitespace is broken. Please use git send-email to send patches.
