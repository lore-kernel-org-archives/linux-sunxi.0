Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9725619
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 20:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713385663; cv=none; b=uzEMiW52bMmWgJTrDJ+IWpmr9yhnz6yS2nRO8TiRQ/d7AQ5YQGdzenrhrF1Iy6xYRYjR/yh3Al2oKbHdAln+B1bReUOKO1Cj21EW9H02aq/wq0r4dK4oOEH6XLHOBanJI2WnXuv9LCOm6qxGxiF0/SfFjT6X4dG6mIYlDgPw+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713385663; c=relaxed/simple;
	bh=Z9pNx1Mt7ZGOKQJxFKT2T5nxfBwahM5BD/lPw2d3TJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6/QDmDpS8Bz+bB9c1pLIps1+FDVfoP/ot5/6C3NFwZVGNpmG0ZuUd2cMXnHZv94/9FPJEbGBKWj6lyZchOszQx0pn/pmFOCf8RLb9nYbp/gk7TUVWZLHqXqUz7mAin7+sB1TV42aEoPlv7PsUszSuplwzhPoD4OvvqDNx/yhQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPUj5cQe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPUj5cQe"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-518f8a69f82so89834e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713385658; x=1713990458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wogXkpt1TDERRUg+fbxNgUqpjHmEeqKge3cy0SLNVDM=;
        b=RPUj5cQeLS4KI+BOlE87xsaehqTr5IKkQCBjRd7qfk1pSm5kj7tBUdD88nFcWxHxF9
         eI6SWZ+Vnrp+PtKPp3gn/22l7aO4jOkifstoE2377mYX7gx1e+Ds3ODWrP+p2o71T81R
         rqZu9W5ZqwkcJlSYxd5oVh937hYaqeFI7/aUtwtPRG1S9kRS2AJpHv1J1uPyfwFsio6r
         P+K+Jxx4w7bdCEmbmi2vOrbIufFn8/cyP1MOEqfMZv0zWtN5Y89joAwdT0CyuWFHhCu3
         2Y0xCqVFHqFuPLwvtJ9oLTUz8WIs63adAXG63pAgIwbVdHG8DmSCqWWbzk5bLXIMhfBF
         XlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713385658; x=1713990458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wogXkpt1TDERRUg+fbxNgUqpjHmEeqKge3cy0SLNVDM=;
        b=Q2fFmbd213TxAqTCrHEaEZ4GlV8T1exc+cPJ5fdJ79h5jQT8P2+VwkoF229lXOa99L
         MYaEB9IMnrPtVoSiCW1uHN5mZMNu/3fwJj6jffe2ycc7n8XxRDSWYAdShUpPodH1lAoM
         rq4R8uULhViJlxowkZElSBaAx2fj0qwgn1qdzY5pEGw0iJiWU2SvIMtf2KZy2wQOJcJ/
         9hPadZJpr3ZRLq2+tAuRvOOxCWaS1woh8KgDB92siZ1pmSVM5SgrFvVZH6vI7KnxzEGj
         CkNMPM0OqloOjxguu8OTyMVMfoh4M5i3UbgHorRSd/qNpeD6gdvnrO+8RUj9hFvCkjA1
         FBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSL/imxoFJ3DIB29LtP730sKYbcbByhOtnnsL3jBQjFSHRpyGv/ZRfQ/16yX/gjaGRNO9XAmECnNox1mBh47URnKhDejWBDxMr4Jk=
X-Gm-Message-State: AOJu0Yzg8cA3MEOOGmSXaGtD72jZvoro0DgdZAzv+aIeDNmRSNxF8pZp
	tz7qQu+A4fUhQG86yhNTyBxwt+3Jet8eOQaAYnc+PHwJWqhuj9e1H/Uz8Q==
X-Google-Smtp-Source: AGHT+IG/8iinXPJHUp/FHMLm9h7bKgFee2CBaZRIwsGGMcMcE1cL9w9/psU5OtGrj9VtdAuVdUaNlg==
X-Received: by 2002:a05:6512:158d:b0:519:591b:6d7a with SMTP id bp13-20020a056512158d00b00519591b6d7amr311208lfb.7.1713385658245;
        Wed, 17 Apr 2024 13:27:38 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402164300b00562d908daf4sm1565edx.84.2024.04.17.13.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:27:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 John Watts <contact@jookia.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, John Watts <contact@jookia.org>
Subject:
 Re: [PATCH] ASoC: sunxi: sun4i-i2s: Fix pcm_formats type specification
Date: Wed, 17 Apr 2024 22:27:36 +0200
Message-ID: <1928580.taCxCBeP46@jernej-laptop>
In-Reply-To: <20240417-sunxi_s32_fix-v1-1-d82e451565c0@jookia.org>
References: <20240417-sunxi_s32_fix-v1-1-d82e451565c0@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 17. april 2024 ob 07:14:43 GMT +2 je John Watts napisal(a):
> pcm_formats should be a u64 as it is a SNDRV_PCM_FMTBIT_* not a
> SNDRV_PCM_FORMAT_*.
> 
> Also fix a small grammar error while we're here.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404170103.ySYwieqi-lkp@intel.com/
> Signed-off-by: John Watts <contact@jookia.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> This is a quick fix for a type error found by the kernel test robot.
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 59830f2a0d30..5f8d979585b6 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -156,7 +156,7 @@ struct sun4i_i2s;
>  /**
>   * struct sun4i_i2s_quirks - Differences between SoC variants.
>   * @has_reset: SoC needs reset deasserted.
> - * @pcm_formats: available PCM formats
> + * @pcm_formats: available PCM formats.
>   * @reg_offset_txdata: offset of the tx fifo.
>   * @sun4i_i2s_regmap: regmap config to use.
>   * @field_clkdiv_mclk_en: regmap field to enable mclk output.
> @@ -176,7 +176,7 @@ struct sun4i_i2s;
>   */
>  struct sun4i_i2s_quirks {
>  	bool				has_reset;
> -	snd_pcm_format_t		pcm_formats;
> +	u64				pcm_formats;
>  	unsigned int			reg_offset_txdata;	/* TX FIFO */
>  	const struct regmap_config	*sun4i_i2s_regmap;
>  
> 
> ---
> base-commit: 66e4190e92ce0e4a50b2f6be0e5f5b2e47e072f4
> change-id: 20240417-sunxi_s32_fix-ef5354b40fb4
> 
> Best regards,
> 




