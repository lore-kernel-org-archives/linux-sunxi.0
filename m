Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CC2C89
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Oct 2021 17:48:51 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id f2so111090vsj.4
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Oct 2021 10:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=knPNhU6TGHSpaIW4FMVFzxPZT1aU7QZlnO0dpjVPljQ=;
        b=m4qFeYVA5YXl+s4S70rW2kyfBdwTGooKi5YqCUUFgP5YHlVtTlBRfF9LRxQO5Sbtp8
         Wes5biqUqFj1+6NqjZBKytQOfHx7vgIaV92tSPdJPGY4XMLHJQpldbcMpL3u/qaLbFKC
         NHb2WgPBjNpQxkjkpgiuvekAxVnFyizb8Ahua3QjiLYKr+mnQ8sbr2B4MZWBD8Z5WL68
         7NPocnB8G3Tybk3jTCDhgRzc58X3tKdXeW1N/zYa8wP1BzbDYdeMBz9aNljfuXdtKQvr
         zkDoOHIerSBrtG9R+zxsRLwf5HSbOgSzm1WvTvVciuXDmiDBa9AJa5GxYNvHeQYDFIye
         +PmQ==
X-Gm-Message-State: AOAM530Jqi7GQ7RVWNlMkJElFAaGViJ7VM0goRvJNHFIBGOevBghQbqT
	S0Vr095od2cHlX1PTFYjmyhDlKyM6u3VqQ==
X-Google-Smtp-Source: ABdhPJxamPYMbToORORa63qzmzrugZnQUNNEZcbRK/LgApP/UrNYfL4wjTlMlJBfRtbWiDV60/9K7g==
X-Received: by 2002:a67:ef44:: with SMTP id k4mr8277784vsr.36.1633456130360;
        Tue, 05 Oct 2021 10:48:50 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id s81sm4697799vks.55.2021.10.05.10.48.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 10:48:49 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id v4so57482vsg.12
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Oct 2021 10:48:49 -0700 (PDT)
X-Received: by 2002:a05:6102:448:: with SMTP id e8mr8269328vsq.49.1633456129199;
 Tue, 05 Oct 2021 10:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211001145036.18129-1-amadeus@jmu.edu.cn>
In-Reply-To: <20211001145036.18129-1-amadeus@jmu.edu.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 Oct 2021 01:48:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v64r-OvoUQOHyTbJ9e==ZFASO54MW56Lw654nhwWM-bj7A@mail.gmail.com>
Message-ID: <CAGb2v64r-OvoUQOHyTbJ9e==ZFASO54MW56Lw654nhwWM-bj7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: NanoPi R1S H5: use the correct
 compatible for the eeprom
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Oct 1, 2021 at 10:51 PM Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> The 'microchip,24c02' compatible does not match the at24 driver, so
> replace it with 'atmel,24c02'. In addition, because the mac address
> is stored on this eeprom, set it to read-only mode.
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> index 55bcdf8d1a07..4f01c17c49e0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> @@ -142,9 +142,10 @@
>         status = "okay";
>
>         eeprom@51 {
> -               compatible = "microchip,24c02";
> -               reg = <0x51>;
> +               compatible = "atmel,24c02";

You should add the atmel compatible as a fallback one, not replace the
microchip one.

Also FTR 24c02 is not the correct part number. It is 24aa025e48.


>                 pagesize = <16>;
> +               reg = <0x51>;

Please don't move the reg property. It should follow the compatible.

> +               read-only; /* This holds our MAC */

Please also add a cell representing the MAC address, and hook it up
to the GMAC. You can find an example here [1].

Regards
ChenYu

[1] https://lore.kernel.org/linux-rockchip/20210622034505.18824-1-cnsztl@gmail.com/

>         };
>  };
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
