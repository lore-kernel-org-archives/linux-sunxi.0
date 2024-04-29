Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F581723
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403975; cv=none; b=Zko0w0C1BE0H0mYHs6YDsnX3b4+yuNiIrE75HFB2yI0p5u63aVguuQSzpc5UGc/Zmfs3b0dRRwlIIzHiJUDNQXdAKbRX1KlRFnaU1V4THMmk/jZqRj39miiOqHO1sQ+RFgaAty7OGZUdsDtdOzpCVegaUx4UiRyjLFRfCBErlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403975; c=relaxed/simple;
	bh=Lq3bIjU4eSarBTAXtS8WyC+NFdUGRQk6vzmvx4W4Ff4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rPl4zMww9vfUgjLxt5yU+YdhQrLjGUy7ElmGdmA2j3T3IsLzYdH1yT5a34A+REcRvMUr0u8DP9UGzG+rQwHxNP2tPx7vuMMTJr0+LpnYOJdrz7dac7ZVktVYbJMweAdiY1/pbyNPdYJEGcR18CYRyGpektz1e7B1KOXaLKmJAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRi2F9fi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRi2F9fi"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so5737274a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714403972; x=1715008772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9C3JVcEDpwsOADlHUtbqCqSAuCy7fwWOq+zvdoWz3k=;
        b=BRi2F9fip1iHsWJ+N9eifAa7+bUjBjwe4Eg7KdUq5rB6G94PTdYXGVgBc7KKUJd2xE
         f3DkXhTHWuwZ5Jq8uBKV/Xg4ND3Rv3vWICAKkfYwMy5nnExnnMCv6nXxbYnzUWp43iY9
         Ym2sp/CRxhHpraAjv0tzNjMmFNz97u43sKnMRS/SnHDejdbHY70Svu88Jmi8wfVtN0T2
         K4QA2csStK+iqptLNxWix2W/xAsX5gDCiAWpzhfxrJEpLUmoaAIw/ebWy7O5kSMbdoW4
         2OuVj83jKRUAsV0qXSRfilUttEWBq09Pck3lAGXxFp8Vju/v33W0brmPSB3uQwrS1GOb
         LhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403972; x=1715008772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9C3JVcEDpwsOADlHUtbqCqSAuCy7fwWOq+zvdoWz3k=;
        b=RdkKYDvZhk9KdinuOtV8zbwd5YvjLWFW3zdAaq/gg0ILsj3isG4k3BF8p3bLhfH3DF
         OKwRD9xrShmPICmM0qDZjCo1nNL3ckJXb+h5uP/bOPuKID5tDsb3QEcYqooQ7SKWU25k
         9P9Kiv57NDpyqeiLV98YLDYjR3z04GxobQOtQY1FlfX68CFDGHUwEsLrjljDhj2qZ6QH
         Ff8PQlYN57vd1LEmwUIyCsFVNNAu+aGtXMbu5kYBJKgDZZhSOwlROIJ9eZnfqrsSkXjg
         MDEjUQt/g8SuqKlXtFk6/ADtcShAmQh+p4n2eVQZotwz2gfHojDLuCTEwloKDjYrpozH
         v5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcKgNCbRMr5WJGbGOCI41Mkl1ZTTyo7T2KvT+YqPc2b0V8/iqGXw/vXVj56xwhx5+PoaIzMX7XYyN/nmep/p+A/iHeLb255/d3UHY=
X-Gm-Message-State: AOJu0YzYh9XgeQ4y4Ib1bIyemlvwTma3lvERmZIPftpGAuCnU94dOVw+
	oND9n+rQu4K6TR1vqwdinyPHhcDPPdL6x/lSsg54ps9SiKqqTQmL
X-Google-Smtp-Source: AGHT+IG9T5aL2XPvLCDwTfqYe8F/ZRUPCN2K8XAmythmr2DqFYhUB73oLbiJ/x39cBvXRLd32dGw9g==
X-Received: by 2002:a05:6402:1d9b:b0:572:664c:83f2 with SMTP id dk27-20020a0564021d9b00b00572664c83f2mr5493405edb.27.1714403972190;
        Mon, 29 Apr 2024 08:19:32 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id es21-20020a056402381500b005725c56b35bsm3568025edb.71.2024.04.29.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:19:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-spi@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 6/8] spi: sun4i: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Mon, 29 Apr 2024 17:19:30 +0200
Message-ID: <4560843.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20240429112843.67628-7-wsa+renesas@sang-engineering.com>
References:
 <20240429112843.67628-1-wsa+renesas@sang-engineering.com>
 <20240429112843.67628-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 29. april 2024 ob 13:28:39 GMT +2 je Wolfram Sang napisal(a):
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/spi/spi-sun4i.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 11d8bd27b3e9..2ee6755b43f5 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -206,7 +206,8 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
>  				  struct spi_transfer *tfr)
>  {
>  	struct sun4i_spi *sspi = spi_controller_get_devdata(host);
> -	unsigned int mclk_rate, div, timeout;
> +	unsigned int mclk_rate, div;
> +	unsigned long time_left;
>  	unsigned int start, end, tx_time;
>  	unsigned int tx_len = 0;
>  	int ret = 0;
> @@ -327,10 +328,10 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
>  
>  	tx_time = max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
>  	start = jiffies;
> -	timeout = wait_for_completion_timeout(&sspi->done,
> -					      msecs_to_jiffies(tx_time));
> +	time_left = wait_for_completion_timeout(&sspi->done,
> +						msecs_to_jiffies(tx_time));
>  	end = jiffies;
> -	if (!timeout) {
> +	if (!time_left) {
>  		dev_warn(&host->dev,
>  			 "%s: timeout transferring %u bytes@%iHz for %i(%i)ms",
>  			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
> 




