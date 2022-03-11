Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACCB33E9
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 15:42:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id w7so15693031lfd.6
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YEdqLPEI2AXx+itJdHGX41gc8vi6n5cOXM43vTubJaU=;
        b=YmtDSruBKV4oOpGvsN08lxa7fwgYlY4XC/CEpQ4NDqF1WhQKz/D7opPlzGD1d35lK0
         41DbzsjiyMUBvP3s1b/l9TedySpokIoyjMa//GicR3u/vOsLzSn1mpuzRKrNSnSzVjJP
         EdWORRwfVYD/WT1ToNr9ckPVpY0Q6HQ5FvtGYz4QWpjmTDmFn+LT39EXLmbZivSCAd/9
         gwzkM2YX5H8kax/jsADAeX8LRc9uv+p5Dq1+9EI9iJ/T1w3H8ig0X2hGbiOxC0ZKIGDl
         LOQMe6zqpHYLxO4tIEFLYMoqc/QDGOJsxbgXZY3VyVJvn4AM+KR9EUS+G51g8Chp/vbp
         gTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YEdqLPEI2AXx+itJdHGX41gc8vi6n5cOXM43vTubJaU=;
        b=fLuV0VXePP3itl2kjgnu+h73KFsvQT4EyUwBIhZa67hrpiiwax2G3eqMyEtKhTSLEv
         Tc0b86VEi1QaZz2ZaqMJybi/y5t3r9Ulc0hRT8G9vyj/uNgE0Pzfms0Q9D3Qq70jmZQr
         h2QB3SYx4lxU/JGUYDQ0FaAlas0AMb9FQYwlYWL0L/qVc/myflGo+lSwWmdx25fW+urW
         ARKMvb9dYbVKUOfpORJCvA64B04s4+MIyS8GQEFWkmlmLAV3q6Zw7XnhPkU3XynIA1P5
         uSBUoHDPz1iu61wXlVLIyvEvMk4uFJEnWi9sjVtsRJJV7EHyfG+tlKfEzf01fXwuUnLS
         Kn/A==
X-Gm-Message-State: AOAM533P7Uo2H31tUWD8O5+F//B2Lmluk8a9r3TtTzhOyF/fiaS+Jy2v
	iByoKt0FeAwNYfJZp2tgU7u7MIPo9uJxSAPFBnNk4w==
X-Google-Smtp-Source: ABdhPJxvSkQW1ExcoHOJfIPOxdpXlTzooEuOowmiFyfyqfj1CMd2uuW4o9aFa/ViLsaVrUCXzwMkyUzRlvlQ2xtX/Qs=
X-Received: by 2002:a05:6512:308e:b0:448:3826:6d68 with SMTP id
 z14-20020a056512308e00b0044838266d68mr6105279lfd.184.1647013335908; Fri, 11
 Mar 2022 07:42:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com> <20220307143421.1106209-8-andre.przywara@arm.com>
In-Reply-To: <20220307143421.1106209-8-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 11 Mar 2022 16:41:39 +0100
Message-ID: <CAPDyKFrNGMd7MRAuM+4oHB9pBjA569Hbzz0BJOxcNk_2KOYwVg@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: mmc: sunxi: add Allwinner F1c100s compatible
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Mar 2022 at 15:34, Andre Przywara <andre.przywara@arm.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> The Allwinner F1C100 series contains two MMC controller blocks. From
> comparing the data sheets, they seem to be compatible with the one used
> in the Allwinner A20: the register layout is the same, and they use the
> same separate sample and output clocks design.
> The only difference is the missing reset line in the A20 version, but
> both the binding and the Linux driver make this optional, so it's still
> a fit.
>
> Add the new SoC specific name and require it to be paired with the A20
> fallback name, as this is all the driver needs to care about.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 4f62ad6ce50c..76137132500d 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -55,6 +55,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
> +      - items:
> +          - const: allwinner,suniv-f1c100s-mmc
> +          - const: allwinner,sun7i-a20-mmc
>
>    reg:
>      maxItems: 1
> --
> 2.25.1
>
