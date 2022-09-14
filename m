Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CA3D62
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 15:33:40 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id sb3so5971540ejb.9
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=euBywoUqWY+9yPtFA/h7+K25+vefjCBo4JeDdhHgIhg=;
        b=na7tS1cWTqcfmwovO/xG7sjSvLAaRTdSCnO+6swrap87QiTLrqQKu4jppnggBiwxR0
         CX2heIiM4FhpIb/birHu1wjC6MTWWWHjIH3QY15ZFGcPx2nTOUQWwo4nPl76tJD94AAY
         zsJwmVWai2JY/gyBwxAcR7dRmRUj7vlBd5bbt7dug8Bt2ckZDoGakuqqKPVzsgWuEthk
         9pxgkGEFzkr0BnV3R9ohnK2lLB64JJ+0YXI6TKhJIZwzoRrzAF52erwFi/u+a/KnpAS6
         y/o7yHTZBawGCDWaol6hc3jMrZlk2TfwPKLbxMpVNmNsBudZmGgJPs+cN/A8drMjf35l
         VNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=euBywoUqWY+9yPtFA/h7+K25+vefjCBo4JeDdhHgIhg=;
        b=FkV1wMbl9qXlM7Giq0OOfzkY7JY/PWpgUbTZY9wH2P6DC8FD5fkqNx/1/yGtqk8BYy
         TjFRNiz9G4mevUGpKQej5tybB+BNV5H6M68CSgFS4pEb5hp0SpJqPNbVTyboxjsSnYNK
         kh4Wy7Zmxk3MLZ9lkVd01bUoCVeSQ5K9nJNvp3aDG8xdFzxju3mCgSegqaMNU1GUHGrY
         1JssJtSvQvl4mtI3sBF6PO9EyU/pz3d/sqmt+M5E8x1Sd83HOH0OKmbLGb6D7b1KKX+b
         eRrFW/KuCGlqeVaAEvWgRtTFKIfbEXVGBCUmARei/V1HpSwL0fYAj/F9PzSopJp17KCu
         ulUQ==
X-Gm-Message-State: ACgBeo0GN3NCU5eFpMOiaOf1RZEKaKirR8f90AuEVV5gPYivEfmoXOL/
	Nb7IUeelc4qtj2wDDivqYqngraEYD32TNoPIVZw=
X-Google-Smtp-Source: AA6agR6FfLnXUSOTPacpx7RREDFu38n5a5EdGdNa5zwcSzUCfG/WghGZdEtUSgmo4eg0hC4iuJsVeuEL0FdtOUeP6Kg=
X-Received: by 2002:a17:907:80d:b0:73d:a576:dfbd with SMTP id
 wv13-20020a170907080d00b0073da576dfbdmr26468956ejb.402.1663169618930; Wed, 14
 Sep 2022 08:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220914151125.212876-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220914151125.212876-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 14 Sep 2022 17:33:27 +0200
Message-ID: <CAJiuCcefkre611=1UXEkwScN+bYSBhE_ivGzTK7ZMvp-j4MbRQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: sun8i: h3: orangepi-pc: Add CMA reserved
 memory node
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Wed, 14 Sept 2022 at 17:12, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add 256MB CMA node to the Orange Pi PC board. This fixes memory allocation
> failures for Cedrus video decoder on trying to play a 1080p video with
> gstreamer.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> index b96e015f54ee..e655346a9fb4 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> @@ -60,6 +60,20 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               linux,cma@40000000 {
> +                       compatible = "shared-dma-pool";
> +                       alloc-ranges = <0x40000000 0x40000000>;
> +                       size = <0x10000000>; /* 256MiB */
> +                       linux,cma-default;
> +                       reusable;
> +               };
> +       };
> +

This change seems legit for all H3 boards and could be moved to the H3 dtsi, no?

Regards,
Clement

>         connector {
>                 compatible = "hdmi-connector";
>                 type = "a";
> --
> 2.37.3
>
>
