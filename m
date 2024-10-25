Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567A212166
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862435; cv=none; b=WMyyFYvoqYFBRvG5m5aBkyyjz7UNaGabyC47GGqf+NA1yjBaPlM9QZtVSPZqgmf9HECVPSjGWs+T1II9Ym51TkoTq9OLnWmQ9wzi3ewbrTsj40aj2hPQ3P8VW5TwmLuBkEehfdXncUSfzBcc/gRfow3RC1hilwETYmC57ANZ2r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862435; c=relaxed/simple;
	bh=Iv+dDQawJeTjfcaOHDOnBzb79d7/eAt8zBP/Pf9XIPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSd6JF4swwOS19ejtN72huVCQNAoGtvNxpDkA//0Kwuvk8k36FX908yay6wihi9mt51XPdtMPIG2zIPeQDQwBE7vhO7GqFVhpF0mWgiUvoq14Qq1Qv0+B4+ImlPyVL9B787dLjCLv4i4e+VqRA6VPvbpx44BOrKprM9lrTHLm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jynhgEIk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jynhgEIk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso291941866b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 06:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729862431; x=1730467231; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uulKs7R9OvjriBWT/CC8Pnu+w5NlV4zIkkgOTtPu4c0=;
        b=jynhgEIkNKZY2tkDUTuPzpcwWEHaoMHz6BsU0RV60ex21Vi/cS75Y/tP1gPq+q5QPE
         W+e2yM5dOfseAW8gM9beATfU3N4JhniaN1kraWBR+pNhipHm+kgLMtjIMBS8bTbajKu+
         xczfM3swSMY9g+xLXYiUEiPCqRKdZyGejSWLm8F0akCJ5aFJp112BV2pip+Da8axC9Am
         E8MEDOeCEDSar9k5u1B4lnfkWKpqNVXSITpobXbT9nRIxGNdpfuESZeKSyHVGlziRsey
         tkV9mqNKBJPbL8pDmBVW6GiU1RwECTYNJEFX3kJdKWyQhDsiRduBgjgVIaLiaJnazVOY
         KvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862431; x=1730467231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uulKs7R9OvjriBWT/CC8Pnu+w5NlV4zIkkgOTtPu4c0=;
        b=R63C8Cdyr3KDKzZzjL6LJbjrgkFhDh9X82lqtsDVdJwRlW/E29ioFzQ4yBYBWeun96
         v6bc4aE6oG1usjtT9Y4jIheKB49Le33bcDiYP68PmIL3lJM187H/ZkAFpvJ5/iQX1rHq
         xAKkSsjbXTgH1pL8iUitBY0qKSxAs3wPHD2KH/zcI+fH3TizteC8vpE18BW/HdpKP8LW
         mZtz35KyGC/wh9lqInZaX3sKmWAMFk6oVzYc2p8iNAIIh5HYX9vOnQBZYVZUDg1uHa5J
         IWNOYZXp3FcbeWtmJa1KRYfbmUzSKiNFNThHSyJwoUOkNv0nkErAIk3Eb4ce05U69Js9
         ffxg==
X-Forwarded-Encrypted: i=1; AJvYcCXDC393nT9tI3FGLzIq5DbNmLWHFzuLtQyRsEx34gMEydTfBvjuEU4G4UKZor+WZrbDj/pzW4axaeNluA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFiu9G0wzuQhYUEK76osi7Mstj8lypICMx2QKkZbma7k7pZS1C
	Prx1vpP3tsdGOHs7lpjy8XRpbKaPLytnJFYBQ8HWSQfc8DjgGYDyq8g5Uxj6pKYzcHZDgvqout/
	Pm1D1lzzwPwOoDgF9zHYrn0uhkF8=
X-Google-Smtp-Source: AGHT+IEb35gUbGtP4InZ6WMm5/IyT/Soo1Ihl70JzBa200ZUM9m1Q+qFTBBqDBODI/YSTqvPEhe969TFOoc5ILzCzQI=
X-Received: by 2002:a17:907:980c:b0:a99:a9b6:2eb6 with SMTP id
 a640c23a62f3a-a9abf53587cmr924971066b.0.1729862430611; Fri, 25 Oct 2024
 06:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023075917.186835-1-ryan@testtoast.com> <20241023075917.186835-2-ryan@testtoast.com>
In-Reply-To: <20241023075917.186835-2-ryan@testtoast.com>
From: Code Kipper <codekipper@gmail.com>
Date: Fri, 25 Oct 2024 15:20:18 +0200
Message-ID: <CAEKpxB=BQ1GvzdVCYKyr_Q1eCfcYYEz1L_RqzEVBBgNu8jDfwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation
 settings for audio PLL
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chris Morgan <macroalpha82@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 09:59, Ryan Walklin <ryan@testtoast.com> wrote:
>
> Allwinner has previously released a H616 audio driver which also
> provides sigma-delta modulation for the audio PLL clocks. This approach
> is used in other Allwinner SoCs, including the H3 and A64.
>
> The manual-provided clock values are:
> PLL_AUDIO(hs) = 24 MHz*N/M1
> PLL_AUDIO(4X) = 24 MHz*N/M0/M1/P
> PLL_AUDIO(2X) = 24 MHz*N/M0/M1/P/2
> PLL_AUDIO(1X) = 24 MHz*N/M0/M1/P/4
>
> A fixed post-divider of 2 is used to account for a M0 divider of
> 2, which cannot be modelled by the existing macros and ccu_nm struct.
>
> Add SDM to the H616 clock control unit driver.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>
> ---
> Changelog v1..v2:
> - Add fixed_post_div to high-speed audio clock to correct M0 value to 1 (ie divide by 2) based on manual
> - Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
> - Add/correct inline comments for the above.
> - add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features
>
> Changelog v2..v3:
> - Update comments and commit message to more accurately reflect SDM changes and rationale
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 46 +++++++++++++++++---------
>  1 file changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 6c7623d4c59ea..05727fa1ee46e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -215,20 +215,30 @@ static struct ccu_nkmp pll_de_clk = {
>         },
>  };
>
> -/*
> - * TODO: Determine SDM settings for the audio PLL. The manual suggests
> - * PLL_FACTOR_N=16, PLL_POST_DIV_P=2, OUTPUT_DIV=2, pattern=0xe000c49b
> - * for 24.576 MHz, and PLL_FACTOR_N=22, PLL_POST_DIV_P=3, OUTPUT_DIV=2,
> - * pattern=0xe001288c for 22.5792 MHz.
> - * This clashes with our fixed PLL_POST_DIV_P.
> +/*
> + * Sigma-delta modulation settings table obtained from the vendor SDK driver.
> + * There are additional M0 and M1 divider bits not modelled here, so forced to
> + * fixed values in the probe routine. Sigma-delta modulation allows providing a
> + * fractional-N divider in the PLL, to help reaching those specific
> + * frequencies with less error.
>   */
> +static struct ccu_sdm_setting pll_audio_sdm_table[] = {
> +       { .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
> +       { .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
> +};
> +
>  #define SUN50I_H616_PLL_AUDIO_REG      0x078
>  static struct ccu_nm pll_audio_hs_clk = {
>         .enable         = BIT(31),
>         .lock           = BIT(28),
>         .n              = _SUNXI_CCU_MULT_MIN(8, 8, 12),
> -       .m              = _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .m              = _SUNXI_CCU_DIV(16, 6),
> +       .sdm            = _SUNXI_CCU_SDM(pll_audio_sdm_table,
> +                                        BIT(24), 0x178, BIT(31)),
> +       .fixed_post_div = 2,
>         .common         = {
> +               .features       = CCU_FEATURE_FIXED_POSTDIV |
> +                                 CCU_FEATURE_SIGMA_DELTA_MOD,
>                 .reg            = 0x078,
>                 .hw.init        = CLK_HW_INIT("pll-audio-hs", "osc24M",
>                                               &ccu_nm_ops,
> @@ -701,18 +711,20 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
>  };
>
>  /*
> - * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22579200
> - * rates can be set exactly in conjunction with sigma-delta modulation.
> + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the manual, with
> + * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively. The 1x
> + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (and
> + * multiples).
>   */
>  static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
>                             clk_parent_pll_audio,
> -                           96, 1, CLK_SET_RATE_PARENT);
> +                           4, 1, CLK_SET_RATE_PARENT);
>  static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
>                             clk_parent_pll_audio,
> -                           48, 1, CLK_SET_RATE_PARENT);
> +                           2, 1, CLK_SET_RATE_PARENT);
>  static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
>                             clk_parent_pll_audio,
> -                           24, 1, CLK_SET_RATE_PARENT);
> +                           1, 1, CLK_SET_RATE_PARENT);
>
>  static const struct clk_hw *pll_periph0_parents[] = {
>         &pll_periph0_clk.common.hw
> @@ -1162,12 +1174,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>         }
>
>         /*
> -        * Force the post-divider of pll-audio to 12 and the output divider
> -        * of it to 2, so 24576000 and 22579200 rates can be set exactly.
> +        * Set the output-divider for the pll-audio clocks (M0) to 2 and the
> +        * input divider (M1) to 1 as recommended by the manual when using
> +        * SDM.
>          */
>         val = readl(reg + SUN50I_H616_PLL_AUDIO_REG);
> -       val &= ~(GENMASK(21, 16) | BIT(0));
> -       writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_REG);
> +       val &= ~BIT(1);
> +       val |= BIT(0);
> +       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
>
>         /*
>          * First clock parent (osc32K) is unusable for CEC. But since there
Hi Ryan,
I noticed some white-space issues when cherry-picking this change from
your repo.
scripts/checkpatch.pl
0001-clk-sunxi-ng-h616-Add-sigma-delta-modulation-setting.patch
ERROR: trailing whitespace
#51: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:218:
+/* $

ERROR: trailing whitespace
#74: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:240:
+^I^I.features^I= CCU_FEATURE_FIXED_POSTDIV | $

ERROR: trailing whitespace
#85: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:698:
+ * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the
manual, with $

ERROR: trailing whitespace
#86: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:699:
+ * a final divider of 1. The 2X and 1X clocks use 2 and 4
respectively. The 1x $

ERROR: trailing whitespace
#87: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:700:
+ * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (and $

ERROR: trailing whitespace
#112: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:1152:
+^I * input divider (M1) to 1 as recommended by the manual when using $

ERROR: trailing whitespace
#113: FILE: drivers/clk/sunxi-ng/ccu-sun50i-h616.c:1153:
+^I * SDM. $

total: 7 errors, 0 warnings, 80 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

NOTE: Whitespace errors detected.
      You may wish to use scripts/cleanpatch or scripts/cleanfile

but that didn't stop it from singing beautifully!,

Tested-by: Marcus Cooper <codekipper@gmail.com>
BR,
CK
> --
> 2.47.0
>
>
